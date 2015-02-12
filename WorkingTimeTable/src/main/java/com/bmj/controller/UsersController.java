package com.bmj.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.bmj.entity.Company;
import com.bmj.entity.CompanyPerson;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.UsersService;

@Controller
/* @RequestMapping("/webProject") */
@SessionAttributes("addUser")
public class UsersController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersController.class);
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	@Autowired
	UsersService service;
	@Autowired
	CompanyPersonService cpService;

	@RequestMapping(value = "/count", method = RequestMethod.GET)
	public String getAllDeptList(Model model) {
		Integer result = service.getUsersCount();
		model.addAttribute("message", result);
		return "showMessage";
	}

	@RequestMapping(value = "/webProject/main")
	public String connectionSite() {
		return "/webProject/intro";
	}

	@RequestMapping(value = "/webProject/join")
	public String joinGo(Model model) {
		model.addAttribute("addUser", new Users());
		return "/webProject/joinForm";
	}

	@RequestMapping(value = "/webProject/login")
	public String loginGo() {
		return "/webProject/login";
	}

	@RequestMapping(value = "/webProject/join", method = RequestMethod.POST)
	public String joinSite(@ModelAttribute("addUser") Users user,
			BindingResult result) {
		logger.trace("수업2 : aaaaaaaaaaaaaaaaaaaaaaa" + user);
		service.insertUser(user);
		return "/webProject/login";
	}

	// /////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/index")
	// header join메뉴 눌렀을 때
	public String indexGo() {
		return "/main/index";
	}

	@RequestMapping(value = "/join")
	// header join메뉴 눌렀을 때
	public String joinGGo() {
		return "/join/join";
	}

	@RequestMapping(value = "/login")
	// header login메뉴 눌렀을 때
	public String loginGGo() {
		return "/login/login";
	}

	@RequestMapping(value = "/contact")
	// header contact메뉴 눌렀을 때
	public String contactGo() {
		return "/contact/contact";
	}

	//-----------------------------------------------사장 마이페이지
	@RequestMapping(value = "/mypage_employer")
	// 사장 mypage 메뉴 눌렀을 때 - 개인정보 수정페이지로 
	public String mypageEmployerGo() {
		return "/mypage/employer/mypage";
	}
	@RequestMapping(value = "/modifyPass")
	// 사장 mypage 메뉴 눌렀을 때
	public String mypageModifyPassGo() {
		return "/mypage/modifyPass";
	}
	
	@RequestMapping(value = "/modifyInfo", method = RequestMethod.POST)
	// 사장 My Info(개인정보 수정)에서 수정버튼 눌렀을 때
	public String mypageModifyInfoGo(@RequestParam String userId, @RequestParam String password,
			@RequestParam String userName, @RequestParam String tel,
			@RequestParam String email, @RequestParam String birth,
			@RequestParam String question,
			@RequestParam String answer, Model model, HttpSession session) {
		
		Users modifyUser = new Users();
		Users loginUser = (Users)session.getAttribute("addUser");
		
		modifyUser.setUserId(loginUser.getUserId());   //아이디만 현재 로그인한 회원으로 가져오기

		modifyUser.setUserName(userName);
		modifyUser.setPassword(password);				//지금은 비밀번호 확인을 디비에서 하게했는데 마이페이지에서 비번틀리면 아예 못넘어가게!!
		modifyUser.setTel(tel);
		modifyUser.setEmail(email);
		modifyUser.setBirth(birth);
		modifyUser.setQuestion(question);
		modifyUser.setAnswer(answer);
		
		service.updateUser(modifyUser);					//디비 수정!!
		
		modifyUser = service.loginUser(modifyUser);		
		model.addAttribute("addUser", modifyUser);

		return "/mypage/modifyInfoSuccess";
	}

	@RequestMapping(value = "/myCompany")
	// 사장 mypage 메뉴에서 Store(매장관리)
	public String mypageMyCompanyGo(Model model, HttpSession session) {
		Users owner = (Users) session.getAttribute("addUser");
		CompanyPerson companyCode = null;
		String viewPath = "";

		companyCode = cpService.selectCompanyCodeByUserId(owner.getUserId());

		if (companyCode == null) {
			// 등록된 회사 코드가 없는 것
			model.addAttribute("addCmp", new Company());
			viewPath = "/mypage/employer/registerCompany";
		} else {
			// 등록한 회사가 있는 것
			viewPath = "/mypage/employer/myCompany";
		}

		return viewPath;
	}

	@RequestMapping(value = "/wage")
	// 사장 mypage 메뉴에서 Wage(알바생들 줄 급여관리)
	public String mypageWageGo() {
		return "/mypage/employer/wage";
	}

	@RequestMapping(value = "/staff")
	// 사장 mypage 메뉴에서 Staff(알바생관리)
	public String mypageStaffGo() {
		return "/mypage/employer/staff";
	}

	@RequestMapping(value = "/alerts_employer")
	// 사장 mypage 메뉴에서 Alerts(쪽지관리)
	public String mypagAlertsEmployerGo() {
		return "/mypage/employer/alerts";
	}

	//-----------------------------------------------알바 마이페이지
	@RequestMapping(value = "/mypage_employee")
	// 알바 mypage 메뉴 눌렀을 때
	public String mypageEmployeeGo() {
		return "/mypage/employee/mypage";
	}

	/*@RequestMapping(value = "/myJob")
	// 알바 mypage 메뉴에서 직업관리
	public String mypageMyJobGo() {
		return "/mypage/employee/myJob";
	}*/
	
	@RequestMapping(value = "/myJob")
	// 알바 mypage 메뉴에서 직업관리
	public String mypageMyJobGo(Model model, HttpSession session) {
		Users alba = (Users) session.getAttribute("addUser");		//로그인하고 있는 알바생 정보 가져오고 
		CompanyPerson companyCode = null;
		String viewPath = "";

		companyCode = cpService.selectCompanyCodeByUserId(alba.getUserId());

		if (companyCode == null) {
			// 등록된 직장이 없는 것
			/*model.addAttribute("addCmp", new Company());*/
			viewPath = "/mypage/employee/registerJob";
		} else {
			// 이미 직장 등록되 있음
			viewPath = "/mypage/employee/myJob";
		}

		return viewPath;
		//return "/mypage/employee/registerJob";
	}

	@RequestMapping(value = "/salary")
	// 알바 mypage 메뉴에서 Salary(월급관리)
	public String mypageSalaryGo() {
		return "/mypage/employee/salary";
	}

	@RequestMapping(value = "/alerts_employee")
	// 알바 mypage 메뉴에서 Alerts(쪽지관리)
	public String mypagAlertsEmployeeGo() {
		return "/mypage/employee/alerts";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	// join페이지에서 가입 성공했을 때
	public String joinSuccess(@RequestParam String userId,
			@RequestParam String password, @RequestParam String password2,
			@RequestParam String userName, @RequestParam String tel,
			@RequestParam String email, @RequestParam String birth,
			@RequestParam String grade, @RequestParam String question,
			@RequestParam String answer, Model model) {

		Users loginUser = new Users();
		loginUser.setUserId(userId);
		loginUser.setPassword(password);
		loginUser.setPassword2(password2);
		loginUser.setUserName(userName);
		loginUser.setTel(tel);
		loginUser.setEmail(email);
		loginUser.setBirth(birth);
		loginUser.setGrade(grade);
		loginUser.setQuestion(question);
		loginUser.setAnswer(answer);

		service.insertUser(loginUser);
		model.addAttribute("addUser", loginUser);

		return "/join/welcome";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	// login성공하면 메인화면으로
	public String loginSuccess(@RequestParam String userId,
			@RequestParam String password, Model model) {
		Users loginUser = new Users();
		loginUser.setUserId(userId);
		loginUser.setPassword(password);
		logger.trace("수업 : " + loginUser);
		// logger.trace("수업 : " + loginUser);
		loginUser = service.loginUser(loginUser);
		model.addAttribute("addUser", loginUser);
		return "/main/index";
	}

	// 로그아웃 수정..중
	@RequestMapping(value = "/logout")
	// header logout메뉴 눌렀을 때
	public String logoutGo(SessionStatus sessionStatus) {
		/* sessionStatus.setComplete(); */
		/* session.invalidate(); */
		sessionStatus.setComplete();
		/* logger.trace("수업 : " + addUser.userId); */
		/*
		 * session = (HttpSession) sessionStatus; session.invalidate();
		 */
		return "/main/logout";
	}

///////////////////////////////////////////////////////////////////////////////////////////////////

	//////////////사장 시간표 메뉴 
	@RequestMapping(value = "/registerSchedule")
	public String registerScheduleGo() {									//시간표 - 시간표 등록
		return "/schedule/employer/registerSchedule";
	}
	@RequestMapping(value = "/modifySchedule")
	public String modifyScheduleGo() {										//시간표 - 시간표 수정
		return "/schedule/employer/modifySchedule";
	}
	@RequestMapping(value = "/allSchedule")
	public String allScheduleGo() {											//시간표 - 전체시간표 조회로 이동
		return "/schedule/employer/allSchedule";
	}
	
	//////////////알바 시간표 메뉴 
	@RequestMapping(value = "/mySchedule")
	public String myScheduleGo() {											//시간표 - 내시간표 조회(직장별)
		return "/schedule/employee/mySchedule";
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/notice")
	public String noticeBoardGo() {											//공지게시판
		return "/board/noticeBoard";
	}
	@RequestMapping(value = "/free")
	public String freeBoardGo() {											//자유게시판
		return "/board/freeBoard";
	}
	@RequestMapping(value = "/qna")
	public String qnaBoardGo() {											//Q&A게시판
		return "/board/qnaBoard";
	}

///////////////////////////////////////////////////////////////////////////////////////////////////

}
