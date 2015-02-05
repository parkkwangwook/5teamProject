package com.bmj.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bmj.service.UsersService;

@Controller
/*@RequestMapping("/user")*/
public class UsersController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersController.class);
	}
	
	@Autowired
	UsersService service;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String getAllDeptList(Model model) {
		logger.trace("수업 : sssss");
		Integer result = service.getUsersCount();
		model.addAttribute("message", result);
		return "showMessage";
	}
}
