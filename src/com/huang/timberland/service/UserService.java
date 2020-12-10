package com.huang.timberland.service;

import com.huang.timberland.dao.BankCardDAO;
import com.huang.timberland.dao.UserDAO;
import com.huang.timberland.dao.impl.BankCardDAOImpl;
import com.huang.timberland.dao.impl.UserDAOImpl;
import com.huang.timberland.domain.BankCard;
import com.huang.timberland.domain.User;

public class UserService {
    private UserDAO userDAO = new UserDAOImpl();
    private BankCardDAO bankCardDAO = new BankCardDAOImpl();

    public long createUser(User user) {
        return userDAO.createUser(user);
    }

    public User getUser(String username) {
        return userDAO.getUser(username);
    }

    public BankCard checkBankcard(BankCard bankCard) {
        return bankCardDAO.checkBankCard(bankCard);
    }

    public void alterBalance(User user, BankCard bankCard) {
        userDAO.alterUser(user);
        bankCardDAO.alterBalance(bankCard);
    }
}
