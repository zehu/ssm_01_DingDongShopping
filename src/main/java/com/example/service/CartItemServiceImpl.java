package com.example.service;

import com.example.dao.CartItemDao;
import com.example.entity.CartItem;
import com.example.util.commons.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartItemService")
public class CartItemServiceImpl implements CartItemService{
	
	@Autowired
	private CartItemDao cartItemDao;
	
	public List<CartItem> loadCartItems(String cartItemIds) {
		try {
			String[] cartItemIdArray = cartItemIds.split(",");
			return cartItemDao.loadCartItems(cartItemIdArray);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public CartItem updateQuantity(String cartItemId, int quantity){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cartItemId", cartItemId);
		map.put("quantity", quantity);
		try {
			cartItemDao.updateQuantity(map);
			return cartItemDao.findByCartItemId(cartItemId);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void batchDelete(String cartItemIds){
		try {
			String[] cartItemIdArray = cartItemIds.split(",");
			cartItemDao.bacthDelete(cartItemIdArray);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void add(CartItem cartItem){
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("uid", cartItem.getUser().getUid());
			map.put("bid", cartItem.getBook().getBid());
			CartItem _cartItem = cartItemDao.findByUidAndBid(map);
			if(_cartItem==null){
				map.put("cartItemId", CommonUtil.uuid());
				map.put("quantity", cartItem.getQuantity());
				cartItemDao.addCartItem(map);
			}else{
				int quantity = cartItem.getQuantity()+_cartItem.getQuantity();
				map.put("quantity", quantity);
				map.put("cartItemId", _cartItem.getCartItemId());
				cartItemDao.updateQuantity(map);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<CartItem> myCart(String uid){
		try {
			return cartItemDao.findByUser(uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
