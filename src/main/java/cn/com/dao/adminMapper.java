package cn.com.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.Employee;
import cn.com.bean.ListEmployee;
import cn.com.bean.User;

public interface adminMapper {
	Employee findAdminByUsername(@Param("username") String usernname);

	Employee findAdminByUsernameAndPassword(@Param("username") String username,@Param("password")String password);
	
	List<ListEmployee> listEmployee();
	
	void deleteEmployee(@Param("id") Integer id);
	
	Employee findAdminById(@Param("id") Integer id);
	
	
}
