package chd_ssm;

import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.com.bean.News;
import cn.com.dao.NewsMapper;

public class test {
	@Test
	public void fun() {
		String file = "spring-dao.xml";
		AbstractApplicationContext ctx
			= new ClassPathXmlApplicationContext(file);
		NewsMapper newsMapper
			= ctx.getBean("newsMapper", NewsMapper.class);
		System.out.println(newsMapper.listNews(1,3));
		ctx.close();

	}
}
