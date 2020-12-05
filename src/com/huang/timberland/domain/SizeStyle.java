package com.huang.timberland.domain;

public class SizeStyle {
    private int ss_id;
    private int si_id;
    private int st_id;
    private int ss_num;
    private int ss_repo;
    private Size size;
    private Style style;

    public int getSs_id() {
        return ss_id;
    }

    public void setSs_id(int ss_id) {
        this.ss_id = ss_id;
    }

    public int getSi_id() {
        return si_id;
    }

    public void setSi_id(int si_id) {
        this.si_id = si_id;
    }

    public int getSt_id() {
        return st_id;
    }

    public void setSt_id(int st_id) {
        this.st_id = st_id;
    }

    public int getSs_num() {
        return ss_num;
    }

    public void setSs_num(int ss_num) {
        this.ss_num = ss_num;
    }

    public int getSs_repo() {
        return ss_repo;
    }

    public void setSs_repo(int ss_repo) {
        this.ss_repo = ss_repo;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Style getStyle() {
        return style;
    }

    public void setStyle(Style style) {
        this.style = style;
    }
}
