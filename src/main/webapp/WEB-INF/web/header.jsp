<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
  	<div class="top" id="top">
		<div class="top_content">
			<div class="top_content_l">
				<a href="${base}/admin/index.do" target="_blank" title="进入后台管理系统" class="backstage">进入后台管理系统</a>
			</div>
			<ul class="top_content_user">
				<li>
					<span>欢迎您</span>
				</li>	
				<li class="top_content_nav">
					<div id="pic_tx">
					</div>
					<a class="user" href="javascript:;">${sessionScope.username}<i class="user_ico"></i></a>
						<div class="userCard">
							<a href="${base}/user/personal_info.do">个人中心</a>
							<c:if test="${sessionScope.username != null }">
							<a href="${base}/user/loginOut.do">退出</a>
							</c:if>
						</div>
				</li>
			</ul>
			<ul class="top_content_r">
			<c:if test="${sessionScope.username == null }">
				<li><a href="${base}/user/login.do">请登录</a></li>
				<li><a class="top_zc" href="${base}/user/register.do">注册</a></li>
			</c:if>
			</ul>
		</div>
	</div>	
	<!--页面顶部top结束-->
	<div class="wrap_logo">
		<div class="logo">
				<div class="logo_left"><img src="../images/leftlogo.png"/></div>
				<div class="logo_right"><img src="../images/tel.jpg" width="28" height="28" />24小时服务热线：<span class="tel">158-XXXX-XXXX</span></div>
				<div class="user_mobile"><img src="../images/user_green.png"/></div>
		</div>
	</div>
<div class="nav">
		<div class="nav_mid" id="nav_mid">
				<ul>
					<li><a href="${base}/main/index.do">首页</a></li>
					<li><a href="${base}/main/nav_about.do?id=3">关于儿童院</a></li>
					<li><a href="${base}/main/nav_about.do?id=12">环境设施</a></li>
					<li><a href="${base}/main/nav_about.do?id=1">孤儿救助</a></li>
					<li><a href="${base}/main/nav_about.do?id=4">孤儿助养</a></li>
					<li><a href="">XXXX</a></li>
					<li><a href="nav_about.do?id=5">法律法规</a></li>
					<li><a href="${base}/user/personal_info.do">个人中心</a></li>
				</ul>
	</div>
</div>