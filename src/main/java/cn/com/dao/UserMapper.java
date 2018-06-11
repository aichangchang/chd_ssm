package cn.com.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.AddUser;
import cn.com.bean.User;
import cn.com.bean.UserInfo;
import cn.com.domain.AdminUserDTO;

public interface UserMapper {
	User findUserByUsername(@Param("username") String usernname);

	void saveUser(@Param("username") String username, @Param("password") String password, @Param("email") String email);

	String findUserPasswordByUsername(@Param("username") String username);

	void updateMessage(@Param("name") String name, @Param("gender") String gender, @Param("birthday") Date birthday,
			@Param("idNumber") String idNumber, @Param("education") String education,
			@Param("maritalStatus") String maritalStatus, @Param("phone") String phone, @Param("id") Integer id);

	void updatePassword(@Param("password") String password, @Param("username") String username);

	List<UserInfo> listUser();

	void InsertUser(User user);

	void deleteUser(@Param("id") Integer id);

	User findUserById(@Param("id") Integer id);

	void updateUserMessage(@Param("name") String name, @Param("gender") String gender, @Param("birthday") Date birthday,
			@Param("education") String education, @Param("maritalStatus") String maritalStatus,
			@Param("caseHistory") String caseHistory, @Param("evidence") String evidence, @Param("phone") String phone,
			@Param("assess") String assess, @Param("agree") Integer agree, @Param("childrenId") Integer childrenId,
			@Param("id") Integer id);

	List<User> findUserByChildrenId(@Param("childrenId") Integer id);

	void adoptChildren(@Param("childrenId") Integer childrenId,@Param("id") Integer id);

}
