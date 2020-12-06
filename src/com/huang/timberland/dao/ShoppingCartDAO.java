package com.huang.timberland.dao;

import com.huang.timberland.domain.ShoppingCartItem;

import java.util.List;

public interface ShoppingCartDAO {

    /**
     * 根据款式和用户Id获取该用户Id购物车中此商品详情
     * @param styleId
     * @param userId
     * @return
     */
    public abstract ShoppingCartItem getShoppingCartItem(int userId, int styleId);

    public abstract void addToShoppingCartItemNum(int userId, int styleId);

    public abstract long addToShoppingCartItem(int userId, int styleId);

    public abstract long getShoppingCartItemNum(int userId);

    public abstract List<ShoppingCartItem> getShoppingCartAllItem(int userId);

    public abstract double getShoppingCartTotalMoney();

    public abstract double getShoppingCartItemMoney(int shoppingCartId);

    public abstract void alterQuantity(int shoppingCartId, int quantity);
}
