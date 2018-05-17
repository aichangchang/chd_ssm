package cn.com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.bean.News;
import cn.com.bean.NewsCategory;
import cn.com.dao.NewsMapper;
@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsMapper newsMapper;

	public List<News> listNews(Integer categoryId, Integer num) {
		List<News> listNews = newsMapper.listNews(categoryId, num);
		return listNews;
	}

	public News getNewsById(Integer id) {
		News news=newsMapper.getNewsById(id);
		return news;
	}

	public List<NewsCategory> listNewsCategory() {
		return newsMapper.listNewsCategoryName();
	}

	public void insertNews(String title, String author, String content, Integer categoryId) {
		
	}


}
