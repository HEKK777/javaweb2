<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <style>
        .product-list {
            list-style-type: none;
            padding: 0;
        }
        .product-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .product-image {
            flex: 0 0 auto;
            width: 100px;
            height: 100px;
            margin-right: 15px;
        }
        .product-details {
            flex: 1;
        }
        .product-name {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .price {
            font-weight: bold;
            color: #f00; /* 红色价格 */
        }
        .add-to-cart {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>商品列表</h1>
    <ul class="product-list">
        <li class="product-item">
            <img class="product-image" src="path/to/product1_image.jpg" alt="商品1图片">
            <div class="product-details">
                <div class="product-name">商品1</div>
                <div class="price">￥100</div>
                <form action="add-to-cart" method="post" class="add-to-cart">
                    <input type="hidden" name="productName" value="商品1">
                    <input type="hidden" name="price" value="100">
                    <input type="submit" value="添加到购物车">
                </form>
            </div>
        </li>
        <li class="product-item">
            <img class="product-image" src="path/to/product2_image.jpg" alt="商品2图片">
            <div class="product-details">
                <div class="product-name">商品2</div>
                <div class="price">￥200</div>
                <form action="add-to-cart" method="post" class="add-to-cart">
                    <input type="hidden" name="productName" value="商品2">
                    <input type="hidden" name="price" value="200">
                    <input type="submit" value="添加到购物车">
                </form>
            </div>
        </li>
        <!-- 添加更多商品项 -->
    </ul>
    <a href="cart.jsp">查看购物车</a>
</body>
</html>