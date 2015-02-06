package com.bmj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bmj.dao.CompanyDao;
import com.bmj.entity.Company;

@Service
public class CompanyServiceImpl implements CompanyService {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyServiceImpl.class);
	}
	@Autowired
	CompanyDao dao;
	
	@Override
	public int insertCompany(Company company) {
		logger.trace("여기는 서비스~~~~~~~~~~~~~~~~~~~~~!");
		int result = dao.insert(company);
		return result;
	}

}
