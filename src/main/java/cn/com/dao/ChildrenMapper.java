package cn.com.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.bean.Children;

public interface ChildrenMapper {
	Children findChildrenById(@Param("id") Integer id);

	Children findChildrenByName(@Param("cname") String cname);
	
	void insertChildren(Children children);
	
	List<Children> listChildren();
	
	void deleteChildren(Integer id);
	
	void updateChildren(@Param("id") Integer id,@Param("number") Integer number, @Param("name") String name,@Param("gender") String gender,
			@Param("birthday") Date birthday,@Param("reach") Date reach,@Param("caseHistory") String caseHistory,@Param("record") String record,
			@Param("agree") Integer agree);
    
}
