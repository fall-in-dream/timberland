package com.huang.timberland.dao;

import com.huang.timberland.domain.IndentInfo;

public interface IndentInfoDAO {
    /**
     * 插入订单信息
     * @param indentInfo
     * @return
     */
    public abstract long insertIndentInfo(IndentInfo indentInfo);
}
