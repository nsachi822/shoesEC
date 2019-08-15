package com.example.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.Cart;
import com.example.domain.Order;


@Repository
@Transactional
public class OrderRepository {
	
	@Autowired
	private NamedParameterJdbcTemplate template;
	
	private static final RowMapper <Cart> cart_rowMapper = (rs,i) -> {
		Cart cart = new Cart();
		cart.setCartId(rs.getInt("cartid"));
		cart.setUserId(rs.getInt("userid"));
		cart.setItemId(rs.getInt("itemid"));
		cart.setItemName(rs.getString("itemname"));
		cart.setSize(rs.getString("size"));
		cart.setPrice(rs.getInt("price"));
		cart.setQuantity(rs.getInt("quantity"));
		cart.setImagePath(rs.getString("imagepath"));
		cart.setBrandName(rs.getString("brandname"));
		return cart;
	};
	
	private static final RowMapper <Order> order_rowMapper = (rs,i) -> {
		Order order = new Order();
		order.setOrderId(rs.getLong("orderid"));
		order.setUserId(rs.getInt("userid"));
		order.setStatus(rs.getInt("status"));
		order.setOrderDate(rs.getString("orderdate"));
		order.setTotalPrice(rs.getInt("totalprice"));
		order.setDate(rs.getString("date"));
		return order;
		
	};
	
//	cartに商品を追加(insert)
	public Cart addCart(Cart cart) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(cart);
		String insertSql = "INSERT INTO cart (userid,itemid,itemname,size, price,quantity,brandname,imagepath) "
				+ "values(:userId, :itemId, :itemName, :size, :price, :quantity, :brandName, :imagePath)";
		template.update(insertSql,param);
		return cart;
			
	}
	
	
//	cartの中身を表示
	public List <Cart> findAllCart(){
		String sql = "SELECT cartid,userid,itemid,itemname,size, price,quantity,brandname,imagepath FROM cart";
		List<Cart> cartList = template.query(sql,cart_rowMapper);
		return cartList;
	}
	
//	cartの中身を削除
	public void deleteByCart(Integer cartId) {
		String deleteSql = "DELETE FROM cart where cartid = :cartId";
		SqlParameterSource param = new MapSqlParameterSource().addValue("cartId",cartId);
		template.update(deleteSql,param);
	}

	
//	orderにinsert
	public Order setOrder(Order order) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(order);
		String insertSql = "INSERT INTO orders(userid,totalprice, status,orderdate,date) VALUES(:userId, :totalPrice, :status, :orderDate, current_timestamp)";
		template.update(insertSql,param);
		return order;
		
	}
		
	
//	priceをinsert
	public Order calcprice(Order order) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(order);
		String insertSql = "INSERT INTO orders (totalprice) SELECT sum(price) as totalprice from cart where cart.userid = orders.userid";
		template.update(insertSql,param);
		return order;
	}
	
//	orderの中身を表示
	public List<Order> findAllOrder() {
		String sql = "SELECT orderid, userid, totalprice, orderdate, status,date FROM orders";
		List<Order> orderList = template.query(sql, order_rowMapper);
		return orderList;
	}


}
