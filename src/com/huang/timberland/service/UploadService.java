package com.huang.timberland.service;

import com.huang.timberland.dao.UserDAO;
import com.huang.timberland.dao.impl.UserDAOImpl;
import com.huang.timberland.domain.User;

public class UploadService {

    UserDAO userDAO = new UserDAOImpl();

    public void alterUser(User user) {
        userDAO.alterUser(user);
    }

}
