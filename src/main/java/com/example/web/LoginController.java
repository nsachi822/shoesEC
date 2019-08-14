package com.example.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.User;
import com.example.service.UserService;

@Controller
@RequestMapping(value="/")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@Autowired
	HttpSession session;
	
	@ModelAttribute
	public LoginForm setUpForm() {
		return new LoginForm();
	}
	
	
	@RequestMapping(value="/login")
	public String index() {
		return "login";
	}
	
	@RequestMapping(value="/logincheck")
	public String login(@Validated LoginForm form,BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			return index();
		}
		
//		List<User> userList = userService.findAll();
		
		String email = form.getEmail();
		String password = form.getPassword();
		
		User user = userService.findByEmailAndPassword(email,password);
		
		if(user == null) {
			ObjectError error = new ObjectError ("loginerror","メールアドレスまたパスワードが違います");
			result.addError(error);
			return index();
		}
		
		session.setAttribute("user", user);
		return "redirect:list/";
				
	}
	
	
}

