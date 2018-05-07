<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--文章标题放这里-->
<h1 class="a_title"><c:out value="${news.title}"></c:out></h1>
<div class="a_content">
	<!--文章内容放这里-->
	<c:out value="${news.content}"></c:out>	
</div>

