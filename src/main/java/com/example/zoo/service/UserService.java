package com.example.zoo.service;

import com.example.zoo.dto.UserDTO;
import com.example.zoo.entity.User;
import com.example.zoo.enums.UserRole;
import com.example.zoo.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;

    public User authenticate(String email, String password) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Nieprawidłowy email lub hasło"));

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Nieprawidłowy email lub hasło");
        }

        return user;
    }

    @Transactional
    public User save(User user) {
        if (user.getId() == null) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));

            if (user.getRole() == null) {
                user.setRole(UserRole.USER);
            }
        }
        return userRepository.save(user);
    }

    /**
     * Registers a new user and sends an activation email.
     * The user's enabled flag is set to false until they activate their account.
     *
     * @param user the user to register
     * @return the registered user
     */
    @Transactional
    public User register(User user) {
        if (existsByEmail(user.getEmail())) {
            throw new RuntimeException("Użytkownik o podanym emailu już istnieje");
        }

        // Encode password
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        // Set default role if not provided
        if (user.getRole() == null) {
            user.setRole(UserRole.USER);
        }

        // Generate activation code
        String activationCode = UUID.randomUUID().toString();
        user.setActivationCode(activationCode);

        // User is not enabled until they activate their account
        user.setEnabled(false);
        user.setActive(true);

        // Save user to database
        User savedUser = userRepository.save(user);

        // Send activation email
        emailService.sendActivationEmail(user.getEmail(), activationCode);

        log.info("User registered: {} with activation code: {}", user.getEmail(), activationCode);

        return savedUser;
    }

    /**
     * Activates a user account using the activation code.
     *
     * @param activationCode the activation code
     * @return true if activation was successful, false otherwise
     */
    @Transactional
    public boolean activateUser(String activationCode) {
        return userRepository.findByActivationCode(activationCode)
                .map(user -> {
                    user.setEnabled(true);
                    user.setActivationCode(null);
                    userRepository.save(user);
                    log.info("User activated: {}", user.getEmail());
                    return true;
                })
                .orElse(false);
    }


    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    public Page<User> filterUsers(UserRole role, Boolean active, Pageable pageable) {
        return userRepository.filterUsers(role, active, pageable);
    }

    public Page<User> searchUsers(String query, Pageable pageable) {
        return userRepository.searchUsers(query, pageable);
    }


    @Transactional
    public User createUser(UserDTO userDTO) {
        if (existsByEmail(userDTO.getEmail())) {
            throw new RuntimeException("Użytkownik o podanym emailu już istnieje");
        }

        User user = new User();
        user.setEmail(userDTO.getEmail());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setPhone(userDTO.getPhone());
        user.setRole(userDTO.getRole() != null ? userDTO.getRole() : UserRole.USER);
        user.setActive(true);
        user.setEnabled(true); // Admin-created users are enabled immediately

        if (userDTO.getPassword() != null && !userDTO.getPassword().isBlank()) {
            user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        }

        return userRepository.save(user);
    }

    @Transactional
    public User updateUser(Long id, UserDTO userDTO) {
        User user = getUserById(id);

        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setPhone(userDTO.getPhone());
        user.setRole(userDTO.getRole());
        user.setActive(userDTO.isActive());

        if (!user.getEmail().equals(userDTO.getEmail())) {
            if (existsByEmail(userDTO.getEmail())) {
                throw new RuntimeException("Email jest już zajęty");
            }
            user.setEmail(userDTO.getEmail());
        }

        return userRepository.save(user);
    }

    @Transactional
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public long getNewUsersCount(LocalDateTime from, LocalDateTime to) {
        return userRepository.countByCreatedAtBetween(from, to);
    }

    @Transactional
    public void changePassword(Long id, String newPassword) {
        User user = getUserById(id);
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    @Transactional
    public void changePassword(String email, String currentPassword, String newPassword) {
        User user = getUserByEmail(email);
        if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
            throw new RuntimeException("Nieprawidłowe aktualne hasło");
        }
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    @Transactional
    public void toggleActive(Long id) {
        User user = getUserById(id);
        user.setActive(!user.isActive());
        userRepository.save(user);
    }

    @Transactional
    public void changeRole(Long id, UserRole role) {
        User user = getUserById(id);
        user.setRole(role);
        userRepository.save(user);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Nie znaleziono użytkownika o ID: " + id));
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Nie znaleziono użytkownika: " + email));
    }

    public long getTotalUsersCount() {
        return userRepository.count();
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    public byte[] generateUsersCsv() {
        List<User> users = userRepository.findAll();

        byte[] bom = new byte[]{(byte)0xEF, (byte)0xBB, (byte)0xBF};

        StringBuilder csvContent = new StringBuilder();
        csvContent.append("ID;Imię;Nazwisko;Email;Rola;Status\n");

        for (User user : users) {
            csvContent.append(user.getId()).append(";")
                    .append(user.getFirstName()).append(";")
                    .append(user.getLastName()).append(";")
                    .append(user.getEmail()).append(";")
                    .append(user.getRole() != null ? user.getRole().name() : "").append(";")
                    .append(user.isActive() ? "Aktywny" : "Nieaktywny")
                    .append("\n");
        }

        byte[] csvBytes = csvContent.toString().getBytes(StandardCharsets.UTF_8);

        ByteBuffer bb = ByteBuffer.allocate(bom.length + csvBytes.length);
        bb.put(bom);
        bb.put(csvBytes);

        return bb.array();
    }
}