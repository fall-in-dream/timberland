package com.huang.timberland.servlet;

import com.google.gson.Gson;
import com.huang.timberland.domain.Cloth;
import com.huang.timberland.domain.Style;
import com.huang.timberland.service.ClothService;
import com.huang.timberland.web.CriteriaCloth;
import com.huang.timberland.web.Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
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



}
