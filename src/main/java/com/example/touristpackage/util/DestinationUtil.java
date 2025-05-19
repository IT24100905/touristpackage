package com.example.touristpackage.util;

import java.io.*;
import java.util.*;

public class DestinationUtil {
    public static Map<String, int[]> getDestinationData() {
        Map<String, int[]> data = new LinkedHashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FilePathUtil.DESTINATION_FILE))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    String country = parts[0].trim();
                    int flightPrice = Integer.parseInt(parts[1].trim());
                    int dayPrice = Integer.parseInt(parts[2].trim());
                    data.put(country, new int[]{flightPrice, dayPrice});
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return data;
    }
}
