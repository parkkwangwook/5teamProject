package com.bmj.controller;

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
		
		
		
		return "chart/albamode";
	}
}
