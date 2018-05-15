package cn.com.service;

import java.util.Date;

import cn.com.bean.User;

public interface UserService {
	User findUserByUsername(String username);

	void register(String username, String password, String email);

	String findUserPasswordByUsername(String username);
	
	void updateMessage(String name,String gender,String nation,String education,String maritalStatus,String phone,Integer id);
}
