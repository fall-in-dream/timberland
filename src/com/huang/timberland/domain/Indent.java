package com.huang.timberland.domain;

import java.sql.Time;
import java.sql.Timestamp;

public class Indent {
    long i_id;
    int u_id;
    String i_num;
    Timestamp i_time;
    int i_state;
    double i_money;

    public long getI_id() {
        return i_id;
    }

    public void setI_id(long i_id) {
        this.i_id = i_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getI_num() {
        return i_num;
    }

    public void setI_num(String i_num) {
        this.i_num = i_num;
    }

    public Timestamp getI_time() {
        return i_time;
    }

    public void setI_time(Timestamp i_time) {
        this.i_time = i_time;
    }

    public int getI_state() {
        return i_state;
    }

    public void setI_state(int i_state) {
        this.i_state = i_state;
    }

    public double getI_money() {
        return i_money;
    }

    public void setI_money(double i_money) {
        this.i_money = i_money;
    }
}
