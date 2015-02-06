package com.bmj.controller;



import java.sql.Date;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bmj.entity.Users;
import com.bmj.service.UsersService;

@Controller
/*@RequestMapping("/webProject")*/
@SessionAttributes("addUser")
public class UsersController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersController.class);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@Autowired
	UsersService service;
	
	@RequestMapping(value="/count", method = RequestMethod.GET)
	public String getAllDeptList(Model model) {
		Integer result = service.getUsersCount();
		model.addAttribute("message", result);
		return "showMessage";
	}
	
	@RequestMapping(value="/webProject/main")
	public String connectionSite() {
		return "/webProject/intro";
	}

	@RequestMapping(value="/webProject/join")
	public String joinGo(Model model) {
		model.addAttribute("addUser", new Users());
		return "/webProject/joinForm";
	}
	
	
	@RequestMapping(value="/webProject/join", method = RequestMethod.POST )
	public String joinSite(@ModelAttribute("addUser") Users user, BindingResult result) {
		logger.trace("수업2 : aaaaaaaaaaaaaaaaaaaaaaa" + user);
		//service.addUser(user);
		return "/webProject/login";
	}	
}
