package com.bmj.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bmj.entity.CompanyPerson;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.CompanyService;
import com.bmj.service.MessageService;

@Controller
public class CompanyPersonController {

	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonController.class);
	}
	@Autowired
	CompanyService cService;
	@Autowired
	CompanyPersonService cpService;
	@Autowired
	MessageService mService;

	@RequestMapping(value = "/webProject/...?")
	public String addPerson(Model model) {
		model.addAttribute("addPerson", new CompanyPerson());
		return "";
	}

	
	// /////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/addNewEmployee", method = RequestMethod.GET)
	public String addNewEmployeeSuccessGo(@RequestParam int companyCode, @RequestParam String userId, @RequestParam int messageNumber) {
		logger.trace("승낙버튼누름!! 회사"+companyCode+" 아이디 " +userId);
		
		mService.updateMesageFlagByMsgNum(messageNumber);		//읽었으니까 1로바꿈
		
		CompanyPerson companyperson = new CompanyPerson();
		companyperson.setCompanyCode(companyCode);
		companyperson.setUserId(userId);
		companyperson.setHireDate("오늘");
		cpService.insertCompanyEmployee(companyperson);			//알바생추가
		return "redirect:/alerts_employer";
	}

}
