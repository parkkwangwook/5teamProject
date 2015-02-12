package com.bmj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bmj.entity.SaveTime;
import com.bmj.entity.TimeTable;
import com.bmj.entity.Users;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.TimeTableService;
@Controller
public class TimeTableController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(TimeTableController.class);
	}
	
	@Autowired
	CompanyPersonService service2;
	@Autowired
	TimeTableService service;
	
	
	@RequestMapping(value="/addTimeTable", method = RequestMethod.GET)
	public String saveExternal(@RequestParam String list, HttpSession session) {
		logger.trace("수업 : " + list);
		
		JSONParser parser = new JSONParser();
		Object obj = null;
		TimeTable timetable = new TimeTable();
		try {
			obj = parser.parse(list);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.trace("수업 Object : " + obj);
		logger.trace("수업 확인 1 : " + obj.getClass());
		JSONArray arraylist = (JSONArray) obj;
		// arraylist.get(0);
		Date date = new Date();
		Users user = (Users)session.getAttribute("addUser");
		logger.trace("수업 : User " + user);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//int CompanyCode = service2.selectCompanyPersonCodeByUserId(user.getUserId());

		for (int i = 0; i < arraylist.size(); i++) {

			logger.trace("수업 확인 : " + arraylist.get(i));
			SaveTime st1 = new SaveTime(arraylist.get(i));
			logger.trace("수업 마지막 확인 : " + st1);
			st1.getTitle();			// 직원 아이디...
			st1.getStart();		// 시작 날짜 + 시간
			st1.getEnd();		// 끝난 날짜 + 시간
			try {
				date = formatter.parse(st1.getStart());
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// TimeTable timetb = new TimeTable();
/*			worktable.setMemberId(Integer.parseInt(st1.getTitle()));
			
*/			//st1 0 : eventId, 1 : memberId, 2 : timestart, 3 : timeEnd
			//날짜 분해하는 클래스 호출....!
			//service에서 한번에 해봐....
//			timetable.setCompanyCode(companyCode);
			// 일단 Test User : Park , 123....
			timetable.setCompanyCode(49);
//			timetable.setMemberId(st1.getTitle);
			//timetable.setMemberId(23);
			timetable.setMemberId(23);
			timetable.setWorkingDate(date);
			timetable.setWorkingStart(st1.getStart());
			timetable.setWorkingEnd(st1.getEnd());
			logger.trace("수업 111111111 : " + timetable);
			int result = service.insertTimeTable(timetable);
		}
		
		/*while(arraylist.iterator().hasNext()) {
			logger.trace("수업 1 " + arraylist.iterator());
		}*/
		
		// 여기 나중에 수정...!
		return "calendar/register";
	}
	
}
