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
<link rel="stylesheet" type="text/css" href="../admin/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../plugins/dialog.js"></script>
<style type="text/css">
.btn {
	margin-left: 650px;
}
</style>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>新闻管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">发布文章</a>
	</div>
	<div class="table_all">
		<div class="basicinfo_table">
			<form id="formArticle" name="formArticle" action="handleArticle.do" method="post">
			<table   cellspacing="0" cellpadding="0">	
				<tr><td class="basicinfo_title">标题：</td><td ><input type="text"  name="title" id="title" class="txtinput fl" style="width: 320px;"/><p id="checkname" class="fl"></p></td></tr>
				<tr><td class="basicinfo_title td_crossline">发布到：</td>
					<td class="td_crossline" >
						<select id="category" name="categoryId" class="txtinput point">
						<c:forEach items="${categoryName}" var="cname" >
							<option value="${cname.id}">${cname.name}</option>
						</c:forEach>
						</select>
				</td></tr>
				<tr><td class="basicinfo_title td_crossline">作者：</td><td class="td_crossline" ><input type="text" name="author" id="author" class="txtinput" value="" /></td></tr>
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
$("#btn_add").click(function(){
	    var data=$("#formArticle").serialize()
		var flag = $('#formArticle').valid();
		if(flag){
			var d1= dialog({
				content:'<span class=\'save_start\'>正在提交信息。</span>'
			});
			$(document).ajaxStart(function(){
				d1.show();					 
			});
			$.ajax({
				type:"POST",
				url:"handleArticle.do",
				data:data,
				dataType:"json",
				success:function(data){
					console.log(1);
					if(data.code==1){
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_success\'>'+data.message+'</span>',
							quickClose:true,
						});
						d.show();	
						setTimeout(function(){
							d.close().remove();
						},100000);
						window.location='${base}/admin/addArtile.do';
					}
					else{
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_failed\'>'+data.message+'</span>',
							quickClose:true,//点击空白出快速关闭
						});
						d.show();
						setTimeout(function(){
							d.close().remove();
						},100000);
					}
				},
				error:function(jqXHR){
					alert("发生错误:"+jqXHR.message);
				},
			});
		}
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
