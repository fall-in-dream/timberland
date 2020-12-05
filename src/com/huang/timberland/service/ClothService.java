package com.huang.timberland.service;

import com.huang.timberland.dao.ClothDAO;
import com.huang.timberland.dao.StyleDAO;
import com.huang.timberland.dao.impl.ClothDAOImpl;
import com.huang.timberland.dao.impl.StyleDAOImpl;
import com.huang.timberland.domain.Cloth;
import com.huang.timberland.domain.Style;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

import java.util.List;

public class ClothService {

    private ClothDAO clothDAO = new ClothDAOImpl();
    private StyleDAO styleDAO = new StyleDAOImpl();

    public Style getStyle(int styleId) {
        return styleDAO.getStyle(styleId);
    }

    public Cloth getCloth(int id) {
        return clothDAO.getCloth(id);
    }

    public List<Style> getStyles(int clothId) {
        return styleDAO.getStyles(clothId);
    }
    public Page<Cloth> getPage(CriteriaCloth cc) {
        return clothDAO.getPage(cc);
    }
}
