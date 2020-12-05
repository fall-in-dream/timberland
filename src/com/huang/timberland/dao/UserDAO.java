package com.huang.timberland.dao;

import com.huang.timberland.domain.User;

public interface UserDAO {
    /**
     * 根据用户名获取用户对象
     * @param username
     * @return
     */
    public abstract User getUser(String username);

    /**
     * 创建用户
     * @param user
     * @return
     */
    public abstract long createUser(User user);
}
