<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>发布文章</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>新闻管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">发布文章</a>
	</div>
	<div class="table_all">
		<div class="info_title">
			<h3>发布文章</h3>
		</div>
		<div class="basicinfo_table">
			<form id="formArticle" name="formArticle" action="doAdminAction.php?act=addArticle" method="post">
			<table  cellspacing="0" cellpadding="0">	
				<tr><td class="basicinfo_title">标题：</td><td ><input type="text"  name="title" id="title" class="txtinput fl" style="width: 320px;"/><p id="checkname" class="fl"></p></td></tr>
				<tr><td class="basicinfo_title td_crossline">发布到：</td>
					<td class="td_crossline" >
						<select name="category_id" class="txtinput point">
						<c:forEach items="${categoryName}" var="cname" >
							<option value="${cname.id}">${cname.name}</option>
						</c:forEach>
						</select>
				</td></tr>
				<tr><td class="basicinfo_title td_crossline">作者：</td><td class="td_crossline" ><input type="text" name="author" id="author" class="txtinput" value="" /></td></tr>
				<tr><td class="basicinfo_title td_crossline">简介：</td><td class="td_crossline"><textarea name="description" id="description" class="txtarea" placeholder="可以不填"></textarea></td></tr>	
				<tr><td class="basicinfo_title td_crossline">内容：</td><td class="td_crossline"><textarea id="content" name="content" style="width: 80%;height: 200px;"></textarea></td></tr>				
			</table>
			<button id="btn_add" class="btn btn-primary">发布文章</button>	
			</form>
			
		</div><!--basicinfo_table结束-->	
		<div><p id="createResult_red"></p></div>
		<div><p id="createResult_green"></p></div>
	</div><!--table_all-->		
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../plugins/kindeditor/kindeditor.js"></script>	
<script type="text/javascript" charset="utf-8" src="../plugins/kindeditor/lang/zh_CN.js"></script>	
<script type="text/javascript">
	var changeFlag=false;//标识文本框值是否改变，为true，标识已变
	function changeFlagTrue(){
		changeFlag=true;
	}
		//当页面刷新或者离开时，警告提示
	window.onbeforeunload = function(event) {
		if (changeFlag==true) {
		    event.returnValue = "我在这写点东西...";
		}
	}
	$().ready(function(){
		$("input[type='text']").change(function(){
			changeFlagTrue()
		});
		$("select").change(function(){
			changeFlagTrue()
		});
		$("textarea").change(function(){
			changeFlagTrue()
		});
		$("#btn_add").click(function(){
			changeFlag=false;//更新标识值
		});
		$("#formArticle").validate({
				rules:{
					title:{
						required:true
					}
				},
				messages:{
					title:{
						required:'必填项'
					}
				}
			});
			$("#title").focus();
	});
	//调用编辑器
	KindEditor.ready(function(K){
		window.editor=K.create('#content');
	});
</script>
</body>
</html>
