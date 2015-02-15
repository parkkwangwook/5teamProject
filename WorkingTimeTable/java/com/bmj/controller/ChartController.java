package com.bmj.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bmj.entity.CompanyPerson;
import com.bmj.entity.Stats;
import com.bmj.service.CompanyPersonService;
import com.bmj.service.TimeTableService;

@Controller
public class ChartController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(ChartController.class);
	}
	
	@Autowired
	TimeTableService service;
	@Autowired
	CompanyPersonService cpservice;
	
	// 개인 급여 조회~~
	@RequestMapping(value = "/mychart")
	public String goChartAlba() {
		Calendar c1 = Calendar.getInstance();
		logger.trace("수업 : Chart~~~~~~~~~~~~~~!");
		return "chart/myChart";
	}
	
	// 직원 급여 조회~~
		@RequestMapping(value = "/companychart")
		public String goChartcompany() {
			Calendar c1 = Calendar.getInstance();
			logger.trace("수업 : CompanyChart~~~~~~~~~~~~~~!");
			return "chart/CompanyChart";
		}
	
	@RequestMapping(value = "/ajaxChart")
	public @ResponseBody String ajaxReceive(Model model, HttpSession session) {
		// 1. session에서 내 정보를 가져오겠지...?
		// Users user = (Users)session.get~("addUser);
		// String userId = user.get~~~..
		// 2. 내 아이디로 나의 직원 아이디를 가져오고!
		// String memberId = service.select~~(userId);
		// 일단여기에선 UserId : Kim , memberId = 6
		// 3. 직원 아이디로 근무표를 조회한다.
		logger.trace("수업 : 어디까지..?0");
		List<Stats> myTimes = new ArrayList<Stats>();
		// myTimes = service.selectStatsByMemberId(6);
		myTimes.add(new Stats("JAN", 6, 30));
		myTimes.add(new Stats("FEB", 6, 25));
		myTimes.add(new Stats("MAR", 6, 28));
		myTimes.add(new Stats("JAN", 2, 19));
		myTimes.add(new Stats("FEB", 2, 33));
		myTimes.add(new Stats("MAR", 2, 25));
		myTimes.add(new Stats("JAN", 3, 10));
		myTimes.add(new Stats("FEB", 3, 25));
		myTimes.add(new Stats("MAR", 3, 41));
		myTimes.add(new Stats("JAN", 1, 18));
		myTimes.add(new Stats("FEB", 1, 25));
		myTimes.add(new Stats("MAR", 1, 31));
		myTimes.add(new Stats("JAN", 5, 10));
		myTimes.add(new Stats("FEB", 5, 25));
		myTimes.add(new Stats("MAR", 5, 21));
		// month, memberId, count
		
		
		logger.trace("수업 ::::::::::::::::" + myTimes);
		CompanyPerson companyperson = cpservice.selectCompanyPersonByUserId("Kim");
		int salary = companyperson.getSalary();
		for (int i = 0; i < myTimes.size(); i++) {
			// 월급 계산.....! 시간 * 시급
			int count = myTimes.get(i).getCount() * salary;
			myTimes.get(i).setCount(count);
		}
		logger.trace("수업, 기본 셋팅 완료 : " + myTimes);
		
		JSONObject objJson = new JSONObject();
		JSONArray arrayJson = new JSONArray();
		
		for(int i = 0; i < myTimes.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("month", myTimes.get(i).getMonth());
			obj.put("memberId", myTimes.get(i).getMemberId());
			obj.put("count", myTimes.get(i).getCount());
			
			arrayJson.add(obj);
		}
		objJson.put("charts", arrayJson);
		
		logger.trace("수업 Json : " + objJson);
		
		return objJson.toString();
	}
}
