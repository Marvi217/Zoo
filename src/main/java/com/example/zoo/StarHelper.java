package com.example.zoo;

public class StarHelper {

    public String getFilledStarsWidth(Double rating) {
        if (rating == null || rating < 0) return "0%";
        if (rating > 5) rating = 5.0;
        return (rating * 20) + "%";
    }

    public Integer getRatingAsInteger(Double rating) {
        return rating != null ? (int) Math.round(rating) : 0;
    }

    public String getStars(Integer rating) {
        if (rating == null || rating < 0) rating = 0;
        if (rating > 5) rating = 5;
        return "★".repeat(rating) + "☆".repeat(5 - rating);
    }
}