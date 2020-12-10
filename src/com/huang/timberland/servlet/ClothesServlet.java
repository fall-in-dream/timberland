package com.huang.timberland.servlet;

import com.google.gson.Gson;
import com.huang.timberland.domain.*;
import com.huang.timberland.service.ClothService;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ClothesServlet", urlPatterns = "/ClothesServlet")
public class ClothesServlet extends HttpServlet {

    private ClothService clothService = new ClothService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String methodName = request.getParameter("method");

        try {
            // 利用反射获取方法
            Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
            // 执行相应的方法
            method.setAccessible(true);
            method.invoke(this, request,response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void getClothes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageNoStr = request.getParameter("pageNo");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");

        int pageNo = 1;
        int minPrice = 0;
        int maxPrice = Integer.MAX_VALUE;


        try {
            pageNo = Integer.parseInt(pageNoStr);
        } catch (NumberFormatException e) {}

        try {
            minPrice = Integer.parseInt(minPriceStr);
        } catch (NumberFormatException e) {}

        try {
            maxPrice = Integer.parseInt(maxPriceStr);
        } catch (NumberFormatException e) {}

        CriteriaCloth criteriaCloth = new CriteriaCloth(minPrice, maxPrice, pageNo);
        Page<Cloth> page = clothService.getPage(criteriaCloth);

        request.setAttribute("clothpage", page);
        request.getRequestDispatcher("/nanshifuzhuang.jsp").forward(request, response);
    }

    protected void getCloth(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idStr = request.getParameter("id");
        int id = -1;
        Cloth cloth = null;

        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {}
        if (id > 0) {
            cloth = clothService.getCloth(id);
        }

        if (cloth == null) {
            response.sendRedirect(request.getContextPath()+"/error-1.jsp");
            return;
        }
        List<Style> styleList = clothService.getStyles(cloth.getC_id());
        request.setAttribute("styleList", styleList);
        request.setAttribute("cloth", cloth);

        request.getRequestDispatcher("/cloth.jsp").forward(request, response);
    }

    //获取切换后的衣服款式的图片和型号
    protected void updateCloth(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int styleId = Integer.parseInt(request.getParameter("id"));
        Style style = clothService.getStyle(styleId);
        // 传回json数据
        Map<String, Object> result = new HashMap<>();
        result.put("styleNum", style.getSt_style());
        result.put("picPath", style.getSt_image());
        Gson gson = new Gson();
        String jsonStr = gson.toJson(result);
        response.setContentType("text/javascript");
        response.getWriter().print(jsonStr);
    }

    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int styleId = Integer.parseInt(request.getParameter("styleId"));
        ShoppingCartItem shoppingCartItem = clothService.getShoppingCart(userId, styleId);
        if (shoppingCartItem != null) {
            clothService.addToShoppingCartItemNum(userId, styleId);
            request.setAttribute("isSuccess", 1);
        } else {
            if (clothService.addToShoppingCartItem(userId, styleId) > 0) {
                request.setAttribute("isSuccess", 1);
            }
        }
        HttpSession session = request.getSession();
        long itemNum = clothService.getShoppingCartItemNum(((User)session.getAttribute("user")).getU_id());
        session.setAttribute("itemNum", itemNum);
        getCloth(request, response);
    }

    protected void userInfoInit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        long itemNum = clothService.getShoppingCartItemNum(((User)session.getAttribute("user")).getU_id());
        session.setAttribute("itemNum", itemNum);
        getClothes(request, response);
    }

    protected void getShoppingCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute("user");
        List<ShoppingCartItem> shoppingCartItems = clothService.getShoppingCartAllItem(user.getU_id());
        request.setAttribute("shoppingCartItems", shoppingCartItems);
        request.setAttribute("money", clothService.getShoppingCartTotalMoney(user.getU_id()));
        request.getRequestDispatcher("/gouwuche.jsp").forward(request, response);
    }

    protected void updateItemQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int shoppingCartId = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        User user = (User)request.getSession().getAttribute("user");
        clothService.alterQuantity(shoppingCartId, quantity);
        double itemMoney = clothService.getShoppingCartItemMoney(shoppingCartId);
        double totalMoney = clothService.getShoppingCartTotalMoney(user.getU_id());
        HttpSession session = request.getSession();
        long itemNum = clothService.getShoppingCartItemNum(((User)session.getAttribute("user")).getU_id());
        session.setAttribute("itemNum", itemNum);
        // 传回json数据
        Map<String, Object> result = new HashMap<>();
        result.put("itemMoney", itemMoney);
        result.put("totalMoney", totalMoney);
        result.put("itemNum", itemNum);
        Gson gson = new Gson();
        String jsonStr = gson.toJson(result);
        response.setContentType("text/javascript");
        response.getWriter().print(jsonStr);
    }

    protected void deleteShoppingCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int shoppingCartItemId = Integer.parseInt(request.getParameter("shoppingCartItemId"));
        clothService.deleteShoppingItem(shoppingCartItemId);
        HttpSession session = request.getSession();
        long itemNum = clothService.getShoppingCartItemNum(((User)session.getAttribute("user")).getU_id());
        session.setAttribute("itemNum", itemNum);
        getShoppingCart(request, response);
    }

    protected void settleAccounts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User)request.getSession().getAttribute("user");
        boolean isSuccess = clothService.pay(user);
        if (isSuccess) {
            List<ShoppingCartItem> shoppingCartItems = clothService.getShoppingCartAllItem(user.getU_id());
            Indent indent = new Indent();
            indent.setI_num(String.valueOf(System.currentTimeMillis()));
            indent.setI_state('0');
            indent.setU_id(user.getU_id());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar calendar = Calendar.getInstance();
            indent.setI_time(Timestamp.valueOf(sdf.format(calendar.getTime())));
            indent.setI_id(clothService.createIndent(indent));
            clothService.deleteShoppingCart(user.getU_id());
            IndentInfo indentInfo = new IndentInfo();
            for (ShoppingCartItem shoppingCartItem: shoppingCartItems) {
                indentInfo.setF_quantity(shoppingCartItem.getSc_num());
                indentInfo.setI_id(indent.getI_id());
                indentInfo.setSt_id(shoppingCartItem.getSt_id());
                clothService.createIndentInfo(indentInfo);
            }
            request.setAttribute("isSuccess", 2);
            userInfoInit(request, response);
        } else {
            request.setAttribute("isSuccess", -1);
            userInfoInit(request, response);
        }
    }
}
