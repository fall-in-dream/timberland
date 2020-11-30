package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.ClothDAO;
import com.huang.timberland.dao.Dao;
import com.huang.timberland.domain.Cloth;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

import java.util.List;

public class ClothDaoImpl extends BaseDAO<Cloth> implements ClothDAO {

    @Override
    public Cloth getCloth(int id) {
        String sql = "select c_id,c_price,c_pic,c_describe,c_name from clothing where " +
                "id=?";
        return query(sql, id);
    }

    @Override
    public Page<Cloth> getPage(CriteriaCloth cc) {
        Page<Cloth> page = new Page<>(cc.getPageNo());
        page.setTotalItemNumber(getTotalClothNumber(cc));
        //校验page的合法性
        cc.setPageNo(page.getPageNo());
        page.setList(getPageList(cc, 6));
        return page;
    }

    /**
     * 分页逻辑,用LIMIT,从0开始
     *
     */
    //2.
    @Override
    public List<Cloth> getPageList(CriteriaCloth cc, int pageSize) {
        // TODO Auto-generated method stub
        String sql = "select c_id,c_price,c_pic,c_describe,c_name from clothing where " +
                "c_price between ? and ? limit ?,?";

        return queryForList(sql, cc.getMinPrice(),cc.getMaxPrice(),(cc.getPageNo() - 1)*pageSize,pageSize);
    }

    public long getTotalClothNumber(CriteriaCloth cc) {
        String sql = "select count(c_id) from clothing where c_price between ? and ?";
        return getSingleVal(sql, cc.getMinPrice(), cc.getMaxPrice());
    }
}
