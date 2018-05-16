package cn.com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") != null) {
			// Session�е�uid�Ǵ��ڵģ���ʾ�Ѿ���¼�������
			// ��־��
			System.out.println("\t�Ѿ���¼�����У�");
			return true;
		} else {
			// Session��û��uid����ʾû�е�¼�����¼�Ѿ����ڣ����ض���
			String url = request.getContextPath() + "/user/login.do";
			
			// ��־��
			System.out.println("\tû�е�¼�������أ����ض���" + url);

			// ִ���ض���
			response.sendRedirect(url);

			// ����
			return false;
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
