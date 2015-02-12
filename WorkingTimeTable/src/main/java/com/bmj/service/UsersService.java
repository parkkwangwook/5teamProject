package com.bmj.service;

import com.bmj.entity.Users;

public interface UsersService {
	Integer getUsersCount();
	int insertUser(Users user);
	int updateUser(Users user);
	int updatePassUser(Users user);
	Users loginUser(Users user);
	int selectbyUserId(String userId);
}
