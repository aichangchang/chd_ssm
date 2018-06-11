package cn.com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.bean.Children;
import cn.com.bean.News;
import cn.com.bean.ResponseResult;
import cn.com.bean.User;
import cn.com.service.ChildrenService;
import cn.com.service.NewsService;
import cn.com.service.UserService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private ChildrenService ChildrenService;
	
	@Autowired
	private UserService UserService;

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
	public String about(@RequestParam("id") Integer id, ModelMap modelMap) {
		News news = newsService.getNewsById(id);
		modelMap.addAttribute("news", news);
		return "c_about";
	}

	@RequestMapping("/c_environment.do")
	public String environment() {
		return "c_environment";
	}
	@RequestMapping("/c_contact.do")
	public String contact(){
		return "c_contact";
	}
	@RequestMapping("/law.do")
	public String law(@RequestParam("id") Integer categoryId, ModelMap modelMap) {
		List<News> news = newsService.listNewsByCategoryId(categoryId);
		modelMap.addAttribute("listNews", news);
		return "c_law";
	}
	@RequestMapping("/adopt.do")
	public String adopt(ModelMap modelMap,@RequestParam(defaultValue="1",required=true)Integer page) {
		PageHelper.startPage(page, 5);
		List<Children> children=ChildrenService.listAdoptChildren();
		PageInfo<Children> p= new PageInfo<Children>(children);
		modelMap.addAttribute("page",p);
		modelMap.addAttribute("listChildren", children);
		return "adopt";
	}
	@RequestMapping("/handleAdopt.do")
	@ResponseBody
	public  ResponseResult<Void> handleAdopt(HttpSession session){
		ResponseResult<Void> result =new ResponseResult<Void>();
		Integer id=(Integer)session.getAttribute("uid");
		if (id==null) {
			result.setCode(-1);
			result.setMessage("请先登陆");
			return result;
		}
		User user=UserService.findUserById(id);
		System.out.println(user);
		if (user.getAccess()==null) {
			result.setCode(-1);
			result.setMessage("请提交相关证明,开通权限");
		}else {
			result.setCode(1);
			result.setMessage("已有权限");
		}
		return result;
	}
}
