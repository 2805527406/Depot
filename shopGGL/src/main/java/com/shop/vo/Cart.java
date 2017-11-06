package com.shop.vo;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.shop.bean.Product;

public class Cart {
	private Map<Integer,CartItem> cart=new HashMap<Integer, CartItem>();
	
	private Double total=0.0;
	
	public Collection<CartItem> getCartItems(){
		return cart.values();
	}

	public Map<Integer, CartItem> getCart() {
		return cart;
	}

	public void setCart(Map<Integer, CartItem> cart) {
		this.cart = cart;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}
	
	public void addcart(CartItem item){
		Integer pid=item.getProduct().getProid();
		if(cart.containsKey(pid)){
			CartItem oItem=cart.get(pid);
			oItem.setCount(oItem.getCount()+item.getCount());
		}else{
			cart.put(pid, item);
		}
		total+=item.getSubtatal();
	}
	
	public void removeCart(Integer pid){
		CartItem item=cart.remove(pid);
		this.total-=item.getSubtatal();
	}
	
	public void CleanCart(){
		cart.clear();
		total=0.0;
	}
	
	
}
