package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.IndentDAO;
import com.huang.timberland.dao.IndentInfoDAO;
import com.huang.timberland.domain.Indent;
import com.huang.timberland.domain.IndentInfo;

import java.util.List;

public class IndentInfoImpl extends BaseDAO<IndentInfo> implements IndentInfoDAO {

    @Override
    public long insertIndentInfo(IndentInfo indentInfo) {
        String sql = "insert into indentinfo(i_id,st_id,f_quantity) values(?,?,?)";
        return insert(sql, indentInfo.getI_id(), indentInfo.getSt_id(), indentInfo.getF_quantity());
    }

    @Override
    public List<IndentInfo> getAllInfoByIndentId(long indentId) {
        String sql = "select * from indentinfo where i_id = ?";
        return queryForList(sql, indentId);
    }
}
