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
	@RequestMapping(value="/webProject/login")											
	public String loginGo() {
		return "/webProject/login";
	}
	
	@RequestMapping(value="/webProject/join", method = RequestMethod.POST )
	public String joinSite(@ModelAttribute("addUser") Users user, BindingResult result) {
		logger.trace("수업2 : aaaaaaaaaaaaaaaaaaaaaaa" + user);
		service.insertUser(user);
		return "/webProject/login";
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/index")											//header join메뉴 눌렀을 때
	public String indexGo() {
		return "/main/index";
	}
	/*@RequestMapping(value="/join")										//header join메뉴 눌렀을 때
	public String joinGGo(Model model) {
		model.addAttribute("addUser", new Users());
		return "/join/join";
	}*/
	@RequestMapping(value="/join")											//header join메뉴 눌렀을 때
	public String joinGGo() {
		return "/join/join";
	}
	@RequestMapping(value="/login")											//header login메뉴 눌렀을 때
	public String loginGGo() {
		return "/login/login";
	}
	@RequestMapping(value="/contact")										//header contact메뉴 눌렀을 때
	public String contactGo() {
		return "/contact/contact";
	}
	@RequestMapping(value="/mypage_employer")								//사장 mypage 메뉴 눌렀을 때
	public String mypageEmployerGo() {
		return "/mypage/employer/mypage";
	}
	@RequestMapping(value="/mypage_employee")								//알바 mypage 메뉴 눌렀을 때
	public String mypageEmployeeGo() {
		return "/mypage/employee/mypage";
	}
	
	/*@RequestMapping(value="/join", method = RequestMethod.POST )			//join페이지에서 가입 성공했을 때
	public String joinSuccess(@ModelAttribute("addUser") Users user, BindingResult result) {
		logger.trace("수업2 : aaaaaaaaaaaaaaaaaaaaaaa" + user);
		service.insertUser(user);
		return "/join/welcome";
	}*/
	@RequestMapping(value="/join", method = RequestMethod.POST )			//join페이지에서 가입 성공했을 때
	public String joinSuccess(@RequestParam String userId, @RequestParam String password, @RequestParam String password2, 
			@RequestParam String userName, @RequestParam String tel, @RequestParam String email, @RequestParam String birth,
			@RequestParam String grade, @RequestParam String question, @RequestParam String answer, Model model) {
		
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
		model.addAttribute("addUser",loginUser);
		
		return "/join/welcome";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST )			//login성공하면 메인화면으로 
	public String loginSuccess(@RequestParam String userId, @RequestParam String password, Model model) {
		Users loginUser = new Users();
		loginUser.setUserId(userId);
		logger.trace("수업 : " + loginUser);
		loginUser.setPassword(password);
		//logger.trace("수업 : " + loginUser);
		loginUser = service.loginUser(loginUser);
		model.addAttribute("addUser", loginUser);
		return "/main/index";
	}
	
	//로그아웃 안됨
	@RequestMapping(value="/logout")										//header logout메뉴 눌렀을 때
	public String logoutGo(SessionStatus sessionStatus, HttpSession session) {
		/*sessionStatus.setComplete();*/
		/*session.invalidate();*/
		sessionStatus.setComplete();
		/*logger.trace("수업 : " + addUser.userId);*/
		/*session = (HttpSession) sessionStatus;
		session.invalidate();*/
		return "/main/logout";
	}

	
	
}
