package cn.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/admin")
public class adminController {
	@RequestMapping("index.do")
	public String admin() {
		return "adminIndex";
	}
}
