package com.huang.timberland.service;

import com.huang.timberland.dao.ClothDAO;
import com.huang.timberland.dao.ShoppingCartDAO;
import com.huang.timberland.dao.StyleDAO;
import com.huang.timberland.dao.impl.ClothDAOImpl;
import com.huang.timberland.dao.impl.ShoppingCartImpl;
import com.huang.timberland.dao.impl.StyleDAOImpl;
import com.huang.timberland.domain.Cloth;
import com.huang.timberland.domain.ShoppingCartItem;
import com.huang.timberland.domain.Style;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

import java.util.List;

public class ClothService {

    private ClothDAO clothDAO = new ClothDAOImpl();
    private StyleDAO styleDAO = new StyleDAOImpl();
    private ShoppingCartDAO shoppingCartDAO = new ShoppingCartImpl();

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

    public ShoppingCartItem getShoppingCart(int userId, int styleId) {
        return shoppingCartDAO.getShoppingCartItem(userId, styleId);
    }

    public void addToShoppingCartItemNum(int userId, int styleId) {
        shoppingCartDAO.addToShoppingCartItemNum(userId, styleId);
    }

    public long addToShoppingCartItem(int userId, int styleId) {
        return shoppingCartDAO.addToShoppingCartItem(userId, styleId);
    }

    public long getShoppingCartItemNum(int userId) {
        return shoppingCartDAO.getShoppingCartItemNum(userId);
    }

    public List<ShoppingCartItem> getShoppingCartAllItem(int userId) {
        List<ShoppingCartItem> shoppingCartItems = shoppingCartDAO.getShoppingCartAllItem(userId);
        for (ShoppingCartItem shoppingCartItem: shoppingCartItems) {
            shoppingCartItem.setStyle(getStyle(shoppingCartItem.getSt_id()));
            shoppingCartItem.getStyle().setClothing(getCloth(shoppingCartItem.getStyle().getC_id()));
        }
        return shoppingCartItems;
    }

    public double getShoppingCartTotalMoney() {
        return shoppingCartDAO.getShoppingCartTotalMoney();
    }

    public double getShoppingCartItemMoney(int shoppingCartId) {
        return shoppingCartDAO.getShoppingCartItemMoney(shoppingCartId);
    }

    public void alterQuantity(int styleId, int quantity) {
        shoppingCartDAO.alterQuantity(styleId, quantity);
    }
}
