package com.bmj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.bmj.dao.CompanyPersonDao;
import com.bmj.entity.CompanyPerson;

public class CompanyPersonServiceImpl implements CompanyPersonService {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonServiceImpl.class);
	}
	@Autowired
	CompanyPersonDao dao;
	
	@Override
	public int insertCompany(CompanyPerson companyperson) {
		logger.trace("여기는 서비스~~~~~~~~~~~~~~~!");
		int result = dao.insertCompanyPerson(companyperson);
		return result;
	}

}
