package cn.com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.apache.ibatis.annotations.Param;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.bean.AddUser;
import cn.com.bean.Children;
import cn.com.bean.DEmployee;
import cn.com.bean.Department;
import cn.com.bean.Employee;
import cn.com.bean.ListEmployee;
import cn.com.bean.News;
import cn.com.bean.NewsCategory;
import cn.com.bean.ResponseResult;
import cn.com.bean.User;
import cn.com.bean.UserInfo;
import cn.com.domain.AdminUserDTO;
import cn.com.domain.NewsDto;
import cn.com.service.AdminService;
import cn.com.service.ChildrenService;
import cn.com.service.NewsService;
import cn.com.service.UserService;
import cn.com.service.departmentService;

@Controller
@RequestMapping("/admin")
public class adminController {
	@Autowired
	NewsService newsService;

	@Autowired
	AdminService adminService;

	@Autowired
	UserService userService;

	@Autowired
	ChildrenService childrenService;

	@Autowired
	departmentService departmentService;
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

	@RequestMapping("/addUsers.do")
	public String addUsers() {
		return "addUsers";
	}

	@RequestMapping("/addArticle.do")
	public String addArticle(ModelMap modelMap) {
		List<NewsCategory> newsCategories = newsService.listNewsCategory();
		modelMap.addAttribute("categoryName", newsCategories);
		return "addArticle";
	}
	
	@RequestMapping("/listArticle.do")
	public String listAticle(@RequestParam(required = true, defaultValue = "1") Integer page, ModelMap modelMap) {
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
		result = new ResponseResult<Void>();
		result.setCode(1);
		result.setMessage("success");
		return result;
	}

	@RequestMapping("/listUsers.do")
	public String listUser(@RequestParam(required = true, defaultValue = "1") Integer page, ModelMap modelMap) {
		PageHelper.startPage(page, 5);
		List<UserInfo> usersInfo = userService.listUser();
		PageInfo<UserInfo> p = new PageInfo<UserInfo>(usersInfo);
		modelMap.addAttribute("page", p);
		modelMap.addAttribute("listUsersInfo", usersInfo);
		return "listUsers";
	}

	@RequestMapping("/handleAddUsers.do")
	@ResponseBody
	public ResponseResult<Void> handleAddUsers(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("gender") String gender, @RequestParam("birthday") String birthday,
			@RequestParam("education") String education, @RequestParam("maritalStatus") String maritalStatus,
			@RequestParam("caseHistory") String caseHistory, @RequestParam("phone") String phone)
			throws ParseException {
		result = new ResponseResult<Void>();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setGender(gender);
		user.setName(name);
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
		user.setBirthday(date);
		user.setEducation(education);
		user.setMaritalStatus(maritalStatus);
		user.setCaseHistory(caseHistory);
		userService.InsertUser(user);
		result.setCode(1);
		result.setMessage("success");
		return result;
	}

	@RequestMapping("/CheckUsername.do")
	@ResponseBody
	public ResponseResult<Void> CheckUsername(@RequestParam("username") String username) {
		result = new ResponseResult<Void>();
		User user = userService.findUserByUsername(username);
		if (user == null) {
			result.setCode(1);
		} else {
			result.setCode(-1);
		}
		return result;
	}

	@RequestMapping("/deleteUser.do")
	public String deleteUser(@RequestParam("id") Integer id) {
		userService.deleteUser(id);
		return "redirect:listUsers.do";
	}

	@RequestMapping("/editUsers.do")
	public String editUsers(@RequestParam("id") Integer id, ModelMap modelMap) {
		User user = userService.findUserById(id);
		Children children = childrenService.findChildrenById(user.getChildrenId());
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("children", children);
		return "editUsers";
	}

	@RequestMapping("/handleEditUsers.do")
	@ResponseBody
	public ResponseResult<Void> handleEditUsers(@RequestParam("id") Integer id, @RequestParam("name") String name,
			@RequestParam("gender") String gender, @RequestParam("birthday") String birthday,
			@RequestParam("education") String education, @RequestParam("maritalStatus") String maritalStatus,
			@RequestParam("caseHistory") String caseHistory, @RequestParam("evidence") String evidence,
			@RequestParam("phone") String phone, @RequestParam("assess") String assess,
			@RequestParam("agree") Integer agree, @RequestParam(value = "cname", required = false) String cname)
			throws ParseException {
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
		Children children = childrenService.findChildrenByName(cname);
		userService.updateUserMessage(name, gender, date, education, maritalStatus, caseHistory, evidence, phone,
				assess, agree, children.getId(), id);
		result = new ResponseResult<Void>(1, "success");
		return result;
	}

	@RequestMapping("/handleAssessUsers.do")
	@ResponseBody
	public ResponseResult<Void> handleAssessUsers(@RequestParam("assess") String assess,
			@RequestParam("agree") Integer agree, @RequestParam(value = "cname", required = false) String cname){
		result = new ResponseResult<Void>(1, "success");
		return result;
	}
	
	@RequestMapping("/detialUsers.do")
	public String detialUsers(@RequestParam("id") Integer id, ModelMap modelMap) {
		User user = userService.findUserById(id);
		modelMap.addAttribute("user", user);
		return "detialUsers";
	}

	@RequestMapping("/addChildren.do")
	public String addChildren() {
		return "addChildren";
	}

	@RequestMapping("/handleAddChildren.do")
	@ResponseBody
	public ResponseResult<Void> handleAddChildren(@RequestParam("number") Integer number,
			@RequestParam("cname") String cname, @RequestParam("cage") Integer cage,
			@RequestParam("cgender") String cgender, @RequestParam("cbirthday") String cbirthday,
			@RequestParam("reach") String reach, @RequestParam("caseHistory") String caseHistory,
			@RequestParam("cmessage") String cmessage) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Children children = new Children();
		children.setNumber(number);
		children.setCname(cname);
		children.setCage(cage);
		children.setCgender(cgender);
		children.setCbirthday(simpleDateFormat.parse(cbirthday));
		children.setReach(simpleDateFormat.parse(reach));
		children.setcCaseHistory(caseHistory);
		children.setcMessage(cmessage);
		childrenService.insertChildren(children);
		result = new ResponseResult<Void>(1, "success");
		return result;
	}

	@RequestMapping("/listChildren.do")
	public String listChildren(ModelMap modelMap, @RequestParam(required = true, defaultValue = "1") Integer page) {
		PageHelper.startPage(page, 5);
		List<Children> childrens = childrenService.listChildren();
		PageInfo<Children> childrenInfo = new PageInfo<Children>(childrens);
		modelMap.addAttribute("page", childrenInfo);
		modelMap.addAttribute("listChildren", childrens);
		return "listChildren";
	}

	@RequestMapping("/deleteChildren.do")
	public String deleteChildren(@RequestParam("id") Integer id) {
		childrenService.deleteChildren(id);
		return "redirect:listChildren.do";
	}

	@RequestMapping("/editChildren.do")
	public String editChildren(@RequestParam("id") Integer id, ModelMap modelMap) {
		Children children = childrenService.findChildrenById(id);
		List<User> user = userService.findUserByChildrenId(id);
		modelMap.addAttribute("children", children);
		modelMap.addAttribute("listUser", user);
		return "editChildren";
	}

	@RequestMapping("/handleChildren.do")
	@ResponseBody
	public ResponseResult<Void> handleEditUsers(@RequestParam("id") Integer id, @RequestParam("number") Integer number,
			@RequestParam("name") String cname, @RequestParam("gender") String cgender,
			@RequestParam("birthday") String cbirthday, @RequestParam("reach") String reach,
			@RequestParam("caseHistory") String cCaseHistory, @RequestParam("record") String record,
			@RequestParam("agree") Integer cagree, @RequestParam(value = "uname", required = false) String uname)
			throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		childrenService.updateChildren(id, number, cname, cgender, simpleDateFormat.parse(cbirthday),
				simpleDateFormat.parse(reach), cCaseHistory, record, cagree, uname);
		result = new ResponseResult<Void>(1, "success");
		return result;
	}

	@RequestMapping("/detialChildren.do")
	public String detialChildren(@RequestParam("id") Integer id, ModelMap modelMap) {
		Children children = childrenService.findChildrenById(id);
		modelMap.addAttribute("children", children);
		return "detialChildren";
	}

	@RequestMapping("/detialDep.do")
	public String detialDep(ModelMap modelMap) {
		List<DEmployee> departments = departmentService.listDEmployee();
		System.out.println(departments);
		modelMap.addAttribute("departments", departments);
		return "detialDep";
	}

	@RequestMapping("/listDepartment.do")
	public String listDepartment(@RequestParam(required = true, defaultValue = "1") Integer page, ModelMap modelMap) {
		PageHelper.startPage(page, 4);
		List<Department> departments = departmentService.listDepartment();
		PageInfo<Department> info = new PageInfo<Department>(departments);
		modelMap.addAttribute("page", info);
		modelMap.addAttribute("listDepartment", departments);
		return "listDepartment";
	}

	@RequestMapping("/deleteDepartment.do")
	public String deleteDepartment(@RequestParam("id") Integer id) {
		departmentService.deleteDepartment(id);
		return "redirect:listDepartment.do";
	}

	@RequestMapping("/addDepartment.do")
	public String addDepartment() {
		return "addDepartment";
	}

	@RequestMapping("/handleAddDepartment.do")
	public String handleAddDepartment(@RequestParam("dname") String dname) {
		departmentService.insertDepartment(dname);
		return "redirect:addDepartment.do";
	}

	@RequestMapping("/CheckaddDepartment.do")
	@ResponseBody
	public ResponseResult<Void> checkaddDepartment(@RequestParam("dname") String dname) {
		result = new ResponseResult<Void>();
		Department department = departmentService.getDepartmentByname(dname);
		if (department == null) {
			result.setCode(1);
			result.setMessage("success");
			return result;
		}
		if (dname.equals(department.getDname())) {
			result.setCode(-1);
			result.setMessage("fail");
		} else {
			result.setCode(1);
			result.setMessage("success");
		}
		return result;
	}

	@RequestMapping("/editDepartment.do")
	public String editDepartment(@RequestParam("id") Integer id, ModelMap modelMap) {
		Department department = departmentService.getDeparmentById(id);
		modelMap.addAttribute("department", department);
		return "editDepartment";
	}
	@RequestMapping("/listEmployee.do")
	public String  listEmployee(ModelMap modelMap ,@RequestParam(required = true, defaultValue = "1") Integer page) {
		PageHelper.startPage(page,4);
		List<ListEmployee> listEmployees=	adminService.listEmployee();
		PageInfo<ListEmployee> p = new PageInfo<ListEmployee>(listEmployees);
		modelMap.addAttribute("listEmployee",listEmployees);
		modelMap.addAttribute("page", p);
		return "listEmployee";
	}
	
	@RequestMapping("/editEmployee.do")
	public String editEmployee(@RequestParam("id")Integer id,ModelMap modelMap) {
		Employee employee=adminService.findAdminById(id);
		List<Department> departments  =	departmentService.listDepartment();
		System.out.println(departments);
		modelMap.addAttribute("departments", departments);
		modelMap.addAttribute("employee", employee);
		return "editEmployee";
	}
	@RequestMapping("/handleEditEmployee.do")
	public String handleEditEmployee() {
		return "editEmployee";
	}
	@RequestMapping("/deleteEmployee.do")
	public String deleteEmployee(@RequestParam("id")Integer id) {
		adminService.deleteEmployee(id);
		 return "redirect:listEmployee.do";
	}
	
	@RequestMapping("/assessUser.do")
	public String assessUser(@RequestParam("id") Integer id,ModelMap modelMap) {
		User user = userService.findUserById(id);
		Children children = childrenService.findChildrenById(user.getChildrenId());
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("children", children);
		return "assessUser";
	}
	
}
