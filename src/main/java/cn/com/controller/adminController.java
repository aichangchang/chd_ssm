package cn.com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.bean.Employee;
import cn.com.bean.NewsCategory;
import cn.com.bean.ResponseResult;
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
	public String listAticle() {
		return "listArticle";
	}

	@RequestMapping("/handleLogin.do")
	@ResponseBody
	public ResponseResult<Void> handleLogin(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {
		Employee employee = adminService.findAdminByUsernameAndPassword(username, password);
		result = new ResponseResult<Void>();
		if (employee!=null) {
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

}
