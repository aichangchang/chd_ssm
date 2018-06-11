<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>详细信息</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
</head>
<body>
	<div class="location">
		当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>老人管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">详细信息</a>
	</div>
	<div class="info_preview">
		<div class="info_title prev_title">
			<h3>详细信息<a class="info_title_txt" href="editUsers.do?id=${children.id}" title="点击修改">修改</a></h3>
		</div>
		<div class="info_list">
			<ul>
				<f:formatDate value="${children.cbirthday}" pattern="yyyy-MM-dd" var="date"/>
				<li><label class="fl">编号:</label><div class="info_val fl">${children.number}</div></li>
				<li><label class="fl">姓名:</label><div class="info_val fl">${children.cname}</div></li>
				<li><label class="fl">性别:</label><div class="info_val fl">${children.cgender}</div></li>
				<li><label class="fl">出生年月:</label><div class="info_val fl">${date}</div></li>
				<li><label class="fl">病史:</label><div class="info_val fl">${children.cCaseHistory}</div></li>
				<li><label class="fl">记录:</label><div class="info_val fl">${children.cMessage}</div></li>
				<li><label class="fl">领养人:</label><div class="info_val fl">${children.uname}</div></li>
				<li><label class="fl">是否同意领养:</label><div class="info_val fl">${children.cagree eq 1 ? "不同意":"同意" }</div></li>
			</ul>
		</div><!--info_list结束-->
	</div>	<!--info_preview结束-->
</body>
</html>
