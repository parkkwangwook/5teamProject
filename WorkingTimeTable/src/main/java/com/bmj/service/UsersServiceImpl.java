package com.bmj.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bmj.dao.UsersDao;
import com.bmj.entity.Users;

@Service
@Transactional(rollbackFor=com.bmj.exception.ServiceFailException.class)
public class UsersServiceImpl implements UsersService {
	private static final Logger logger;
	static {
		logger = LoggerFactory.getLogger(UsersServiceImpl.class);
	}
	
	@Autowired
	UsersDao dao;
	
	@Override
	public Integer getUsersCount() {
		Integer result = dao.getUsersCount();
		return result;
	}

	@Override
	public int insertUser(Users user) {
		int result = dao.insertUser(user);
		return result;
	}

	@Override
	public Users loginUser(Users user) {
		Users result = dao.selectUser(user);
		logger.trace("DB에서 select!! 해온 결과!!" + result.toString());
		return result;
	}

	@Override
	public int selectbyUserId(String userId) {
		int result = dao.selectbyUserId(userId);
		return result;
	}

}
