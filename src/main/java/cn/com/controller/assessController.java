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
			result.setMessage("��¼�ɹ�");
			session.setAttribute("username", user.getUsername());
			session.setAttribute("uid", user.getId());
		} else {
			result.setCode(-1);
			result.setMessage("�˺Ż����������,�����µ�¼��");
		}
		return result;
	}

	/**
	 * ������������
	 */
	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> upload(MultipartFile file, HttpServletRequest request) throws IOException {
		// ��׮������ؽ��

		System.out.println(file);
		// ��ȡ�����ļ���Ϣ
		System.out.println(file.getContentType());
		System.out.println(file.getName());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		// ���浽�ļ�ϵͳ
		String path = "/file";// WEB·��
		path = request.getServletContext().getRealPath(path);
		System.out.println(path);
		// ����upload�ļ���
		File dir = new File(path);
		dir.mkdir();
		File files = new File(dir, file.getOriginalFilename());
		// �������ļ����浽�ļ���
		file.transferTo(files);
		result = new ResponseResult<Void>();
		result.setCode(0);
		result.setMessage("���سɹ�");
		return result;
	}

	@RequestMapping("/startAssess.do")
	public String startAssess() {
		return "assess";
	}
}
