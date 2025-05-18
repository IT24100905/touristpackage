package com.example.touristpackage.util;

import com.example.touristpackage.entity.BasicPackage;
import java.util.*;

public class PackageSortUtil {

    // 🔁 Original: Hardcoded per-day rates for estimated cost
    private static final Map<String, Integer> countryDayRates = new HashMap<>();

    static {
        countryDayRates.put("Sri Lanka", 15000);
        countryDayRates.put("Japan", 25000);
        countryDayRates.put("Egypt", 20000);
        countryDayRates.put("Spain", 22000);
        countryDayRates.put("Italy", 24000);
        countryDayRates.put("Thailand", 18000);
    }

    // ✅ Original: Sort by estimated cost
    public static void quickSortByCost(List<BasicPackage> list) {
        quickSortByCost(list, 0, list.size() - 1);
    }

    private static void quickSortByCost(List<BasicPackage> list, int low, int high) {
        if (low < high) {
            int pivotIdx = partitionByCost(list, low, high);
            quickSortByCost(list, low, pivotIdx - 1);
            quickSortByCost(list, pivotIdx + 1, high);
        }
    }

    private static int partitionByCost(List<BasicPackage> list, int low, int high) {
        double pivotCost = calculateCost(list.get(high));
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (calculateCost(list.get(j)) < pivotCost) {
                i++;
                Collections.swap(list, i, j);
            }
        }
        Collections.swap(list, i + 1, high);
        return i + 1;
    }

    // ✅ Original: Calculate cost based on hardcoded rates
    public static double calculateCost(BasicPackage pkg) {
        int rate = countryDayRates.getOrDefault(pkg.getDestination(), 20000);
        return rate * pkg.getDays();
    }

    // ✅ NEW: Quick sort based on actual price field
    public static void quickSortByPrice(List<BasicPackage> list) {
        quickSortByPrice(list, 0, list.size() - 1);
    }

    private static void quickSortByPrice(List<BasicPackage> list, int low, int high) {
        if (low < high) {
            int pivot = partitionByPrice(list, low, high);
            quickSortByPrice(list, low, pivot - 1);
            quickSortByPrice(list, pivot + 1, high);
        }
    }

    private static int partitionByPrice(List<BasicPackage> list, int low, int high) {
        double pivot = list.get(high).getPrice();
        int i = low - 1;

        for (int j = low; j < high; j++) {
            if (list.get(j).getPrice() < pivot) {
                i++;
                Collections.swap(list, i, j);
            }
        }
        Collections.swap(list, i + 1, high);
        return i + 1;
    }
}
