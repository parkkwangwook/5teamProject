package com.bmj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bmj.entity.Company;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyDaoImpl.class);
	}
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "mybatis.mapper.Companys.";
	@Override
	public int insert(Company company) {
		logger.trace("수업 : 여기는 DaoImpl......!" + company);
		if(company.getHolidayComm() == null) {
			company.setHolidayComm(0.0f);
			
		} 
		if (company.getNightComm() == null) {
			company.setNightComm(0.0f);
		}
		logger.trace("수업 : ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ" + company);
		String stmt = namespace + "insertCompany";
		return sqlSession.insert(stmt, company);
	}
}
