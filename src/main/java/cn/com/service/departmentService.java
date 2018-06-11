package cn.com.service;

import java.util.List;

import cn.com.bean.DEmployee;
import cn.com.bean.Department;

public interface departmentService {
	void insertDepartment(String dname);
	
	Department getDepartmentByname(String dname);
	
	List<Department> listDepartment();
	
	List<DEmployee> listDEmployee();
	
	void deleteDepartment(Integer id);
	
	Department getDeparmentById(Integer id);
 }
