<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            object-fit: cover;
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

    <script>
    $(document).ready(function() {
        $('.add-to-cart input[type="submit"]').click(function(e) {
            e.preventDefault(); // 阻止表单的默认提交行为
            var form = $(this).closest('form'); // 找到最近的父级表单元素
            $.ajax({
                type: 'POST',
                url: form.attr('action'), // 使用表单的action属性作为URL
                data: form.serialize(), // 序列化表单数据
                success: function(response) {
                    // 请求成功后执行的函数
                    alert('商品已成功添加到购物车！'); // 弹窗提示添加成功
                },
                error: function(xhr, status, error) {
                    // 请求失败时执行的函数
                    alert('添加购物车失败：' + error);
                }
            });
        });
    });
    </script>

</head>

<body>
    <h1>商品列表</h1>
    <ul class="product-list">
        <li class="product-item">
            <img class="product-image" src="PIC/G2.jpg" alt="商品1图片">
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
        <li class="product-item">
            <img class="product-image" src="path/to/product2_image.jpg" alt="商品3图片">
            <div class="product-details">
                <div class="product-name">商品3</div>
                <div class="price">￥300</div>
                <form action="add-to-cart" method="post" class="add-to-cart">
                    <input type="hidden" name="productName" value="商品3">
                    <input type="hidden" name="price" value="300">
                    <input type="submit" value="添加到购物车">
                </form>
            </div>
        </li>
        <li class="product-item">
            <img class="product-image" src="path/to/product2_image.jpg" alt="商品4图片">
            <div class="product-details">
                <div class="product-name">商品4</div>
                <div class="price">￥450</div>
                <form action="add-to-cart" method="post" class="add-to-cart">
                    <input type="hidden" name="productName" value="商品4">
                    <input type="hidden" name="price" value="450">
                    <input type="submit" value="添加到购物车">
                </form>
            </div>
        </li>
        <li class="product-item">
            <img class="product-image" src="path/to/product2_image.jpg" alt="商品5图片">
            <div class="product-details">
                <div class="product-name">商品4</div>
                <div class="price">￥550</div>
                <form action="add-to-cart" method="post" class="add-to-cart">
                    <input type="hidden" name="productName" value="商品5">
                    <input type="hidden" name="price" value="550">
                    <input type="submit" value="添加到购物车">
                </form>
            </div>
        </li>
    </ul>
    <a href="cart.jsp">查看购物车</a>
</body>
</html>