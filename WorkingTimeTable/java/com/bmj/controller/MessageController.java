package com.bmj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bmj.entity.CompanyPerson;
import com.bmj.entity.Message;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.MessageService;

@Controller
public class MessageController {
	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(MessageController.class);
	}
	
	@Autowired
	CompanyPersonService cpService;
	@Autowired
	MessageService mService;
	
		// 알바생 회사코드 등록하면
		//사장에게 메세지보내고 자신에게도 메세지 남고
		@RequestMapping(value = "/sendMsgToOwner")
		public String registerJobSuccess(@RequestParam int companyCode,
				@RequestParam String companyTel, HttpSession session) {

			Message message = new Message();
			Users loginUser = (Users)session.getAttribute("addUser");	//현재로그인한 사람 = 메세지 보내는사람 
			
			message.setCompanyCode(companyCode);
			message.setUserId(loginUser.getUserId());
			message.setMessageContent("아르바이트 등록");
			message.setFlag(0);       //보지 않은 메세지=0, 본 메세지=1
			
			mService.insertMessage(message);
			/*Users user = (Users) session.getAttribute("addUser"); // 로그인한 알바생을 가져오고

			Company company = cService.selectCompanyByCompanyCode(companyCode); // 회사찾아와서
																				// 넣어주고

			CompanyPerson companyperson = new CompanyPerson();

			companyperson.setCompanyCode(company.getCompanyCode());
			companyperson.setUserId(user.getUserId());
			 companyperson.setSalary(0000); 
			companyperson.setHireDate("오늘~");
			cpService.insertCompanyPerson(companyperson);*/

			return "mypage/employee/alerts";
		}
		
		@RequestMapping(value = "/alerts_employer")
		// 사장 mypage 메뉴에서 Alerts(쪽지관리)
		public String mypagAlertsEmployerGo(HttpSession session, Model model) {
			Users loginUser = (Users)session.getAttribute("addUser"); 		//로그인한 사장정보 
			int ComCode = cpService.selectComCodeByUserId(loginUser.getUserId());
			
			List<Message> myComMessages = mService.selectMessageByComCode(ComCode);
			logger.trace("가져온 나의 회사 메세지들!! "+myComMessages);
			model.addAttribute("myComMessages", myComMessages);
			
			return "/mypage/employer/alerts";
		}
		
		@RequestMapping(value = "/alerts_employee")
		// 알바 mypage 메뉴에서 Alerts(쪽지관리)
		public String mypagAlertsEmployeeGo(HttpSession session, Model model) {
			Users loginUser = (Users)session.getAttribute("addUser");
			List<Message> myMessages = mService.selectMessageByUserId(loginUser.getUserId());
			
			logger.trace("!!가져온 나의 메세지들!! "+myMessages);
			model.addAttribute("myMessages", myMessages);
			return "/mypage/employee/alerts";
		}
}
