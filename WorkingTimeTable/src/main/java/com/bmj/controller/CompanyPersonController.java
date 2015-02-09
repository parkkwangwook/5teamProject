package com.bmj.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping(value = "/registerJob")
	public String registerJob(Model model) {						//가입완료 후, 알바-회사 등록 버튼
		model.addAttribute("addPerson", new CompanyPerson());
		return "mypage/employee/registerJob";
	}
	
/*	@RequestMapping(value = "/registerPerson")
	public String registerJob1(@ModelAttribute("addCmp") Company company) {		//가입완료 후, 알바-회사 등록 버튼
		//model.addAttribute("addPerson", new CompanyPerson());

		return "mypage/employer/myCompany";
	}*/
	
	
}

