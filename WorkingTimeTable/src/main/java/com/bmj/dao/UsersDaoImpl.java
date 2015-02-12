package com.bmj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bmj.entity.Users;

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
	public int insertUser(Users user) {
		String stmt = namespace + "insertUser";
		return sqlSession.insert(stmt, user);
	}

	@Override
	public Users selectUser(Users user) {
		logger.trace("로그인하기위해 DB에서 select!! 하러옴");
		String stmt= namespace + "selectUser";
		return sqlSession.selectOne(stmt, user);
	}

	@Override
	public int selectbyUserId(String userId) {
		String stmt = namespace + "selectbyUserId";
		return sqlSession.selectOne(stmt, userId);
	}

	@Override
	public int updateUser(Users user) {
		String stmt = namespace + "updateUser";
		return sqlSession.update(stmt, user);
	}

}
