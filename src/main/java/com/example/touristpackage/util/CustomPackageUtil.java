package com.example.touristpackage.util;

import com.example.touristpackage.entity.CustomPackage;

import java.io.*;
import java.util.*;

public class CustomPackageUtil {

    public static List<CustomPackage> getAll() {
        List<CustomPackage> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.DESTINATION_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] p = line.split(",", -1);
                if (p.length == 3) {
                    list.add(new CustomPackage(p[0], Integer.parseInt(p[1]), Integer.parseInt(p[2])));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static CustomPackage getByCountry(String country) {
        for (CustomPackage cp : getAll()) {
            if (cp.getCountry().equalsIgnoreCase(country)) return cp;
        }
        return null;
    }

    public static void update(CustomPackage updated) {
        List<CustomPackage> all = getAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.DESTINATION_FILE))) {
            for (CustomPackage cp : all) {
                if (cp.getCountry().equalsIgnoreCase(updated.getCountry())) {
                    writer.write(String.join(",", updated.getCountry(), String.valueOf(updated.getFlightPrice()), String.valueOf(updated.getDayPrice())));
                } else {
                    writer.write(String.join(",", cp.getCountry(), String.valueOf(cp.getFlightPrice()), String.valueOf(cp.getDayPrice())));
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void delete(String country) {
        List<CustomPackage> all = getAll();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.DESTINATION_FILE))) {
            for (CustomPackage cp : all) {
                if (!cp.getCountry().equalsIgnoreCase(country)) {
                    writer.write(String.join(",", cp.getCountry(), String.valueOf(cp.getFlightPrice()), String.valueOf(cp.getDayPrice())));
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}