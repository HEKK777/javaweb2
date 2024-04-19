package com.shopcart;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取商品信息和价格
        String productName = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));

        // 获取当前会话
        HttpSession session = request.getSession();

        // 从会话中获取购物车，如果不存在则创建一个新的
        @SuppressWarnings("unchecked")
        Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }
        // 检查购物车中是否已有该商品，如果有则增加数量，否则添加新商品
        CartItem item = cart.get(productName);
        if (item != null) {
            // 商品已存在，增加数量
            item.setQuantity(item.getQuantity() + 1);
        } else {
            // 商品不存在，新建商品项并加入购物车
            item = new CartItem(productName, price, 1);
            cart.put(productName, item);
        }
        // 重定向到购物车页面
        response.sendRedirect("index.jsp");
    }
}

