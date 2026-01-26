package com.example.zoo.config;

import com.example.zoo.entity.Cart;
import com.example.zoo.entity.CartItem;
import com.example.zoo.entity.User;
import com.example.zoo.entity.UserCart;
import com.example.zoo.repository.UserCartRepository;
import com.example.zoo.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Set;

@Component
@RequiredArgsConstructor
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    private final UserRepository userRepository;
    private final UserCartRepository userCartRepository;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {

        User user = userRepository.findByEmail(authentication.getName()).orElse(null);

        if (user != null) {
            // Merge session cart to user cart
            HttpSession session = request.getSession(false);
            if (session != null) {
                Cart sessionCart = (Cart) session.getAttribute("cart");
                if (sessionCart != null && !sessionCart.isEmpty()) {
                    UserCart userCart = userCartRepository.findByUser(user)
                            .orElseGet(() -> {
                                UserCart newCart = new UserCart(user);
                                return userCartRepository.save(newCart);
                            });

                    for (CartItem item : sessionCart.getItems()) {
                        userCart.addItem(item.getProduct(), item.getQuantity());
                    }
                    userCartRepository.save(userCart);
                    session.removeAttribute("cart");
                }
            }
        }

        if (user != null && user.isAdmin()) {
            response.sendRedirect("/admin/main/dashboard");
        } else {
            response.sendRedirect("/");
        }
    }
}