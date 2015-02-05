package com.bmj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bmj.entity.users;

@Repository
public class UsersDaoImpl implements UsersDao {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersDaoImpl.class);
	}
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "mybatis.mapper.Users.";

	@Override
	public Integer getUsersCount() {
		String stmt = namespace + "selectUsersCnt";
		return sqlSession.selectOne(stmt);
	}

	@Override
	public int insertUser(users user) {
		String stmt = namespace + "insertUser";
		return sqlSession.insert(stmt, user);
	}

}
