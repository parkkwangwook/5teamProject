package com.bmj.controller;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bmj.entity.Company;
import com.bmj.service.CompanyService;

@Controller
@SessionAttributes("addCmp")
public class CompanyController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyController.class);
	}
	
	@Autowired
	CompanyService service;
	
	@RequestMapping(value= "/webProject/addCompany")
	public String addCompany(Model model) {
		model.addAttribute("addCmp", new Company());
		return "webProject/addCompany";
	}
	
	@RequestMapping(value= "/webProject/addCompanys")
	public String addCompanys(@ModelAttribute("addCmp") Company company) {
		logger.trace("수업 33333333333333333333 : " + company);
		service.insertCompany(company);
		return "webProject/login";
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value="/registerCompany")
	public String registerCompany(Model model) {					//가입완료 후, 사장-회사 등록 버튼
		model.addAttribute("addCmp", new Company());
		return "mypage/employer/registerCompany";
	}
	
	@RequestMapping(value="/mypage_myCompany")
	public String registerCompanySuccess(@ModelAttribute("addCmp") Company company) {
		logger.trace("수업 33333333333333333333 : " + company);
		service.insertCompany(company);
		return "mypage/employer/myCompany";
	}

	
}
