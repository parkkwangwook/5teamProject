package com.bmj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bmj.dao.CompanyPersonDao;
import com.bmj.entity.CompanyPerson;

@Service
@Transactional(rollbackFor=com.bmj.exception.ServiceFailException.class)
public class CompanyPersonServiceImpl implements CompanyPersonService {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonServiceImpl.class);
	}
	@Autowired
	CompanyPersonDao dao;
	
	@Override
	public int insertCompanyPerson(CompanyPerson companyperson) {
		logger.trace("여기는 서비스~~~~~~~~~~~~~~~!");
		int result = dao.insertCompanyPerson(companyperson);
		return result;
	}

	@Override
	public CompanyPerson selectCompanyCodeByUserId(String userId) {
		CompanyPerson result = dao.selectCompanyCodeByUserId(userId);
		if(result == null){
			logger.trace("nulllllllllllllllllllllllllllllllllllllllllllll");
		}
		return result;
	}
	

}
