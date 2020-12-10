package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.BankCardDAO;
import com.huang.timberland.domain.BankCard;

import javax.management.Query;

public class BankCardDAOImpl extends BaseDAO<BankCard> implements BankCardDAO {

    @Override
    public void alterBalance(BankCard bankCard) {
        String sql = "update bank_card set bc_balance=bc_balance-? where bc_account=?";
        update(sql, bankCard.getBc_balance(), bankCard.getBc_account());
    }

    @Override
    public BankCard checkBankCard(BankCard bankCard) {
        String sql = "select * from bank_card where bc_account=? and bc_password=?";
        return query(sql, bankCard.getBc_account(), bankCard.getBc_password());
    }
}
