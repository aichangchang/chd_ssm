<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<div class="content_l">
	<div class="content_l_list">
		<ul>
			<div class="pic_bigtx">
				<img width="178" height="178" src="" /> <a id="editTx" class="ghtx"
					href="infoEditTx.do">更换头像</a>
			</div>
			<li><a id="personal" href="${base}/user/personal_info.do">个人中心<span>About
						Us</span></a></li>
			<li><a id="editmsg" href="${base}/user/infoEdit.do">修改信息<span>Services</span></a></li>
			<li><a id="editpwd" href="${base}/user/editpwd.do">修改密码<span>Knowledge</span></a></li>
			<!-- <li><a id="account" href="javascript:;">我的账户<span>Account</span></a></li>
			<li><a id="pay" href="javascript:;">我的缴费<span>Pay</span></a></li> -->
		</ul>
	</div>
</div>