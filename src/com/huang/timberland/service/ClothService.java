package com.huang.timberland.service;

import com.huang.timberland.dao.*;
import com.huang.timberland.dao.impl.*;
import com.huang.timberland.domain.*;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;
import com.sun.xml.internal.bind.v2.runtime.output.IndentingUTF8XmlOutput;

import java.util.List;

public class ClothService {

    private ClothDAO clothDAO = new ClothDAOImpl();
    private StyleDAO styleDAO = new StyleDAOImpl();
    private ShoppingCartDAO shoppingCartDAO = new ShoppingCartImpl();
    private IndentDAO indentDAO = new IndentDAOImpl();
    private IndentInfoDAO indentInfoDAO = new IndentInfoImpl();
    private UserDAO userDAO = new UserDAOImpl();

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

    public double getShoppingCartTotalMoney(int userId) {
        return shoppingCartDAO.getShoppingCartTotalMoney(userId);
    }

    public double getShoppingCartItemMoney(int shoppingCartId) {
        return shoppingCartDAO.getShoppingCartItemMoney(shoppingCartId);
    }

    public void alterQuantity(int styleId, int quantity) {
        shoppingCartDAO.alterQuantity(styleId, quantity);
    }

    public void deleteShoppingItem(int shoppingCartItemId) {
        shoppingCartDAO.deleteShoppingCartItem(shoppingCartItemId);
    }

    public long createIndent(Indent indent) {
        return indentDAO.insert(indent);
    }

    public void deleteShoppingCart(int userId) {
        shoppingCartDAO.deleteShoppingCart(userId);
    }

    public void createIndentInfo(IndentInfo indentInfo) {
        indentInfoDAO.insertIndentInfo(indentInfo);
    }

    public boolean pay(User user) {
        double payMoney = user.getU_balance() - getShoppingCartTotalMoney(user.getU_id());
        if (payMoney < 0) {
            return false;
        } else {
            user.setU_balance((float)(payMoney));
            userDAO.alterUser(user);
            return true;
        }
    }

    public List<Indent> getIndentsByUserId(int userId) {
        return indentDAO.getIndentsByUserId(userId);
    }

    public List<IndentInfo> getAllInfoByIndentId(long indentId) {
        List<IndentInfo> indentInfos = indentInfoDAO.getAllInfoByIndentId(indentId);
        for (IndentInfo indentInfo: indentInfos) {
            indentInfo.setStyle(styleDAO.getStyle(indentInfo.getSt_id()));
            indentInfo.getStyle().setClothing(clothDAO.getCloth(indentInfo.getStyle().getC_id()));
            System.out.println(indentInfo.getStyle().getClothing());
        }
        return indentInfos;
    }
}
