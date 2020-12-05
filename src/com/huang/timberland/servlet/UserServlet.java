package com.huang.timberland.servlet;

import com.huang.timberland.domain.User;
import com.huang.timberland.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {

    UserService userService = new UserService();

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

    protected void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setU_account(username);
        user.setU_password(password);
        long id = userService.createUser(user);
        if (id != 0) {
            request.setAttribute("isSuccess", 1);
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    /**
     * 校验账号密码是否正确
     * @param request
     * @param response
     */
    protected void checkUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.getUser(username);
        if (user.getU_account().equals(username) && user.getU_password().equals(password)) {
            request.setAttribute("isSuccess", 1);
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            request.getRequestDispatcher("/ClothesServlet?method=getClothes").forward(request, response);
        } else {
            request.setAttribute("isSuccess", 2);
        }
    }

    protected void showRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/zhuce.jsp").forward(request, response);
    }

    //跳转页面
    protected void forwardPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        request.getRequestDispatcher(page + ".jsp").forward(request, response);
    }
}
