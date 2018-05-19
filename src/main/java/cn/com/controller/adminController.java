package cn.com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.bean.Employee;
import cn.com.bean.News;
import cn.com.bean.NewsCategory;
import cn.com.bean.ResponseResult;
import cn.com.domain.NewsDto;
import cn.com.service.AdminService;
import cn.com.service.NewsService;
import cn.com.service.UserService;

@Controller
@RequestMapping("/admin")
public class adminController {
	@Autowired
	NewsService newsService;

	@Autowired
	AdminService adminService;

	ResponseResult<Void> result;

	@RequestMapping("/index.do")
	public String admin(HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "adminLogin";
		}
		return "adminIndex";
	}

	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

	@RequestMapping("/login.do")
	public String adminLogin() {
		return "adminLogin";
	}

	@RequestMapping("/addArticle.do")
	public String addArticle(ModelMap modelMap) {
		List<NewsCategory> newsCategories = newsService.listNewsCategory();
		modelMap.addAttribute("categoryName", newsCategories);
		return "addArticle";
	}

	@RequestMapping("/listArticle.do")
	public String listAticle(@RequestParam(required = true, defaultValue = "1") Integer page,
			HttpServletRequest request, ModelMap modelMap) {
		PageHelper.startPage(page, 5);
		List<News> listNews = newsService.listNewsAll();
		PageInfo<News> p = new PageInfo<News>(listNews);
		modelMap.addAttribute("page", p);
		modelMap.addAttribute("newsList", listNews);
		return "listArticle";
	}

	@RequestMapping("/handleLogin.do")
	@ResponseBody
	public ResponseResult<Void> handleLogin(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {
		Employee employee = adminService.findAdminByUsernameAndPassword(username, password);
		result = new ResponseResult<Void>();
		if (employee != null) {
			session.setAttribute("id", employee.getId());
			session.setAttribute("adminname", employee.getUsername());
			result.setCode(1);
			result.setMessage("success");
		} else {
			result.setCode(-1);
			result.setMessage("fail");
		}
		return result;
	}

	@RequestMapping("/handleArticle.do")
	@ResponseBody
	public ResponseResult<Void> handleArticle(NewsDto newDto) {
		result = new ResponseResult<Void>();
		News news = new News();
		news.setTitle(newDto.getTitle());
		news.setAuthor(newDto.getAuthor());
		news.setCategoryId(newDto.getCategoryId());
		news.setContent(newDto.getContent());
		news.setCount(0);
		news.setCreateTime(new Date());
		newsService.insertNews(news);
		result.setCode(1);
		result.setMessage("success");
		return result;
	}

	@RequestMapping("/deleteArticle.do")
	public String deleteArticle(@RequestParam("id") Integer id) {
		newsService.deleteNews(id);
		return "redirect:listArticle.do";
	}

	@RequestMapping("/editArticle.do")
	public String editArticle(@RequestParam("id") Integer id, ModelMap modelMap) {
		System.out.println(id);
		News news = newsService.getNewsById(id);
		System.out.println(news);
		modelMap.addAttribute("news", news);
		return "editArticle";
	}
	@RequestMapping("/updateArticle.do")
	@ResponseBody
	public ResponseResult<Void> updateArticle(News news) {
	System.out.println(news);
		newsService.updateArticle(news.getId(), news.getTitle(), news.getAuthor(), news.getContent());
		result=new ResponseResult<Void>();
		result.setCode(1);
		result.setMessage("success");
		return result;
	}
}
