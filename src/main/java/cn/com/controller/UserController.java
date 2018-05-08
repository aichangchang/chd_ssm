package cn.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;

import cn.com.bean.ResponseResult;
import cn.com.bean.User;
import cn.com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService UserService;

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
		User user = UserService.fingUserByUsername(username);
		if (user != null) {
			return false;
		}
		return true;
	}

	@RequestMapping("/handleRegister.do")
	@ResponseBody
	public ResponseResult<Void> handleRegister(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("email") String email,
			@RequestParam("securityCode")String securityCode,
			@RequestParam("autoFlag") String autoFlag,
			HttpServletRequest request) {
		String Code =(String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
		ResponseResult<Void> result= new ResponseResult<Void>();
		if (Code.toLowerCase().equals(securityCode)){
			UserService.register(username, password, email);
			result.setCode(ResponseResult.STATE_OK);
			result.setMessage("success");
			return result;
		}
		result.setMessage("fail");
		return result;
	}

}
