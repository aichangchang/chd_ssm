package cn.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.User;
import cn.com.dao.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	public User findUserByUsername(String username) {
		User user = userMapper.findUserByUsername(username);
		return user;
	}

	public void register(String username, String password, String email) {
		userMapper.saveUser(username, password, email);
	}

	public String findUserPasswordByUsername(String username) {
		String password = userMapper.findUserPasswordByUsername(username);
		return password;
	}
}
