package com.shopcart;

import java.util.HashMap;
import java.util.Map;

//商品列表类
public class ProductList {
    private static final Map<String , Product> ProductList = new HashMap<String,Product>();
    //商品列表
    static {
        ProductList.put("1", new Product("白板笔",3,"PIC/白板笔.jpeg"));
        ProductList.put("2", new Product("胶水",5,"PIC/胶水.jpeg"));
        ProductList.put("3", new Product("川贝枇杷糖浆",23.15,"PIC/川贝枇杷糖浆.jpeg"));
        ProductList.put("4", new Product("充电宝",46,"PIC/充电宝.jpeg"));
        ProductList.put("5", new Product("空气净化器",599,"PIC/空气净化器.jpeg"));
        ProductList.put("6", new Product("碗",16,"PIC/碗.jpeg"));
        ProductList.put("7", new Product("剪刀",9.9,"PIC/剪刀.jpeg"));
    }

    public static Map<String,Product> getProductList()
    {
        return ProductList;
    }
}
