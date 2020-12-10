package com.huang.timberland.dao;

import com.huang.timberland.domain.BankCard;

public interface BankCardDAO {
    /**
     * 修改银行卡余额
     * @param bankCard
     */
    public abstract void alterBalance(BankCard bankCard);

    /**
     * 验证银行卡号和密码是否正确
     * @param bankCard
     */
    public abstract BankCard checkBankCard(BankCard bankCard);
}
