package com.example.touristpackage.controller;

import com.example.touristpackage.util.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.example.touristpackage.entity.UserDetail;
import java.util.ArrayList;
import java.io.*;
import com.example.touristpackage.util.FilePathUtil;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");

        if (username != null && !username.isEmpty()) {
            // Delete the user
            deleteUser(username);
        }

        // Redirect back to manage users page
        response.sendRedirect("manageUsers");
    }

    private void deleteUser(String username) {
        List<UserDetail> allUsers = AdminUserService.getAllUsers();
        List<UserDetail> updatedUsers = new ArrayList<>();

        // Keep all users except the one to delete
        for (UserDetail user : allUsers) {
            if (!user.getUsername().equals(username)) {
                updatedUsers.add(user);
            }
        }

        // Save the updated list
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.USER_DETAILS_FILE))) {
            for (UserDetail user : updatedUsers) {
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

        // Also remove from users.txt (authentication file)
        try {
            File inputFile = new File(FilePathUtil.USER_FILE);
            File tempFile = new File(inputFile.getAbsolutePath() + ".tmp");

            BufferedReader reader = new BufferedReader(new FileReader(inputFile));
            BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));

            String line;
            while((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length > 0 && !parts[0].trim().equals(username)) {
                    writer.write(line);
                    writer.newLine();
                }
            }

            writer.close();
            reader.close();

            // Delete the original file
            inputFile.delete();

            // Rename the temp file
            tempFile.renameTo(inputFile);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}