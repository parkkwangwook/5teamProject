package com.bmj.dao;

import com.bmj.entity.users;

public interface UsersDao {
	Integer getUsersCount();
	int insertUser(users user);
}
