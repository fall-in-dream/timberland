package com.huang.timberland.dao;

import com.huang.timberland.domain.Indent;
import com.huang.timberland.domain.IndentInfo;

import java.util.List;

public interface IndentInfoDAO {
    /**
     * 插入订单信息
     * @param indentInfo
     * @return
     */
    public abstract long insertIndentInfo(IndentInfo indentInfo);

    /**
     * 根据订单id获取订单详情
     * @param IndentId
     * @return
     */
    public abstract List<IndentInfo> getAllInfoByIndentId(long indentId);
}
