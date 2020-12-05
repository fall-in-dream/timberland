package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.StyleDAO;
import com.huang.timberland.domain.Style;

import java.util.List;

public class StyleDAOImpl extends BaseDAO<Style> implements StyleDAO {
    @Override
    public List<Style> getStyles(int clothId) {
        String sql = "select st_id,c_id,st_color,st_style,st_image from style where c_id = ?";
        return queryForList(sql, clothId);
    }

    @Override
    public Style getStyle(int styleId) {
        String sql = "select st_id,c_id,st_color,st_style,st_image from style where st_id = ?";
        return query(sql, styleId);
    }
}
