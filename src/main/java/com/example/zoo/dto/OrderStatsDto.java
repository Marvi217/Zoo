package com.example.zoo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class OrderStatsDto {
    private long total;           // Liczba zamówień
    private BigDecimal totalSpent; // Suma wydanych pieniędzy
}