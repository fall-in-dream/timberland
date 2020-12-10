package com.huang.timberland.domain;

public class IndentInfo {
    private long f_id;
    private long i_id;
    private int st_id;
    private int f_quantity;
    private Style style;

    public long getF_id() {
        return f_id;
    }

    public void setF_id(long f_id) {
        this.f_id = f_id;
    }

    public long getI_id() {
        return i_id;
    }

    public void setI_id(long i_id) {
        this.i_id = i_id;
    }

    public int getSt_id() {
        return st_id;
    }

    public void setSt_id(int st_id) {
        this.st_id = st_id;
    }

    public int getF_quantity() {
        return f_quantity;
    }

    public void setF_quantity(int f_quantity) {
        this.f_quantity = f_quantity;
    }

    public Style getStyle() {
        return style;
    }

    public void setStyle(Style style) {
        this.style = style;
    }
}
