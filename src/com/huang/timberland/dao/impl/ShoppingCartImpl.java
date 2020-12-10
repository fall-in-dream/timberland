package com.huang.timberland.dao.impl;

import com.huang.timberland.dao.ShoppingCartDAO;
import com.huang.timberland.domain.ShoppingCartItem;

import java.util.List;

public class ShoppingCartImpl extends BaseDAO<ShoppingCartItem> implements ShoppingCartDAO {

    @Override
    public ShoppingCartItem getShoppingCartItem(int userId, int styleId) {
        String sql = "select sc_id,st_id,u_id,sc_num from shopping_cart where st_id=? and u_id=?";
        return query(sql, styleId, userId);
    }

    @Override
    public void addToShoppingCartItemNum(int userId, int styleId) {
        String sql = "update shopping_cart set sc_num = sc_num + 1 where u_id=? and st_id=?";
        insert(sql, userId, styleId);
    }

    @Override
    public long addToShoppingCartItem(int userId, int styleId) {
        String sql = "insert into shopping_cart(st_id,u_id,sc_num) values(?,?,1)";
        return insert(sql, styleId, userId);
    }

    @Override
    public long getShoppingCartItemNum(int userId) {
        String sql = "select sum(sc_num) from shopping_cart where u_id = ? group by u_id";
        if (getSingleVal(sql, userId) == null) {
            return 0;
        } else return Long.parseLong(getSingleVal(sql, userId).toString());
    }

    @Override
    public List<ShoppingCartItem> getShoppingCartAllItem(int userId) {
        String sql = "select sc_id,st_id,u_id,sc_num from shopping_cart where u_id=?";
        return queryForList(sql, userId);
    }

    @Override
    public double getShoppingCartTotalMoney(int userId) {
        String sql = "select sum(sc_num * c_price) from shopping_cart,clothing,style where shopping_cart.st_id = style.st_id and style.c_id = clothing.c_id and " +
                "shopping_cart.u_id=?";

        if (getSingleVal(sql, userId) == null) {
            return 0;
        } else {
            return getSingleVal(sql, userId);
        }
    }

    @Override
    public double getShoppingCartItemMoney(int shoppingCartId) {
        String sql = "select sc_num * c_price from shopping_cart,clothing,style where shopping_cart.st_id = style.st_id" +
                " and style.c_id = clothing.c_id and sc_id = ?";
        return getSingleVal(sql, shoppingCartId);
    }

    @Override
    public void alterQuantity(int shoppingCartId, int quantity) {
        String sql = "update shopping_cart set sc_num = ? where sc_id = ?";
        update(sql, quantity, shoppingCartId);
    }

    @Override
    public void deleteShoppingCartItem(int shoppingCartItemId) {
        String sql = "delete from shopping_cart where sc_id = ?";
        update(sql, shoppingCartItemId);
    }

    @Override
    public void deleteShoppingCart(int userId) {
        String sql = "delete from shopping_cart where u_id = ?";
        update(sql, userId);
    }

}
