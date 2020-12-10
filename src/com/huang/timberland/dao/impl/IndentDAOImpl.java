package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.IndentDAO;
import com.huang.timberland.domain.Indent;

public class IndentDAOImpl extends BaseDAO<Indent> implements IndentDAO {
    @Override
    public long insert(Indent indent) {
        String sql = "insert into indent(u_id,i_num,i_time,i_state) values(?,?,?,?)";
        return insert(sql, indent.getU_id(), indent.getI_num(), indent.getI_time(), indent.getI_state());
    }
}
