package com.bmj.service;

import com.bmj.entity.Users;

public interface UsersService {
	Integer getUsersCount();
	int insertUser(Users user);
}
