<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
</head>
<body>
	<div class="CHlist">
		<dl>
			<div id="scrollBox">
				<ul>
					<c:forEach items="${listNews}" var="ListNews">
						<dd>
							<a href="article.do?id=${ListNews.id}" title="${ListNews.title}" style="font-size:16px;" class="fs16">${ListNews.title}</a>
						</dd>
					</c:forEach>
				</ul>
			</div>
		</dl>
	</div>

	<script type="text/javascript" src="../js/jquery.min.js" /></script>
</body>
</html>