package com.bmj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bmj.entity.CompanyPerson;

@Repository
public class CompanyPersonDaoImpl implements CompanyPersonDao {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(CompanyPersonDaoImpl.class);
	}
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "mybatis.mapper.CompanyPerson.";
	@Override
	public int insertCompanyPerson(CompanyPerson companyperson) {
		logger.trace("수업 : 여기는 ComapnPersonDaoImpl......!" + companyperson);		
		String stmt = namespace + "insertCompanyPerson";
		return sqlSession.insert(stmt, companyperson);
	}
	
	@Override
	public CompanyPerson selectCompanyCodeByUserId(String userId) {
		logger.trace("!!!!!!!!!!!!!!!!!!!!!사장이 아이디로 CompanyCode찾기위해 DB로 가기전");
		String stmt = namespace + "selectCompanyCodeByUserId";
		return sqlSession.selectOne(stmt, userId);
	}
}
