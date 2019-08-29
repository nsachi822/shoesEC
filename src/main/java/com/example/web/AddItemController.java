package com.example.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.Items;
import com.example.service.ItemsService;

@Controller
@RequestMapping(value="/items")
@Transactional
public class AddItemController {

	@Autowired
	private ItemsService itemsService;
	
	@Autowired
	private ServletContext application;
	
	@ModelAttribute
	public AddItemForm setUpForm() {
		return new AddItemForm();
	}
	
	@RequestMapping(value="addform")
		public String itemForm(Model model) {
		return "additem";
		
	}
		
	@RequestMapping(value="/insert")
	public String newItem(AddItemForm aiForm,Model model) {
	
		String itemName = aiForm.getItemName();
		Integer price = aiForm.getPrice();
		String brandName = aiForm.getBrandName();
//		String imagePath = aiForm.getImagePath();
		
		Items items = new Items();
		items.setItemName(itemName);
		items.setPrice(price);
		items.setBrandName(brandName);
//		items.setImagePath(imagePath);
		
		MultipartFile imageFile = aiForm.getImageFile();
		if(imageFile.isEmpty()){
			model.addAttribute("imageError","画像は必須です");
			return itemForm(model);
		}
		// ファイルの名前を取得
		String filename = imageFile.getOriginalFilename();
		// 画像を保存する
		try {
			String destPath = application.getRealPath("/img/" + filename);
			File destFile = new File(destPath);
			imageFile.transferTo(destFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return itemForm(model);
		} catch (IOException e) {
			e.printStackTrace();
			return itemForm(model);
		}
		// 画像のパスをセットする
		items.setImagePath(filename);
							
		itemsService.addItem(items);
		
		List<Items> itemsList = itemsService.findItems();
		
		model.addAttribute("itemsList",itemsList);
		
		return "redirect:/list/";
		
	
	}
	
}
