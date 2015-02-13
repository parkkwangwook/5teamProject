package com.bmj.controller;

import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	// 개인 조회~~
	@RequestMapping(value = "/chart")
	public String goChartAlba() {
		Calendar c1 = Calendar.getInstance();
		logger.trace("수업 : Chart~~~~~~~~~~~~~~!");
		// 1. session에서 내 정보를 가져오겠지...?
		// Users user = (Users)session.get~("addUser);
		// String userId = user.get~~~..
		// 2. 내 아이디로 나의 직원 아이디를 가져오고!
		// String memberId = service.select~~(userId);
		// 일단여기에선 UserId : Kim , memberId = 6
		// 3. 직원 아이디로 근무표를 조회한다.
		List<Stats> myTimes = null;
		myTimes = service.selectStatsByMemberId(6);
		logger.trace("수업 ::::::::::::::::" + myTimes);
		CompanyPerson companyperson = cpservice.selectCompanyCodeByUserId("Kim");
		int salary = companyperson.getSalary();
		for (int i = 0; i < myTimes.size(); i++) {
			// 월급 계산.....! 시간 * 시급
			int count = myTimes.get(i).getCount() * salary;
			myTimes.get(i).setCount(count);
		}
		logger.trace("수업, 기본 셋팅 완료 : " + myTimes);
		
		
		
		
		
		return "chart/albamode";
	}
}
