package com.shopcart;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 设置响应的字符编码
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        // 从请求参数中获取要移除的商品名称
        String productName = request.getParameter("productName");

        // 获取当前的HTTP会话，如果当前没有会话则不创建新的会话
        HttpSession session = request.getSession(false);

        if (session != null) {
            // 从会话中获取购物车
            @SuppressWarnings("unchecked")
            Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");

            if (cart != null && cart.containsKey(productName)) {
                CartItem item = cart.get(productName);
                // 如果商品数量大于1，则减少数量；否则从购物车中移除该商品
                if (item.getQuantity() > 1) {
                    item.setQuantity(item.getQuantity() - 1);
                } else {
                    cart.remove(productName);
                }

                // 如果移除商品后购物车为空，则从会话中清除购物车属性
                if (cart.isEmpty()) {
                    session.removeAttribute("cart");
                } else {
                    // 如果购物车不为空，则更新会话中的购物车
                    session.setAttribute("cart", cart);
                }
            }
        }
        // 重定向到购物车页面，显示更新后的购物车内容
        response.sendRedirect("cart.jsp");
    }
}