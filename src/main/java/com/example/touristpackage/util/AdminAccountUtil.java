package com.example.touristpackage.util;

import java.io.*;
import java.util.*;

public class AdminAccountUtil {

    public static List<String[]> getAllAdmins() {
        List<String[]> admins = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", -1);
                if (parts.length == 3 && parts[2].equalsIgnoreCase("admin")) {
                    admins.add(parts); // [username, password, admin]
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return admins;
    }

    public static void deleteAdmin(String username) {
        List<String[]> all = getAllUsers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.USER_FILE))) {
            for (String[] user : all) {
                if (!user[0].equals(username) || !user[2].equalsIgnoreCase("admin")) {
                    writer.write(String.join(",", user));
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void updateAdminPassword(String username, String newPassword) {
        List<String[]> all = getAllUsers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.USER_FILE))) {
            for (String[] user : all) {
                if (user[0].equals(username) && user[2].equalsIgnoreCase("admin")) {
                    writer.write(String.join(",", username, newPassword, "admin"));
                } else {
                    writer.write(String.join(",", user));
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static List<String[]> getAllUsers() {
        List<String[]> users = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.USER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                users.add(line.split(",", -1));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }
}