package cn.com.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.User;

public interface UserMapper {
	User findUserByUsername(@Param("username") String usernname);

	void saveUser(@Param("username") String username, @Param("password") String password, @Param("email") String email);

	String findUserPasswordByUsername(@Param("username") String username);

	void updateMessage(@Param("name") String name, @Param("gender") String gender, @Param("birthday") Date birthday,
			@Param("idNumber") String idNumber, @Param("education") String education,
			@Param("maritalStatus") String maritalStatus, @Param("phone") String phone, @Param("id") Integer id);

	void updatePassword(@Param("password") String password,@Param("username") String username);
}
