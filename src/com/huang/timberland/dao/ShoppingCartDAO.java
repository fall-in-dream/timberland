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

    /**
     * 根据款式和用户Id增加购物车单项商品的数量
     * @param userId
     * @param styleId
     */
    public abstract void addToShoppingCartItemNum(int userId, int styleId);

    /**
     * 增加购物车之前没有的商品
     * @param userId
     * @param styleId
     * @return
     */
    public abstract long addToShoppingCartItem(int userId, int styleId);

    /**
     * 获取购物车单个商品总类的数量
     * @param userId
     * @return
     */
    public abstract long getShoppingCartItemNum(int userId);

    /**
     * 获取购物车所有商品
     * @param userId
     * @return
     */
    public abstract List<ShoppingCartItem> getShoppingCartAllItem(int userId);

    /**
     * 获取购物车所有商品的总价
     * @param userId
     * @return
     */
    public abstract double getShoppingCartTotalMoney(int userId);

    /**
     * 获取购物车单个商品种类的总价
     * @param shoppingCartItemId
     * @return
     */
    public abstract double getShoppingCartItemMoney(int shoppingCartItemId);

    /**
     * 修改购物车单项商品种类数量
     * @param shoppingCartItemId
     * @param quantity
     */
    public abstract void alterQuantity(int shoppingCartItemId, int quantity);

    /**
     * 删除购物车的里单项商品的种类
     * @param shoppingCartItemId
     */
    public abstract void deleteShoppingCartItem(int shoppingCartItemId);

    /**
     * 删除购物车的所有商品
     * @param userId
     */
    public abstract void deleteShoppingCart(int userId);
}
