package cn.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping("/register.do")
	public String register() {
		return "register";
	}
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	@RequestMapping("/registerCheckUsername.do")
	public String registerChecke(@RequestParam("username") String username) {
		return null;
	}
}
