package cn.com.service;

import java.util.List;

import cn.com.bean.News;

public interface NewsService {
	public List<News> listNews(Integer categoryId,Integer num);
	public News getNewsById(Integer id);
}
