package com.example.touristpackage.util;

import com.example.touristpackage.entity.Order;

import java.io.*;
import java.util.*;

public class AdminOrderService {

    public static List<Order> getAllCustomOrders() {
        return readFromFile(FilePathUtil.ORDER_FILE);
    }

    public static List<Order> getAllBasicOrders() {
        return readFromFile(FilePathUtil.BASIC_ORDER_FILE);
    }

    public static List<Order> readFromFile(String path) {
        List<Order> orders = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",", -1);
                if (p.length == 17) {
                    orders.add(new Order(
                            p[0], p[1], p[2], p[3], p[4], p[5],
                            Integer.parseInt(p[6]), Integer.parseInt(p[7]), p[8],
                            Integer.parseInt(p[9]), p[10], p[11], Double.parseDouble(p[12]),
                            p[13], p[14], p[15], p[16]
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public static void updateOrderStatus(String username, String filePath, String reference, String newStatus) {
        List<Order> orders = readFromFile(filePath);
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Order o : orders) {
                if (o.getUsername().equals(username) && o.getPaymentReference().equals(reference)) {
                    o.setStatus(newStatus);
                }
                writer.write(String.join(",", o.getUsername(), o.getTitle(), o.getName(), o.getEmail(), o.getContact(),
                        o.getNationality(), String.valueOf(o.getAdults()), String.valueOf(o.getKids()), o.getArrival(),
                        String.valueOf(o.getDuration()), o.getCountry(), o.getMessage().replace(",", " "),
                        String.valueOf(o.getTotalCost()), o.getPaymentMethod(), o.getPaymentDate(), o.getPaymentReference(), o.getStatus()));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
