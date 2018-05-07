package cn.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.bean.News;
import cn.com.service.NewsService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private NewsService newsService;
	@RequestMapping("/index.do")
	public String index(ModelMap modelMap) {
		List<News> oneListNews = newsService.listNews(1, 3);
		List<News> twoListNews = newsService.listNews(2, 5);
		List<News> threeListNews = newsService.listNews(2, 1);
		modelMap.addAttribute("oneListNews", oneListNews);
		modelMap.addAttribute("twoListNews", twoListNews);
		modelMap.addAttribute("threeListNews", threeListNews);
		return "index";
	}

	@RequestMapping("/article.do")
	public String article(@RequestParam("id") Integer id, ModelMap modelMap) {
		News news = newsService.getNewsById(id);
		modelMap.addAttribute("news", news);
		return "article";
	}

	@RequestMapping("/nav_about.do")
	public String navAbout(@RequestParam("id") Integer categoryId, ModelMap modelMap) {
		modelMap.addAttribute("id", categoryId);
		return "nav_about";
	}

	@RequestMapping("/c_about.do")
	public String About(@RequestParam("id") Integer categoryId, ModelMap modelMap) {
		News news = newsService.getNewsByCategoryId(categoryId);
		modelMap.addAttribute("news", news);
		return "c_about";
	}

	@RequestMapping("/c_environment.do")
	public String Environment() {
		return "c_environment";
	}

}
