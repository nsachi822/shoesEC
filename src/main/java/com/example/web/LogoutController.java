package com.example.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.domain.User;

@Controller
@RequestMapping(value = "/logout")
@SessionAttributes("user")
public class LogoutController {
	
	@RequestMapping(value = "sessionInvalidate")
	public String sessionInvalidate(User user, SessionStatus sessionStatus) {
			sessionStatus.setComplete();
			return "redirect:/list/";
		}
}
