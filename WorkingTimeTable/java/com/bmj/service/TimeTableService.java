package com.bmj.service;
import java.util.List;

import com.bmj.entity.TimeTable;

public interface TimeTableService {
	int insertTimeTable(TimeTable timetable);
	List<TimeTable> selectByCompanyCode(int CompanyCode);
	List<TimeTable> selectByMemberId(int memberId);
}
