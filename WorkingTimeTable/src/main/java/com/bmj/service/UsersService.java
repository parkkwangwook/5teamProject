package com.bmj.service;

import com.bmj.entity.users;

public interface UsersService {
	Integer getUsersCount();
	int insertUser(users user);
}
