package cn.com.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.DEmployee;
import cn.com.bean.Department;
import cn.com.bean.Employee;
import cn.com.dao.DepartmentMapper;

@Service
public class departmentServiceImpl implements departmentService {
	@Autowired
	DepartmentMapper departmentMapper;

	public void insertDepartment(String dname) {
		departmentMapper.insertDepartment(dname);
	}

	public Department getDepartmentByname(String dname) {
		return departmentMapper.getDepartmentByname(dname);
	}

	public List<Department> listDepartment() {
		return departmentMapper.listDepartment();
	}

	public List<DEmployee> listDEmployee() {
		return departmentMapper.listDEmployee();
	}

	public void deleteDepartment(Integer id) {
		departmentMapper.deleteDepartment(id);
	}

	public Department getDeparmentById(Integer id) {
		return departmentMapper.getDeparmentById(id);
	}
	
}
