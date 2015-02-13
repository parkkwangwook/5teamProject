package com.bmj.controller;

import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(ChartController.class);
	}
	
	@RequestMapping(value = "/chart")
	public String goChartAlba() {
		Calendar c1 = Calendar.getInstance();
		logger.trace("수업 : Chart~~~~~~~~~~~~~~!");
		// 1. session에서 내 정보를 가져오겠지...?
		// 2. 내 아이디로 나의 직원 아이디를 가져오고!
		// 3. 직원 아이디로 근무표를 조회한다.
		// 4. 
		int currentMonth;
		
		
		return "chart/albamode";
	}
}
