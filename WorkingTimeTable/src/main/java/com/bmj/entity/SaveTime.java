package com.bmj.entity;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SaveTime {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(SaveTime.class);
	}
	private String id;
	private String title;
	private String timeStart;
	private String timeEnd;
	
	public SaveTime() {}

	public SaveTime(Object obj) {
		logger.trace("수업 obj : " + obj);
		ArrayList<String> tmplist = new ArrayList<String>();
		
		StringTokenizer st1 = new StringTokenizer(obj.toString(), "\",{}");
		int i = 0;
		String context = "";

		while(st1.hasMoreTokens()) {
			context = st1.nextToken();
			logger.trace("수업 " + i + ", " + context);

			if ( i == 2 || i == 5 || i == 8 || i == 11) {
				tmplist.add(context);
			}
			i++;
		}
		logger.trace("list : " + tmplist);
		this.id = tmplist.get(0);
		this.title = tmplist.get(1);
		this.timeStart = tmplist.get(2);
		this.timeEnd = tmplist.get(3);
		
	}
	
	
	public SaveTime(String id, String title, String timeStart, String timeEnd) {
		this.id = id;
		this.title = title;
		this.timeStart = timeStart;
		this.timeEnd = timeEnd;		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTimeStart() {
		return timeStart;
	}

	public void setTimeStart(String timeStart) {
		this.timeStart = timeStart;
	}

	public String getTimeEnd() {
		return timeEnd;
	}

	public void setTimeEnd(String timeEnd) {
		this.timeEnd = timeEnd;
	}

	@Override
	public String toString() {
		return "SaveTime [id=" + id + ", title=" + title + ", timeStart="
				+ timeStart + ", timeEnd=" + timeEnd + "]";
	}
	
}
