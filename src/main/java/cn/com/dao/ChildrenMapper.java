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
	
	void updateChildren(@Param("id") Integer id,@Param("number") Integer number, @Param("cname") String name,@Param("cgender") String gender,
			@Param("cbirthday") Date birthday,@Param("reach") Date reach,@Param("cCaseHistory") String caseHistory,@Param("cMessage") String record,
			@Param("cagree") Integer agree,@Param("uname") String uname );
    
	List<Children> listAdoptChildren();
}
