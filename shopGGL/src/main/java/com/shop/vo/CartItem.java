package com.shop.vo;

import com.shop.bean.Product;
//购物车
public class CartItem {
	private Product product;//商品
	private double subtatal;//小计
	private Integer count;//数量
	
	public CartItem(Product product, Integer count) {
		super();
		this.product = product;
		this.count = count;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getSubtatal() {
		return product.getPrice()*count;
	}
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
