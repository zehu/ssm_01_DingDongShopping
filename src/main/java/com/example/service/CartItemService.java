package com.example.service;

import com.example.entity.CartItem;

import java.util.List;

public interface CartItemService {
	
	public List<CartItem> loadCartItems(String cartItemIds);
	
	public CartItem updateQuantity(String cartItemId, int quantity);
	
	public void batchDelete(String cartItemIds);
	
	public void add(CartItem cartItem);
	
	public List<CartItem> myCart(String uid);
}
