<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<style type="text/css">
#scrollBox{
	height: 120px;
	line-height: 30px;
	overflow: hidden; 
}
 #scrollBox ul li{
	list-style-image: url(../images/pointer.png);
	list-style-position: inside;
	height: 30px;
}
#scrollBox {
	font-size: 2vw;
}
</style>
</head>
<body>
	<div id="scrollBox">
		<ul>
			<c:forEach items="${listNews}" var="ListNews">
				<dd>
					<a href="article.do?id=${ListNews.id}"
						title="${ListNews.title}">${ListNews.title}</a>
				</dd>
			</c:forEach>
		</ul>
	</div>
	<script type="text/javascript" src="../js/jquery.min.js" /></script>
</body>
</html>