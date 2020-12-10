package com.huang.timberland.servlet;

import com.google.gson.Gson;
import com.huang.timberland.domain.BankCard;
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
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

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
            session.setAttribute("user", user);
            request.getRequestDispatcher("/ClothesServlet?method=userInfoInit").forward(request, response);
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

    protected void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("user");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void recharge(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String card = request.getParameter("card");
        String password = request.getParameter("password");
        String money = request.getParameter("money");
        boolean isMatch = Pattern.matches("([1-9]\\d*\\.?\\d*)|(0\\.\\d*[1-9])", money);
        Map<String, Object> result = new HashMap<>();
        if (!isMatch) {
            result.put("info", "充值金额只能为数字");
        } else {
            User user = (User) request.getSession().getAttribute("user");
            user.setU_balance(user.getU_balance() + Long.parseLong(money));
            BankCard bankCard = new BankCard();
            bankCard.setBc_account(card);
            bankCard.setBc_password(password);
            bankCard.setBc_balance(Long.parseLong(money));
            BankCard bankCard1 = userService.checkBankcard(bankCard);
            if (bankCard1 == null) {
                result.put("info", "账号或者密码错误请重新输入");
            } else {
                System.out.println(bankCard1.getBc_balance());
                System.out.println(money);
                if (bankCard1.getBc_balance() - Long.parseLong(money) < 0) {
                    result.put("info", "银行卡余额不足");
                } else {
                    userService.alterBalance(user, bankCard);
                    result.put("info", "充值成功");
                    result.put("money", Long.parseLong(money) + user.getU_balance());
                }
            }
        }
        Gson gson = new Gson();
        String jsonStr = gson.toJson(result);
        response.setContentType("text/javascript");
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(jsonStr);
    }
}
