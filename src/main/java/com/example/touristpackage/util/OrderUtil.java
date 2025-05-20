package com.example.touristpackage.util;

import com.example.touristpackage.entity.BasicOrder;
import com.example.touristpackage.entity.Order;
import java.io.*;
import java.util.*;

public class OrderUtil {
    private static final String FILE_PATH = FilePathUtil.ORDER_FILE;

    static {
        File file = new File(FILE_PATH);
        try {
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void saveOrder(Order o) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(String.join(",",
                    o.getUsername(), o.getTitle(), o.getName(), o.getEmail(), o.getContact(), o.getNationality(),
                    String.valueOf(o.getAdults()), String.valueOf(o.getKids()), o.getArrival(),
                    String.valueOf(o.getDuration()), o.getCountry(), o.getMessage().replace(",", " "),
                    String.valueOf(o.getTotalCost()), o.getPaymentMethod(), o.getPaymentDate(),
                    o.getPaymentReference(), o.getStatus()
            ));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void saveBasicOrder(Order o) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_ORDER_FILE, true))) {
            writer.write(String.join(",",
                    o.getUsername(), o.getTitle(), o.getName(), o.getEmail(),
                    o.getContact(), o.getNationality(),
                    String.valueOf(o.getAdults()), String.valueOf(o.getKids()),
                    o.getArrival(), String.valueOf(o.getDuration()),
                    o.getCountry(), o.getMessage(),
                    String.valueOf(o.getTotalCost()), o.getPaymentMethod(),
                    o.getPaymentReference(), o.getPaymentDate(), o.getStatus() // ✅ 17 fields
            ));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    public static List<Order> getOrdersForUser(String username) {
        List<Order> all = new ArrayList<>();
        all.addAll(readCustomOrders(username));
        all.addAll(readBasicOrders(username));
        return all;
    }

    private static List<Order> readCustomOrders(String username) {
        List<Order> orders = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.ORDER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",", -1);
                if (p.length == 17 && p[0].equals(username)) {
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
    public static void saveAllOrdersAsBasic(List<Order> orders) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_ORDER_FILE))) {
            for (Order o : orders) {
                writer.write(String.join(",",
                        o.getUsername(), o.getTitle(), o.getName(), o.getEmail(),
                        o.getContact(), o.getNationality(),
                        String.valueOf(o.getAdults()), String.valueOf(o.getKids()),
                        o.getArrival(), String.valueOf(o.getDuration()),
                        o.getCountry(), o.getMessage(),
                        String.valueOf(o.getTotalCost()), o.getPaymentMethod(),
                        o.getPaymentReference(), o.getPaymentDate(), o.getStatus()
                ));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Order> getAllBasicOrders() {
        List<Order> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.BASIC_ORDER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",", -1);
                if (p.length == 17) {
                    list.add(new Order(
                            p[0],              // username
                            p[1],              // packageId (or title)
                            p[2],              // name
                            p[3],              // email
                            p[4],              // contact (optional)
                            p[5],              // nationality (optional)
                            Integer.parseInt(p[6]), // adults
                            Integer.parseInt(p[7]), // kids
                            p[8],              // arrival
                            Integer.parseInt(p[9]), // duration
                            p[10],             // country/packageName
                            p[11],             // message
                            Double.parseDouble(p[12]), // totalCost
                            p[13],             // method
                            p[15],             // paymentDate
                            p[14],             // reference
                            p[16]              // status
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }


    private static List<Order> readBasicOrders(String username) {
        List<Order> orders = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.BASIC_ORDER_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",", -1);
                if (p.length == 12 && p[0].equals(username)) {
                    orders.add(new Order(
                            p[0], "Basic Package", p[2], p[3], "N/A", "N/A",
                            Integer.parseInt(p[4]), Integer.parseInt(p[5]), p[6],
                            0, p[7], "Basic Package Booking", Double.parseDouble(p[8]),
                            p[9], p[11], p[10], "pending"
                    ));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return orders;
    }


    private static List<Order> readFromFile(String path, String username) {
        List<Order> orders = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(path))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",", -1);
                if (p.length == 17 && p[0].equals(username)) {
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

    public static void saveBasicOrder(BasicOrder order) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_ORDER_FILE, true))) {
            writer.write(String.join(",",
                    order.getUsername(),
                    order.getPackageId(),
                    order.getName(),
                    order.getEmail(),
                    String.valueOf(order.getAdults()),
                    String.valueOf(order.getKids()),
                    order.getArrivalDate(),
                    order.getPackageName(),
                    String.valueOf(order.getTotalCost()),
                    order.getPaymentMethod(),
                    order.getPaymentReference(),
                    order.getPaymentDate()
            ));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void saveAllBasicOrders(List<BasicOrder> orders) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_ORDER_FILE))) {
            for (BasicOrder order : orders) {
                writer.write(String.join(",",
                        order.getUsername(), order.getPackageId(), order.getName(), order.getEmail(),
                        String.valueOf(order.getAdults()), String.valueOf(order.getKids()),
                        order.getArrivalDate(), order.getPackageName(), String.valueOf(order.getTotalCost()),
                        order.getPaymentMethod(), order.getPaymentReference(), order.getPaymentDate(),
                        order.getStatus()
                ));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
