package com.example.web;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Cart;
import com.example.domain.Order;
import com.example.service.OrderService;

@Controller
@RequestMapping(value="/")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private HttpSession session;

	@Autowired
	private ServletContext application;

	
	@ModelAttribute
	public ItemOrderForm itemOrderForm() {
		return new ItemOrderForm();
	}
	
	@ModelAttribute
	public OrderInfoForm orderInfoForm() {
		return new OrderInfoForm();
	}
	
//	注文情報を全件取得
	@RequestMapping(value="cartlist")
	public String index (Model model) {
		List <Cart> cartList = orderService.findAllCart();
		model.addAttribute("cartList",cartList);
		return "cart";
		
	}	
	
//	cartに商品を追加
	@RequestMapping(value="/addcart")
	public String insertCart(Model model,ItemOrderForm itemOrderForm) {
		
		Integer cartId = itemOrderForm.getCartId();
		Integer userId = itemOrderForm.getUserId();
		Integer itemId = itemOrderForm.getItemId();
		String itemName = itemOrderForm.getItemName();
		String size = itemOrderForm.getSize();
		Integer price = itemOrderForm.getPrice();
		Integer quantity = itemOrderForm.getQuantity();
			price = price * quantity;
		String imagePath = itemOrderForm.getImagePath();
		String brandName = itemOrderForm.getBrandName();
		
		
		Cart cart = new Cart();
		cart.setCartId(cartId);
		cart.setUserId(userId);
		cart.setItemId(itemId);
		cart.setItemName(itemName);
		cart.setSize(size);
		cart.setPrice(price);
		cart.setQuantity(quantity);
		cart.setImagePath(imagePath);
		cart.setBrandName(brandName);
		
		
		orderService.addCart(cart);
		System.out.println(itemName);
		
//		cart内の商品を一覧表示
		List <Cart> cartList = orderService.findAllCart();
		model.addAttribute("cartList",cartList);				
	
		return "cart";
				
	}
//	cartから商品を削除
	@RequestMapping(value="/cartdelete")
	public String deleteFromCart(Model model, ItemOrderForm itemOrderForm) {
		orderService.deleteByCart(itemOrderForm.getCartId());
			
		return "redirect:cartlist";
	}
	
//	cart内の商品を注文（cartない商品、合計金額をorderConfirmationに表示
	@RequestMapping(value="/confirmorder")
	public String checkOrder(Model model,ItemOrderForm itemOrderForm) {
		
//		cartない商品を再度表示
		List<Cart> cartList = orderService.findAllCart();
				
		model.addAttribute("cartList",cartList);
		
		
		
		List<Order> orderList = orderService.findAllOrder();
		model.addAttribute("orderList",orderList);
						
		return "orderConfirmation";
	}
	
	@RequestMapping(value="/orderfinished")
	public String orderfinish(Model model, Order order,OrderInfoForm oiForm) {
		
		Long orderId = oiForm.getOrderId();
		Integer userId = oiForm.getUserId();
		Integer totalPrice = oiForm.getTotalPrice();
		String orderDate = oiForm.getOrderDate();
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		order.setTotalPrice(totalPrice);
		order.setOrderDate(orderDate);
		
		orderService.setOrder(order);

		return "complete";
	}
	
//	注文履歴を表示
	@RequestMapping(value="/history")
	public String orderHistory() {
		List<Order> orderList = orderService.findAllOrder();
		application.setAttribute("orderList", orderList);
		return "orderhistory";
		
	}
}
