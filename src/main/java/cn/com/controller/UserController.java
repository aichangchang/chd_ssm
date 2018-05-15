package cn.com.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;

import cn.com.bean.ResponseResult;
import cn.com.bean.User;
import cn.com.domain.UserDto;
import cn.com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	ResponseResult<Void> result;
	
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}

	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}

	@RequestMapping("/registerCheckUsername.do")
	@ResponseBody
	public boolean registerChecke(@RequestParam("username") String username) {
		User user = userService.findUserByUsername(username);
		if (user != null) {
			return false;
		}
		return true;
	}

	@RequestMapping("/handleRegister.do")
	@ResponseBody
	public ResponseResult<Void> handleRegister(@Validated UserDto userDto, BindingResult bindingResult,
			HttpServletRequest request) {
		String code =  request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY).toString().toLowerCase();
	    result = new ResponseResult<Void>();
		if (bindingResult.hasErrors()) {
			if (userDto.getSecurityCode().toLowerCase().equals(code) && userDto.getPassword().equals(userDto.getConfirmPassword())) {
				userService.register(userDto.getUsername(), userDto.getPassword(), userDto.getEmail());
				result.setCode(1);
				result.setMessage("success");
			}else {
				result.setCode(-1);
				result.setMessage("fail");
			}
		}
		return result;
	}

	@RequestMapping("/handleLogin.do")
	@ResponseBody
	public ResponseResult<Void> handleLogin(@RequestParam("password") String password,
			@RequestParam("username") String username, HttpSession session) {
		 result = new ResponseResult<Void>();
		User user = userService.findUserByUsername(username);
		if (user != null && password.equals(user.getPassword())) {
			result.setCode(1);
			result.setMessage("��¼�ɹ�");
			session.setAttribute("username", user.getUsername());
			session.setAttribute("uid", user.getId());
		} else {
			result.setCode(-1);
			result.setMessage("�˺Ż����������,�����µ�¼��");
		}
		return result;
	}

	@RequestMapping("/loginOut.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../main/index.do";
	}

	@RequestMapping("/personal_info.do")
	public String personalInfo(HttpSession session, ModelMap modelMap) {
		User user = userService.findUserByUsername((String) session.getAttribute("username"));
		modelMap.addAttribute("user", user);
		return "personal_info";
	}

	@RequestMapping("/infoEdit.do")
	public String infoEdit(HttpSession session,ModelMap modelMap) {
		User user=userService.findUserByUsername((String) session.getAttribute("username"));
		modelMap.addAttribute("user",user);
		return "infoEdit";
	}
	@RequestMapping("/save.do")
	@ResponseBody
	public ResponseResult<Void> saveMessage(@RequestParam("name") String name, @RequestParam("gender") String gender, @RequestParam("nation") String nation,@RequestParam("education") String education,@RequestParam("maritalStatus") String maritalStatus,@RequestParam("phone") String phone,HttpSession session) {
		result= new ResponseResult<Void>();
		System.out.println(1);
		Integer id = (Integer)session.getAttribute("uid");
		userService.updateMessage(name, gender, nation, education, maritalStatus, phone,id);
			result.setCode(1);
			result.setMessage("sucess");
		return result;
	}
}
