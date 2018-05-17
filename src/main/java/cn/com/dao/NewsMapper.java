package cn.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.News;
import cn.com.bean.NewsCategory;

public interface NewsMapper {
	List<News> listNews(@Param("categoryId") Integer categoryId, @Param("num") Integer num);

	News getNewsById(@Param("id") Integer id);

	List<NewsCategory> listNewsCategoryName();

	void insertNews(@Param("title") String title, @Param("author") String author, @Param("content") String content,@Param("categoryId") Integer  categoryId );
	
}
