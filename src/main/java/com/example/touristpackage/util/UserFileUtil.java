package com.example.touristpackage.util;

import com.example.touristpackage.entity.User;
import java.io.*;

public class UserFileUtil {
    public static User authenticate(String username, String password) {
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String fileUsername = parts[0].trim();
                    String filePassword = parts[1].trim();
                    String role = parts[2].trim();
                    if (fileUsername.equals(username) && filePassword.equals(password)) {
                        return new User(fileUsername, filePassword, role);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
