package com.bmj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bmj.entity.CompanyPerson;

@Controller
public class CompanyPersonController {
	
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonController.class);
	}
	
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
	
}

