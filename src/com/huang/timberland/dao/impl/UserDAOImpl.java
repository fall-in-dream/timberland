package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.UserDAO;
import com.huang.timberland.domain.User;

public class UserDAOImpl extends BaseDAO<User> implements UserDAO {
    @Override
    public User getUser(String username) {
        String sql = "select u_id, u_account, u_password, u_balance from user where u_account = ?";
        return query(sql, username);
    }

    @Override
    public long createUser(User user) {
        String sql = "insert into user(u_account, u_password, u_balance) values (?,?,0)";
        return insert(sql, user.getU_account(), user.getU_password());
    }
}
