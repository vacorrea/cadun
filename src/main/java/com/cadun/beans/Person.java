package com.cadun.beans;

import java.util.HashSet;
import java.util.Set;

public class Person {
    private int id;
    private String name;
    private Family activeFamily;
    private Set<Family> historicalFamilySet = new HashSet<Family>(); // make it sorted
}
