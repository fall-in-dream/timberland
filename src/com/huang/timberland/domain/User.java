package com.huang.timberland.domain;

public class User {

    private int u_id;

    private String u_account;

    private String u_password;

    private float u_balance;

    private String u_head;

    public String getU_account() {
        return u_account;
    }

    public void setU_account(String u_account) {
        this.u_account = u_account;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public float getU_balance() {
        return u_balance;
    }

    public void setU_balance(float u_balance) {
        this.u_balance = u_balance;
    }

    public String getU_head() {
        return u_head;
    }

    public void setU_head(String u_head) {
        this.u_head = u_head;
    }
}
