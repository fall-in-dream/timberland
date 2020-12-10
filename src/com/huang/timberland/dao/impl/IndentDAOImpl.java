package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.IndentDAO;
import com.huang.timberland.domain.Indent;

import java.util.List;

public class IndentDAOImpl extends BaseDAO<Indent> implements IndentDAO {
    @Override
    public long insert(Indent indent) {
        String sql = "insert into indent(u_id,i_num,i_time,i_state,i_money) values(?,?,?,?,?)";
        return insert(sql, indent.getU_id(), indent.getI_num(), indent.getI_time(),
                indent.getI_state(), indent.getI_money());
    }

    @Override
    public List<Indent> getIndentsByUserId(int userId) {
        String sql = "select * from indent where u_id = ? order by i_time desc";
        return queryForList(sql, userId);
    }


}
