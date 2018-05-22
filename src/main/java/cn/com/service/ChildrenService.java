package cn.com.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.Children;
import cn.com.bean.User;

public interface ChildrenService {
	Children findChildrenById(Integer id);

	Children findChildrenByName(String cname);

	void insertChildren(Children children);

	List<Children> listChildren();

	void deleteChildren(Integer id);
	
	void updateChildren(Integer id, Integer number,  String name, String gender,
			 Date birthday, Date reach, String caseHistory, String record,
			 Integer agree);

	
}
