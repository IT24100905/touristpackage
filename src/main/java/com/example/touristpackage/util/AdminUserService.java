package com.example.touristpackage.util;

import com.example.touristpackage.entity.UserDetail;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AdminUserService {

    public static void updateUser(UserDetail updatedUser) {
        List<UserDetail> allUsers = getAllUsers();
        List<UserDetail> updatedUsers = new ArrayList<>();

        for (UserDetail user : allUsers) {
            if (user.getUsername().equals(updatedUser.getUsername())) {
                updatedUsers.add(updatedUser);
            } else {
                updatedUsers.add(user);
            }
        }

        saveAllUsers(updatedUsers);
    }

    public static UserDetail getUserByUsername(String username) {
        List<UserDetail> allUsers = getAllUsers();

        for (UserDetail user : allUsers) {
            if (user.getUsername().equals(username)) {
                return user;
            }
        }

        return null;
    }

    public static List<UserDetail> getAllUsers() {
        List<UserDetail> users = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.USER_DETAILS_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5) {
                    String username = parts[0].trim();
                    String fullname = parts[1].trim();
                    String contact = parts[2].trim();
                    String email = parts[3].trim();
                    String nic = parts[4].trim();

                    users.add(new UserDetail(username, fullname, contact, email, nic));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }

    public static List<UserDetail> searchUsers(String searchTerm) {
        List<UserDetail> allUsers = getAllUsers();
        List<UserDetail> matchingUsers = new ArrayList<>();

        String lowerCaseSearch = searchTerm.toLowerCase();

        for (UserDetail user : allUsers) {
            if (user.getUsername().toLowerCase().contains(lowerCaseSearch) ||
                    user.getFullname().toLowerCase().contains(lowerCaseSearch)) {
                matchingUsers.add(user);
            }
        }

        return matchingUsers;
    }

    private static void saveAllUsers(List<UserDetail> users) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.USER_DETAILS_FILE))) {
            for (UserDetail user : users) {
                writer.write(String.format("%s,%s,%s,%s,%s",
                        user.getUsername(),
                        user.getFullname(),
                        user.getContact(),
                        user.getEmail(),
                        user.getNic()));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}