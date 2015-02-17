package com.bmj.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	CompanyPersonService cpService;

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

	@RequestMapping(value="/registerCompany", method = RequestMethod.GET)
	public String registerCompany(Model model) {					//가입완료 후, 사장-회사 등록 버튼 - 회사등록페이지
		model.addAttribute("addCmp", new Company());
		return "mypage/employer/registerCompany";
	}
	
	@RequestMapping(value = "/myCompany")
	// 사장 mypage 메뉴에서 Store(매장관리)
	public String mypageMyCompanyGo(Model model, HttpSession session) {
		Users owner = (Users) session.getAttribute("addUser");
		CompanyPerson companyPerson = null;
		String viewPath = "";

		 companyPerson = cpService.selectCompanyPersonByUserId(owner.getUserId());

		if (companyPerson == null) {
			// 등록된 회사 코드가 없음-등록하는페이지로
			viewPath = "/mypage/employer/registerCompany";
		} else {
			// 등록한 회사가 있는 것-불러오기
			Company myCompany = new Company();
			myCompany = service.selectCompanyByCompanyCode(companyPerson.getCompanyCode());
			model.addAttribute("myCom", myCompany);
			model.addAttribute("ownerPass", owner.getPassword());
			viewPath = "/mypage/employer/myCompany";
		}

		return viewPath;
	}
	@RequestMapping(value = "/modifyMyCom", method = RequestMethod.POST)
	// 사장 - 회사정보수정
	public String mypageModifyMyComSuccessGo(@ModelAttribute("myCom") Company myCom,
			Model model) {
		
		int result = service.updateCompany(myCom);
		logger.trace("회사정보 업데이트 결과!!  "+result);
		return "redirect:/myCompany"; 			//업데이트끝나고 회사보는 페이지로
	}
	/* 회사 등록과 동시에 자신 등록(사장입장) */
	/*@RequestMapping(value="/mypage_myCompany")
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
	}*/
	@RequestMapping(value="/registerCompany", method = RequestMethod.POST)
	public String registerCompanySuccess(@RequestParam String companyName, @RequestParam String companyTel,
										@RequestParam Float holidayComm, @RequestParam Float nightComm,
										HttpSession session) {
		logger.trace("입력받은 회사정보!!!"+companyName+" "+companyTel+" "+holidayComm+" "+nightComm);
		Company newCompany = new Company();
		newCompany.setCompanyName(companyName);
		newCompany.setCompanyTel(companyTel);
		newCompany.setHolidayComm(holidayComm);
		newCompany.setNightComm(nightComm);
		
		service.insertCompany(newCompany);							//company테이블에 회사추가
		
		Users user = (Users)session.getAttribute("addUser");		//로그인한 사장정보
		logger.trace("수업 5555555555555555555" + user);
		// 시퀀스로 저장된 CompanyCode를 찾아오기~!
		Company company2 = service.seelctCompany(newCompany);		//방금 추가한 회사가져오기(회사코드얻기위해)
		logger.trace("수업 666666666666666666666 : " + company2);
		
		CompanyPerson companyperson = new CompanyPerson();
		// select ~~
		companyperson.setCompanyCode(company2.getCompanyCode());
		companyperson.setUserId(user.getUserId());
		companyperson.setSalary(0);                 //DB입력할때 필요하니깐 사장은 0으로
		companyperson.setHireDate("의미없음");
		// service.company_person.insert();
		cpService.insertCompanyOwner(companyperson);

		/*return "mypage/employer/myCompany";*/
		return "redirect:/myCompany"; 
	}
	

	/* 쪽지로 회사원 추가하기 기능... 사장 입장 */
	@RequestMapping(value = "/?")
	public String registerCompanyPerson(HttpSession session, @RequestParam String userId) {
		Users user = (Users)session.getAttribute("addUser");
		// int CompanyCode = service2.selectbyUserId(user.getUserId());
		CompanyPerson companyperson = new CompanyPerson();
		//companyperson.setCompanyCode(companyCode);
		companyperson.setUserId(userId);
		cpService.insertCompanyPerson(companyperson);
		
		return "";
	}
}
