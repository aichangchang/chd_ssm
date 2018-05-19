package cn.com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.bean.EditNews;
import cn.com.bean.News;
import cn.com.bean.NewsCategory;

public interface NewsService {
	List<News> listNews(Integer categoryId, Integer num);

	News getNewsById(Integer id);

	List<NewsCategory> listNewsCategory();

	void insertNews(News news);

	List<News> listNewsAll();

	List<News> listNewsByCategoryId(Integer categoryId);

	void deleteNews(Integer id);

	EditNews editNews(Integer id);

	void updateArticle( Integer id ,String title,  String author, String content);

}
