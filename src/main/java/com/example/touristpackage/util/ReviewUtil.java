package com.example.touristpackage.util;

import com.example.touristpackage.entity.Review;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewUtil {

    public static List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String path = FilePathUtil.REVIEW_FILE;

        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length == 4) {
                    String username = parts[0].trim();
                    String date = parts[1].trim();
                    String reviewText = parts[2].trim();
                    int rating = Integer.parseInt(parts[3].trim());
                    reviews.add(new Review(username, date, rating, reviewText));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public static void saveReview(Review review) {
        String path = FilePathUtil.REVIEW_FILE;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, true))) {
            writer.write(String.join(",", review.getUsername(), review.getDate(),
                    review.getReviewText(), String.valueOf(review.getRating())));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteReview(String username, String date) {
        String path = FilePathUtil.REVIEW_FILE;
        File inputFile = new File(path);
        File tempFile = new File(path + ".tmp");

        boolean foundReview = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
             BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile))) {

            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 4);
                if (parts.length == 4) {
                    String fileUsername = parts[0].trim();
                    String fileDate = parts[1].trim();

                    // Check if this is the review to delete
                    if (fileUsername.equals(username) && fileDate.equals(date)) {
                        foundReview = true;
                        continue; // Skip this line (delete the review)
                    }
                }

                // Write all other lines to the temp file
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        // Only perform the file swap if we found at least one review to delete
        if (foundReview) {
            if (!inputFile.delete()) {
                return false;
            }
            return tempFile.renameTo(inputFile);
        } else {
            // If no reviews were deleted, just delete the temp file
            tempFile.delete();
            return false;
        }
    }
}