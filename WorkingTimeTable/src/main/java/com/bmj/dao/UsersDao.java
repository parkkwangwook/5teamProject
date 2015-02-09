package com.bmj.dao;

import com.bmj.entity.Users;

public interface UsersDao {
	Integer getUsersCount();
	int insertUser(Users user);
	Users selectUser(Users user);
	int selectbyUserId(String userId);
}
