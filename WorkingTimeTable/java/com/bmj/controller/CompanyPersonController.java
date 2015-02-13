package com.bmj.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bmj.entity.Company;
import com.bmj.entity.CompanyPerson;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;

@Controller
public class CompanyPersonController {
	
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonController.class);
	}
	@Autowired
	CompanyPersonService cpservice;
	@RequestMapping(value = "/webProject/...?")
	public String addPerson(Model model) {
		model.addAttribute("addPerson", new CompanyPerson());
		return "";
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////

}

