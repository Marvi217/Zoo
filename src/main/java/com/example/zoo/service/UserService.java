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

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

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

    // ==================== WYSZUKIWANIE I FILTROWANIE ====================

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

    // ==================== OPERACJE CRUD (Zgodne z UserDTO i User Entity) ====================

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

        // Zmiana emaila (tylko jeśli jest unikalny)
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

    /**
     * Zlicza nowych użytkowników zarejestrowanych w podanym okresie
     */
    public long getNewUsersCount(LocalDateTime from, LocalDateTime to) {
        return userRepository.countByCreatedAtBetween(from, to);
    }

    /**
     * Zlicza użytkowników, którzy zalogowali się dzisiaj (od północy)
     */

    // ==================== ZARZĄDZANIE HASŁEM ====================

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

    // ==================== ZARZĄDZANIE STATUSEM I ROLĄ ====================

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

    // ==================== POMOCNICZE ====================

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

    // W UserService.java

    public Page<User> getAllUsers(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    public byte[] generateUsersCsv() {
        List<User> users = userRepository.findAll();

        // Dodanie BOM dla UTF-8, aby Excel poprawnie czytał polskie znaki
        byte[] bom = new byte[]{(byte)0xEF, (byte)0xBB, (byte)0xBF};

        StringBuilder csvContent = new StringBuilder();
        // Nagłówki (używamy średnika dla polskiej wersji Excela)
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

        // Łączymy BOM z danymi CSV
        ByteBuffer bb = ByteBuffer.allocate(bom.length + csvBytes.length);
        bb.put(bom);
        bb.put(csvBytes);

        return bb.array();
    }
}