package com.bmj.dao;

import com.bmj.entity.Users;

public interface UsersDao {
	Integer getUsersCount();
	int insertUser(Users user);
	int updateUser(Users user);
	Users selectUser(Users user);
	int selectbyUserId(String userId);
}
