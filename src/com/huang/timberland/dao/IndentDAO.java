package com.huang.timberland.dao;

import com.huang.timberland.domain.Indent;
import com.huang.timberland.domain.User;

import java.util.List;

public interface IndentDAO {
    /**
     * 添加订单
     * @param indent
     * @return
     */
    public abstract long insert(Indent indent);


    /**
     * 根据用户id获取订单
     * @return
     */
    public abstract List<Indent> getIndentsByUserId(int userId);

}
