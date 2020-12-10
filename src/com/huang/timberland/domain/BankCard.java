package com.huang.timberland.domain;

public class BankCard {
    long bc_id;
    String bc_account;
    long bc_balance;
    String bc_password;

    public long getBc_id() {
        return bc_id;
    }

    public void setBc_id(long bc_id) {
        this.bc_id = bc_id;
    }

    public String getBc_account() {
        return bc_account;
    }

    public void setBc_account(String bc_account) {
        this.bc_account = bc_account;
    }

    public long getBc_balance() {
        return bc_balance;
    }

    public void setBc_balance(long bc_balance) {
        this.bc_balance = bc_balance;
    }

    public String getBc_password() {
        return bc_password;
    }

    public void setBc_password(String bc_password) {
        this.bc_password = bc_password;
    }
}
