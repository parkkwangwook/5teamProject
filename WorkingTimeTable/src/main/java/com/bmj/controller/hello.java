package com.bmj.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class hello {

	@RequestMapping(value="/hello", method=RequestMethod.GET)
	public String sayHello(Model model) {
		model.addAttribute("message", "hello MVC ");
		return "showMessage";
	}
	
	@RequestMapping(value="/External")
	public String goExternal() {
		return "calendar/register";
	}
}
