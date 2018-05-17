package cn.com.service;


import cn.com.bean.Employee;

public interface AdminService {

	Employee findAdminByUsername(String usernname);

	Employee findAdminByUsernameAndPassword(String username,String password);
}
