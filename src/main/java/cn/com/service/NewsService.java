package cn.com.service;

import java.util.List;


import cn.com.bean.News;
import cn.com.bean.NewsCategory;

public interface NewsService {
	 List<News> listNews(Integer categoryId,Integer num);
	 News getNewsById(Integer id);
	 List<NewsCategory> listNewsCategory();
	 void insertNews( String title,  String author,  String content,Integer  categoryId );
}
