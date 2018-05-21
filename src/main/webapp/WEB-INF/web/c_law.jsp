<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%-- <div id="page">
		<ul>
			<c:forEach items="${listNews}" var="ListNews">
			<li class="page_li">
				<!--文章标题放这里-->
				<h1 class="page_title">
					<a href="c_about.do?id=${ListNews.id}" class="fl">${ListNews.title}</a>
					<span class="fr"></span>	
					<div class="clearfix"></div>
				</h1>
				<p class="fl">
				</p>
				<!--<div class="clearfix"></div>-->
			</li>
		</c:forEach>
		</ul>
	</div> --%>
	<div class="CHlist">
		<dl>
			<div id="scrollBox">
				<ul>
					<c:forEach items="${listNews}" var="ListNews">
						<dd>
							<a href="article.do?id=${ListNews.id}" title="${ListNews.title}">${ListNews.title}</a>
						</dd>
					</c:forEach>
				</ul>
			</div>
		</dl>
	</div>

