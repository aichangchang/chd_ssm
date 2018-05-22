package cn.com.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.Children;
import cn.com.bean.User;
import cn.com.dao.ChildrenMapper;

@Service
public class ChildrenServiceImpl implements ChildrenService {

	@Autowired
	ChildrenMapper childrenMapper;

	public Children findChildrenById(Integer id) {
		return childrenMapper.findChildrenById(id);
	}

	public Children findChildrenByName(String cname) {
		return childrenMapper.findChildrenByName(cname);
	}

	public void insertChildren(Children children) {
		childrenMapper.insertChildren(children);
	}

	public List<Children> listChildren() {
		return childrenMapper.listChildren();
	}

	public void deleteChildren(Integer id) {
		childrenMapper.deleteChildren(id);
	}

	public void updateChildren(Integer id, Integer number,  String name, String gender,
			Date birthday, Date reach, String caseHistory, String record,
			 Integer agree) {
		childrenMapper.updateChildren(id, number, name, gender, birthday, reach, caseHistory, record, agree);
	}


}
