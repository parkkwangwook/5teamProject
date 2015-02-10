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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bmj.entity.Company;
import com.bmj.entity.CompanyPerson;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.CompanyService;

@Controller
// 컴패니는 session 남길 필요없음....
//@SessionAttributes("addCmp")
public class CompanyController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyController.class);
	}
	
	@Autowired
	CompanyService service;
	@Autowired
	CompanyPersonService service2;

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
	/* 회사 등록과 동시에 자신 등록(사장입장) */
	@RequestMapping(value="/mypage_myCompany")
	public String registerCompanySuccess(@ModelAttribute("addCmp") Company company,  HttpSession session) {
		logger.trace("수업11111111111111111111111111111111111111111");
		logger.trace("수업 33333333333333333333 : " + company);
		service.insertCompany(company);
		Users user = (Users)session.getAttribute("addUser");
		logger.trace("수업 5555555555555555555" + user);
		// 시퀀스로 저장된 CompanyCode를 찾아오기~!
		Company company2 = service.seelctCompany(company);
		logger.trace("수업 666666666666666666666 : " + company2);
		CompanyPerson companyperson = new CompanyPerson();
		// select ~~
		companyperson.setCompanyCode(company2.getCompanyCode());
		companyperson.setUserId(user.getUserId());
		// service.company_person.insert();
		service2.insertCompanyPerson(companyperson);

		return "mypage/employer/myCompany";
	}
	
	//알바생 회사코드 등록하면 companyperson테이블에 추가됨
	//나중에 사장이 OK해야 바뀌는걸로 고쳐야함
	@RequestMapping(value="/addNewEmployee")
	public String registerJobSuccess(@RequestParam int companyCode,  HttpSession session) {
	
		Users user = (Users)session.getAttribute("addUser");					//로그인한 알바생을 가져오고 
		
		Company company = service.selectCompanyByCompanyCode(companyCode);		//회사찾아와서 넣어주고 
		
		CompanyPerson companyperson = new CompanyPerson();

		companyperson.setCompanyCode(company.getCompanyCode());
		companyperson.setUserId(user.getUserId());
		service2.insertCompanyPerson(companyperson);

		return "mypage/employee/myJob";
	}
	

	/* 쪽지로 회사원 추가하기 기능... 사장 입장 */
	@RequestMapping(value = "/?")
	public String registerCompanyPerson(HttpSession session, @RequestParam String userId) {
		Users user = (Users)session.getAttribute("addUser");
		// int CompanyCode = service2.selectbyUserId(user.getUserId());
		CompanyPerson companyperson = new CompanyPerson();
		//companyperson.setCompanyCode(companyCode);
		companyperson.setUserId(userId);
		service2.insertCompanyPerson(companyperson);
		
		return "";
	}
}
