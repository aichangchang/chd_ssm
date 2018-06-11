<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--文章标题放这里-->

<div class="content_right">
			<!--文章标题放这里-->
			<h1 class="a_title"><c:out value="${news.title}"></c:out><br />
			<f:formatDate value="${news.createTime}"  var="time"  pattern="yyyy-MM-dd"/>
				<span>发布日期：<c:out value="${time}"></c:out></span><span class="a_title2">作者：<c:out value="${news.author}"></c:out></span><span class="a_title2">浏览次数:<c:out value="${news.count}"></c:out></span>
			</h1>
			
			<div class="a_content">
				<!--文章内容放这里-->
				<c:out value="${news.content}" escapeXml="false" ></c:out>	
			</div>
		</div><!--content_right结束-->
