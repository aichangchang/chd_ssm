package cn.com.service;

import cn.com.bean.User;

public interface UserService {
	User findUserByUsername(String username);

	void register(String username, String password, String email);

	String findUserPasswordByUsername(String username);
}
