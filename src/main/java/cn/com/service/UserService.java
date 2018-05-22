package cn.com.service;

import java.util.Date;
import java.util.List;

import cn.com.bean.AddUser;
import cn.com.bean.User;
import cn.com.bean.UserInfo;
import cn.com.domain.AdminUserDTO;

public interface UserService {
	User findUserByUsername(String username);

	void register(String username, String password, String email);

	String findUserPasswordByUsername(String username);
	
	void updateMessage(String name,String gender, Date birthday,String idNumber,String education,String maritalStatus,String phone,Integer id);
	
	void updatePssword(String password,String username);
	
	List<UserInfo> listUser();
	
	void InsertUser(User user);
	
	void deleteUser(Integer id);
	
	User findUserById(Integer id);
	
	void updateUserMessage(String name,String gender,Date  birthday,String education,String maritalStatus,String caseHistory,String evidence,String phone
			,String  assess,Integer  agree,Integer childrenId ,Integer id);
	User findUserByChildrenId( Integer id);
}
