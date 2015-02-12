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
	public Users loginUser(Users user) {
		logger.trace("로그인하기위해 DB에서 select!! 하러옴");
		String stmt= namespace + "loginUser";
		Users result = sqlSession.selectOne(stmt, user);
		if( sqlSession.selectOne(stmt, user) == null){
			logger.trace("일치하는 사용자가 없음!!!");
		}
		
		return result;
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

	@Override
	public int updatePassUser(Users user) {
		String stmt = namespace + "updatePassUser";
		return sqlSession.update(stmt, user);
	}

	@Override
	public int deleteUser(Users user) {
		String stmt = namespace + "deleteUser";
		return sqlSession.update(stmt, user);
	}

}
