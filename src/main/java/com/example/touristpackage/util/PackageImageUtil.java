package com.example.touristpackage.util;

import java.io.*;
import java.util.*;

public class PackageImageUtil {
    private static final String FILE_PATH = FilePathUtil.PACKAGE_IMAGE_FILE;

    public static Map<String, String> getImageMap() {
        Map<String, String> map = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",", 2);
                if (parts.length == 2) {
                    map.put(parts[0].trim(), parts[1].trim());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }
}
