package cn.com.dao;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.User;

public interface UserMapper {
	User findUserByUsername(@Param("username") String usernname);

	void saveUser(@Param("username") String username, @Param("password") String password, @Param("email") String email);

	String findUserPasswordByUsername(@Param("username") String username);

}
