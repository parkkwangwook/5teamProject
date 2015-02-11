package com.bmj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bmj.dao.TimeTableDao;
import com.bmj.entity.TimeTable;

@Service
public class TimeTableServiceImpl implements TimeTableService {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(TimeTableServiceImpl.class);
	}
	@Autowired
	TimeTableDao dao;
	
	@Override
	public int insertTimeTable(TimeTable timetable) {
		logger.trace("여기는 Time Table 서비스~~~~~~~~~~~~~~~~~~~~~!");
		int result = dao.insert(timetable);
		return 0;
	}

}
