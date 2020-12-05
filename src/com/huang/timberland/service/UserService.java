package com.huang.timberland.service;

import com.huang.timberland.dao.UserDAO;
import com.huang.timberland.dao.impl.UserDAOImpl;
import com.huang.timberland.domain.User;

public class UserService {
    private UserDAO userDAO = new UserDAOImpl();

    public long createUser(User user) {
        return userDAO.createUser(user);
    }

    public User getUser(String username) {
        return userDAO.getUser(username);
    }
}
