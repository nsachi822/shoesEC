package com.example.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.Data;

@JsonPropertyOrder({"orderID","userID","totalPrice","arrivalDate","orderDate"})
@Data
public class Order {
	
	@JsonProperty("orderID")
	private Long orderId;
	@JsonProperty("userID")
	private Integer userId;
	
	private Integer status;
	@JsonProperty("totalPrice")
	private Integer totalPrice;
	@JsonProperty("arrivalDate")
	private String orderDate;
	@JsonProperty("orderDate")
	private String date;
	
	
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public Order() {
		
	}
	public Order(Long orderId, Integer userId, Integer status, Integer totalPrice, String orderDate, String date) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.status = status;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.date = date;
	}
	
	
	

	
	
}
