package com.example.touristpackage.util;

import com.example.touristpackage.entity.BasicPackage;

import java.io.*;
import java.util.*;

public class BasicPackageUtil {

    public static List<BasicPackage> getAllPackages() {
        com.example.touristpackage.util.BasicPackageBST bst = new BasicPackageBST();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.BASIC_PACKAGES_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 6);
                if (parts.length == 6) {
                    BasicPackage pkg = new BasicPackage(
                            parts[0].trim(), parts[1].trim(), parts[2].trim(),
                            Integer.parseInt(parts[3].trim()),
                            Double.parseDouble(parts[4].trim()),
                            parts[5].trim()
                    );
                    bst.insert(pkg);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<BasicPackage> list = bst.inOrderTraversal();
        PackageSortUtil.quickSortByPrice(list);
        return list;
    }

    public static void savePackage(BasicPackage pkg) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_PACKAGES_FILE, true))) {
            writer.write(String.join(",", pkg.getId(), pkg.getName(), pkg.getDestination(),
                    String.valueOf(pkg.getDays()), String.valueOf(pkg.getPrice()), pkg.getDescription()));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static BasicPackage getPackageById(String id) {
        for (BasicPackage bp : getAllPackages()) {
            if (bp.getId().equals(id)) {
                return bp;
            }
        }
        return null;
    }

    public static String getPackageNameById(String id) {
        List<BasicPackage> packages = getAllPackages();
        for (BasicPackage p : packages) {
            if (p.getId().equals(id)) {
                return p.getName();
            }
        }
        return "Unknown Package";
    }


    public static void addPackage(BasicPackage bp) {
        savePackage(bp); // delegate to shared logic
    }

    public static void updatePackage(BasicPackage updated) {
        List<BasicPackage> all = getAllPackages();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_PACKAGES_FILE))) {
            for (BasicPackage bp : all) {
                if (bp.getId().equals(updated.getId())) {
                    bw.write(String.join(",", updated.getId(), updated.getName(), updated.getDestination(),
                            String.valueOf(updated.getDays()), String.valueOf(updated.getPrice()), updated.getDescription()));
                } else {
                    bw.write(String.join(",", bp.getId(), bp.getName(), bp.getDestination(),
                            String.valueOf(bp.getDays()), String.valueOf(bp.getPrice()), bp.getDescription()));
                }
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void deletePackage(String id) {
        List<BasicPackage> all = getAllPackages();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_PACKAGES_FILE))) {
            for (BasicPackage bp : all) {
                if (!bp.getId().equals(id)) {
                    bw.write(String.join(",", bp.getId(), bp.getName(), bp.getDestination(),
                            String.valueOf(bp.getDays()), String.valueOf(bp.getPrice()), bp.getDescription()));
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
