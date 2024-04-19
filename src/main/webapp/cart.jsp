<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shopcart.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>购物车</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .cart {
            width: 80%;
            margin: 40px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .cart h1 {
            text-align: center;
        }
        .cart ul {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }
        .cart li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .product-name {
            flex: 1;
        }
        .price, .quantity {
            margin-right: 20px;
        }
        .total-price {
            font-weight: bold;
            font-size: 18px;
        }
        .remove-button {
            background-color: #f00;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="cart">
        <h1>购物车</h1>
        <%
            // 从Session中获取购物车
            Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
            double totalPrice = 0.0;
            if (cart != null && !cart.isEmpty()) {
        %>
            <ul>
                <% for (CartItem item : cart.values()) { %>
                    <li>
                        <div class="product-name"><%= item.getName() %></div>
                        <div class="price">￥<%= item.getPrice() %></div>
                        <div class="quantity">× <%= item.getQuantity() %></div>
                        <form action="remove-from-cart" method="post">
                            <input type="hidden" name="productName" value="<%= item.getName() %>">
                            <input type="submit" class="remove-button" value="移除">
                        </form>
                    </li>
                    <%
                        // 累计总价
                        totalPrice += item.getTotalPrice();
                    %>
                <% } %>
            </ul>
            <p class="total-price">总价：￥<%= totalPrice %></p>
        <%
            } else {
        %>
            <p>购物车为空！！！！！！！！</p>
        <%
            }
        %>
    </div>
    <div style="text-align:center; margin-top:20px;">
            <a href="index.jsp" class="button">返回商品列表</a>
    </div>
</body>
</html>