package com.bmj.controller;


import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bmj.entity.SaveTime;
import com.bmj.entity.TimeTable;

@Controller
public class hello {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(hello.class);
	}

	@RequestMapping(value="/hello", method=RequestMethod.GET)
	public String sayHello(Model model) {
		model.addAttribute("message", "hello MVC ");
		return "showMessage";
	}
	
	@RequestMapping(value="/External")
	public String goExternal() {
		return "calendar/registerTest";
	}
	
	@RequestMapping(value="/addTimeTable", method = RequestMethod.GET)
	public String saveExternal(@RequestParam String list) {
		logger.trace("수업 : " + list);
		
		JSONParser parser = new JSONParser();
		Object obj = null;
		TimeTable worktable = new TimeTable();
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
		
		
		for (int i = 0; i < arraylist.size(); i++) {

			logger.trace("수업 확인 : " + arraylist.get(i));
			SaveTime st1 = new SaveTime(arraylist.get(i));
			logger.trace("수업 마지막 확인 : " + st1);
			st1.getTimeStart();
/*			worktable.setMemberId(Integer.parseInt(st1.getTitle()));
			worktable.set(Integer.parseInt(st1.getTitle()));
			worktable.setMemberId(Integer.parseInt(st1.getTitle()));
*/			//st1 0 : eventId, 1 : memberId, 2 : timestart, 3 : timeEnd
			//날짜 분해하는 클래스 호출....!
			//service에서 한번에 해봐....
			
		}
		
		/*while(arraylist.iterator().hasNext()) {
			logger.trace("수업 1 " + arraylist.iterator());
		}*/
		
		return "calendar/register";
	}
}
