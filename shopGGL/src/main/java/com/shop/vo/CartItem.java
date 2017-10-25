package com.shop.vo;

import com.shop.bean.Product;

public class CartItem {
	private Product product;
	private Double subtatal;
	private Integer count;
	
	
	
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
	public Double getSubtatal() {
		return (double) (product.getPrice()*count);
	}
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
