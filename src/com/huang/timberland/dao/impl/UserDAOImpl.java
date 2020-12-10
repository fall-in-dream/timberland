package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.UserDAO;
import com.huang.timberland.domain.User;

public class UserDAOImpl extends BaseDAO<User> implements UserDAO {
    @Override
    public User getUser(String username) {
        String sql = "select u_id, u_account, u_password, u_balance, u_head from user where u_account = ?";
        return query(sql, username);
    }

    @Override
    public long createUser(User user) {
        String sql = "insert into user(u_account, u_password, u_balance, u_head) values (?,?,0,'upload/temp.jpg')";
        return insert(sql, user.getU_account(), user.getU_password());
    }

    @Override
    public void alterUser(User user) {
        String sql = "update user set u_account=?,u_password=?,u_balance=?,u_head=? where u_id=?";
        update(sql, user.getU_account(), user.getU_password(), user.getU_balance(),
                user.getU_head(), user.getU_id());
    }
}
