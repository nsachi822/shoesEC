package com.example.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.Items;
import com.example.service.ItemsService;

@Controller
@RequestMapping(value="/")
public class ItemsController {
	
	@Autowired
	private ItemsService itemsService;
	
	@Autowired
	HttpSession session;
	
//	item一覧表示（Top Page)
	@RequestMapping("/list")
	public String home(HttpSession session) {
		
		List<Items> itemsList = itemsService.findItems();
		session.setAttribute("itemsList",itemsList);
		
		return "toppage";
	}
	
//	order
	

}
