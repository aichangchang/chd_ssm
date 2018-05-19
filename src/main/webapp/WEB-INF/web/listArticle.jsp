<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>文章列表</title>
		<!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
		<link rel="stylesheet" type="text/css" href="../admin/css/reset.css">
		<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css">
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="location">
			当前位置:&nbsp;<a id="first" href="main.php">首页</a>&nbsp;&gt;&nbsp;<a>新闻管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">文章列表</a>
		</div>
		<div class="details">
                    <div class="details_operation clearfix">
                        <div class="fl">
                            <input type="button" value="添&nbsp;&nbsp;加" class="btn btn-primary" id="add"  onclick="addArticle()">
                        </div>
                         <div class="fr">
				        	 <div class="text">
				                    <span>部门搜索</span>
				                    <div class="bui_select">
				                        <select id="" class="form-control" onchange="change(this.value)">
				                        	<option value="">-请选择-</option>
				                        </select>
				                    </div>
				                </div>
				        	<div class="text">
				                    <span>文章搜索</span>
				                    <div class="bui_select">
				                    	<input type="text" value="" class="form-control"  id="search" onkeypress="search(event)" >
				                    </div>
				            </div>
				        </div>    
                    </div>
                    <!--表格-->
                    <table class="table table-hover" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th width="5%">编号</th>
                                <th width="10%">文章栏目</th>
                                <th width="60%">标题</th>
                                <th width="10%">作者</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach begin="0" step="1"  items="${newsList}"  var="allNews">
                            <tr>
                                <td><label class="label_id"><c:out value="${allNews.id}"></c:out></label></td>
                                <td>${allNews.categoryId}</td>
                                 <td>${allNews.title}</td>
                                <td>${allNews.author}</td>
                                <td align="center"><input type="button" value="修改" class="btn btn-success" id="edit" onclick="editArticle(${allNews.id})"><input type="button" value="删除" class="btn btn-danger" id="del" onclick="delArticle(${allNews.id})"></td>
                            </tr>
                         </c:forEach>                       
                        </tbody>
                    </table>
                     <a class="btn btn-success" href="listArticle.do?page=${page.firstPage}">第一页</a>
       				 <a	class="btn btn-success" href="listArticle.do?page=${page.prePage}">上一页</a>
                     <a  class="btn btn-success" href="listArticle.do?page=${page.nextPage}">下一页</a>
       				 <a  class="btn btn-success"	href="listArticle.do?page=${page.lastPage}">最后页</a>
                </div>
		<script type="text/javascript">
			function editArticle(id){			
				window.location="editArticle.do?id="+id;
			}
			function delArticle(id){
				if(window.confirm("您确定要删除吗？删除之后不能恢复哦！！！")){
					window.location="deleteArticle.do?id="+id;
				}
			}
			function addArticle(){
				window.location="addArticle.do";
			}
			//兼容火狐浏览器的keypress写法
			function search(evt){
				evt=(evt)?evt:((window.event)?window.event:"");
				var key=evt.keyCode?evt.keyCode:evt.which;
				if(key==13){
					var val=document.getElementById("search").value;
					window.location="listArticle.php?keywords="+val;
				}
			}
			function change(val){
				window.location="listArticle.php?keywords="+val;
			}
		</script>
	</body>
</html>