package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.Cart;
import com.example.domain.Order;
import com.example.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	
	public Cart addCart(Cart cart) {
		return orderRepository.addCart(cart);
	}
	
	public List<Cart> findAllCart(){
		return orderRepository.findAllCart();
	}
	
	public void deleteByCart(Integer cartId) {
		orderRepository.deleteByCart(cartId);
	}
	
	public Order setOrder(Order order) {
		return orderRepository.setOrder(order);
	}
	
	public Order calcprice(Order order) {
		return orderRepository.calcprice(order);
	}
	
	public List<Order> findAllOrder(){
		return orderRepository.findAllOrder();
	}
	
	public void deleteAll() {
		orderRepository.deleteAll();
	}
}

