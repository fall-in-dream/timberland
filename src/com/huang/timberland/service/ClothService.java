package com.huang.timberland.service;

import com.huang.timberland.dao.ClothDAO;
import com.huang.timberland.dao.impl.ClothDaoImpl;
import com.huang.timberland.domain.Cloth;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

public class ClothService {

    private ClothDAO clothDAO = new ClothDaoImpl();

    public Cloth getCloth(int id) {
        return clothDAO.getCloth(id);
    }

    public Page<Cloth> getPage(CriteriaCloth cc) {
        return clothDAO.getPage(cc);
    }
}
