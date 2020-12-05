package com.huang.timberland.domain;

public class Style {
    private int st_id;
    private int c_id;
    private String st_color;
    private String st_style;
    private Cloth clothing;
    private String st_image;

    public int getSt_id() {
        return st_id;
    }

    public void setSt_id(int st_id) {
        this.st_id = st_id;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getSt_color() {
        return st_color;
    }

    public void setSt_color(String st_color) {
        this.st_color = st_color;
    }

    public String getSt_style() {
        return st_style;
    }

    public void setSt_style(String st_style) {
        this.st_style = st_style;
    }

    public Cloth getClothing() {
        return clothing;
    }

    public void setClothing(Cloth clothing) {
        this.clothing = clothing;
    }

    public String getSt_image() {
        return st_image;
    }

    public void setSt_image(String st_image) {
        this.st_image = st_image;
    }
}
