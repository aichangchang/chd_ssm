package cn.com.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.sym.Name;

import cn.com.bean.AddUser;
import cn.com.bean.User;
import cn.com.bean.UserInfo;
import cn.com.dao.UserMapper;
import cn.com.domain.AdminUserDTO;

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

	public void updateMessage(String name, String gender, Date birthday, String idNumber, String education,
			String maritalStatus, String phone, Integer id) {
		userMapper.updateMessage(name, gender, birthday, idNumber, education, maritalStatus, phone, id);
	}

	public void updatePssword(String password, String username) {
		userMapper.updatePassword(password, username);
	}

	public List<UserInfo> listUser() {
		List<UserInfo> users = userMapper.listUser();
		return users;
	}

	public void InsertUser(User user) {
		userMapper.InsertUser(user);
	}

	public void deleteUser(Integer id) {
		userMapper.deleteUser(id);
	}

	public User findUserById(Integer id) {
		User user = userMapper.findUserById(id);
		return user;
	}

	

	public void updateUserMessage(String name, String gender, Date birthday, String education, String maritalStatus,
			String caseHistory, String evidence, String phone, String assess, Integer agree,Integer childrenId,Integer id) {
		userMapper.updateUserMessage(name, gender, birthday, education, maritalStatus, caseHistory, evidence, phone, assess, agree,childrenId,id);
		
	}

	public User findUserByChildrenId(Integer id) {
		return userMapper.findUserByChildrenId(id);
	}

}
