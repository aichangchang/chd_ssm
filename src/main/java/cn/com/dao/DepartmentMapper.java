package cn.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.DEmployee;
import cn.com.bean.Department;

public interface DepartmentMapper {
	List<Department> listDepartment();

	void insertDepartment(String dname);

	Department getDepartmentByname(String dname);
	
	List<DEmployee> listDEmployee();
	
	void deleteDepartment(@Param("id")Integer id);
	
	Department getDeparmentById(@Param("id")Integer id);
}
