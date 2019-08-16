package com.example.web;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.User;
import com.example.service.UserService;

@Controller
@RequestMapping(value="/member")
@Transactional

public class AddAccountController {

	@Autowired
	private UserService userService;
	
	@ModelAttribute
	public AddAccountForm setUpForm() {
		return new AddAccountForm();
		
	}
	
	@RequestMapping(value="form")
		public String form() {
			return "newaccount";
		}
	
	@RequestMapping(value="/create")
	public String addForm(AddAccountForm acForm,BindingResult result,Model model) {
		
		String password = acForm.getPassword();
		String checkPassword = acForm.getPassword();
		if(!password.equals(checkPassword)) {
			ObjectError error = new ObjectError ("addError","pleace check your pasword");
			result.addError(error);
			return form();
		}
		
		List <User> userList = userService.findUserAll();
		
		User user = new User();
		BeanUtils.copyProperties(acForm, user);
		userService.addUser(user);
		model.addAttribute("user",userList);
		
		return "redirect:/list/";
		
		
		
	}
	
}
	

