package com.bmj.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bmj.dao.CompanyPersonDao;
import com.bmj.entity.CompanyPerson;

@Service
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
	public CompanyPerson selectCompanyPersonByUserId(String userId) {
		CompanyPerson result = dao.selectCompanyPersonByUserId(userId);
		if(result == null){
			logger.trace("nulllllllllllllllllllllllllllllllllllllllllllll");
		}
		return result;
	}

	@Override
	public List<CompanyPerson> selectByCompanyCode(int companyCode) {
		logger.trace("숙제 서비스 : " + companyCode);
		List<CompanyPerson> result = dao.selectByCompanyCode(companyCode);
		return result;
	}

	@Override
	public int insertCompanyOwner(CompanyPerson companyperson) {
		logger.trace("여기는 서비스~~~~~~~~~~~~~~~!");
		int result = dao.insertCompanyOwner(companyperson);
		return result;
	}

	@Override
	public int selectComCodeByUserId(String userId) {
		int result = dao.selectComCodeByUserId(userId);
		return result;
	}

	@Override
	public int insertCompanyEmployee(CompanyPerson companyperson) {
		int result = dao.insertCompanyEmployee(companyperson);
		return result;
	}


}
