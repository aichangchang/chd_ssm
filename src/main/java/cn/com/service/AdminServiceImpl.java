package cn.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.Employee;
import cn.com.dao.adminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private adminMapper adminMapper;

	public Employee findAdminByUsername(String usernname) {
		return adminMapper.findAdminByUsername(usernname);
	}

	public Employee findAdminByUsernameAndPassword(String username, String password) {
		Employee employee = adminMapper.findAdminByUsernameAndPassword(username,password);
		return employee;
	}

}
