package com.huang.timberland.domain;

public class ShoppingCartItem {
    private int sc_id;
    private int st_id;
    private int u_id;
    private int sc_num;
    private Style style;

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
    }

    public int getSt_id() {
        return st_id;
    }

    public void setSt_id(int st_id) {
        this.st_id = st_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public int getSc_num() {
        return sc_num;
    }

    public void setSc_num(int sc_num) {
        this.sc_num = sc_num;
    }

    public Style getStyle() {
        return style;
    }

    public void setStyle(Style style) {
        this.style = style;
    }
}
