package cn.com.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.Employee;
import cn.com.bean.ListEmployee;

public interface AdminService {

	Employee findAdminByUsername(String usernname);

	Employee findAdminByUsernameAndPassword(String username,String password);
	
	List<ListEmployee> listEmployee();
	
	void deleteEmployee(Integer id);
	
	Employee findAdminById( Integer id);
}
