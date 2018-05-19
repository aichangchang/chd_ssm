package cn.com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.bean.EditNews;
import cn.com.bean.News;
import cn.com.bean.NewsCategory;

public interface NewsMapper {
	List<News> listNews(@Param("categoryId") Integer categoryId, @Param("num") Integer num);

	News getNewsById(@Param("id") Integer id);

	List<NewsCategory> listNewsCategoryName();

	void insertNews(News news);

	List<News> listNewsAll();

	List<News> listNewsByCategoryId(@Param("categoryId") Integer categoryId);

	void deleteNews(@Param("id") Integer id);

	EditNews editNews(@Param("id") Integer id);
	
	void updateArticle(@Param("id") Integer id ,@Param("title") String title, @Param("author") String author,@Param("content") String content);
}
