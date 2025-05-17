package com.example.touristpackage.util;

import com.example.touristpackage.entity.BasicPackage;

import java.util.*;

public class BasicPackageBST {

    private static class Node {
        BasicPackage data;
        Node left, right;

        Node(BasicPackage data) {
            this.data = data;
        }
    }

    private Node root;

    public void insert(BasicPackage pkg) {
        root = insertRecursive(root, pkg);
    }

    private Node insertRecursive(Node node, BasicPackage pkg) {
        if (node == null) return new Node(pkg);
        int cmp = pkg.getId().compareTo(node.data.getId());
        if (cmp < 0) node.left = insertRecursive(node.left, pkg);
        else if (cmp > 0) node.right = insertRecursive(node.right, pkg);
        return node;
    }

    public List<BasicPackage> inOrderTraversal() {
        List<BasicPackage> result = new ArrayList<>();
        inOrder(root, result);
        return result;
    }

    private void inOrder(Node node, List<BasicPackage> list) {
        if (node != null) {
            inOrder(node.left, list);
            list.add(node.data);
            inOrder(node.right, list);
        }
    }
}
