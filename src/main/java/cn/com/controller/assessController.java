package cn.com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.bean.ResponseResult;
import cn.com.bean.User;
import cn.com.service.UserService;

@Controller
@RequestMapping("/assess")
public class assessController {
	ResponseResult<Void> result;
	@Autowired
	UserService userService;

	@RequestMapping("/index.do")
	public String index() {
		return "assessindex";
	}

	@RequestMapping("/assess_personal_info.do")
	public String assessPersonalInfo() {
		return "assessinfo";
	}
	
	@RequestMapping("/assessing")
	public String assessing() {
		return "assessing";
	}
	@RequestMapping("/handleLogin.do")
	@ResponseBody
	public ResponseResult<Void> handleLogin(@RequestParam("password") String password,
			@RequestParam("username") String username, HttpSession session) {
		result = new ResponseResult<Void>();
		User user = userService.findUserByUsername(username);
		if (user != null && password.equals(user.getPassword())) {
			result.setCode(1);
			result.setMessage("登录成功");
			session.setAttribute("username", user.getUsername());
			session.setAttribute("uid", user.getId());
		} else {
			result.setCode(-1);
			result.setMessage("账号或者密码出错,请重新登录！");
		}
		return result;
	}

	/**
	 * 处理上载请求
	 */
	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> upload(MultipartFile file, HttpServletRequest request) throws IOException {
		// 打桩输出上载结果

		System.out.println(file);
		// 获取上载文件信息
		System.out.println(file.getContentType());
		System.out.println(file.getName());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		// 保存到文件系统
		String path = "/file";// WEB路径
		path = request.getServletContext().getRealPath(path);
		System.out.println(path);
		// 创建upload文件夹
		File dir = new File(path);
		dir.mkdir();
		File files = new File(dir, file.getOriginalFilename());
		// 将上载文件保存到文件中
		file.transferTo(files);
		result = new ResponseResult<Void>();
		result.setCode(0);
		result.setMessage("上载成功");
		return result;
	}

	@RequestMapping("/startAssess.do")
	public String startAssess() {
		return "assess";
	}
}
