<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>编辑文章</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>新闻管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">编辑文章</a>
	</div>
	<div class="table_all">
		<div class="basicinfo_table">
			<form id="formArticle" name="formArticle" action="###" method="post">
			<table  cellspacing="0" cellpadding="0">	
				<input style="display: none;"  type="text" id="id" name="id" value="${news.id}"></input>
				<tr><td class="basicinfo_title">标题：</td><td ><input type="text"  name="title" id="title" class="txtinput fl" style="width: 320px;" value="${news.title}"/><p id="checkname" class="fl"></p></td></tr>
				<tr><td class="basicinfo_title td_crossline">作者：</td><td class="td_crossline" ><input type="text" name="author" id="author" class="txtinput" value="${news.author}" /></td></tr>
				<tr><td class="basicinfo_title td_crossline">内容：</td><td class="td_crossline"><textarea id="content" name="content" style="width: 80%;height: 200px;">${news.content}</textarea></td></tr>				
			</table>
			<input  id="btn_add" type="button" class="btn_save" value="修改文章"></input>	
			</form>
			
		</div><!--basicinfo_table结束-->	
		<div><p id="createResult_red"></p></div>
		<div><p id="createResult_green"></p></div>
	</div><!--table_all-->		
<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script type="text/javascript" src="../admin/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../plugins/dialog.js"></script>
<script type="text/javascript" charset="utf-8" src="../plugins/kindeditor/kindeditor.js"></script>	
<script type="text/javascript" charset="utf-8" src="../plugins/kindeditor/lang/zh_CN.js"></script>	
<script type="text/javascript">
$().ready(function(){
	$("#btn_add").click(function(){
		var flag = $('#formArticle').valid();
		var nid=${news.id};
	    var data =$('#formArticle').serialize();
	    console.log(data)
		if(flag){
			var d1= dialog({
				content:'<span class=\'save_start\'>正在提交信息。</span>'
			});
			$(document).ajaxStart(function(){
				d1.show();					 
			});
			$.ajax({
				type:"POST",
				url:"updateArticle.do",
				data:data,
				dataType:"json",
				success:function(obj){
					console.log(obj.code)
					if(obj.code==1){
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_success\'>'+obj.message+'</span>',
							quickClose:true //点击空白出快速关闭	
						});
						d.show();
					}
					else{
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_failed\'>'+fail+'</span>',
							quickClose:true,//点击空白出快速关闭
						});
						d.show();
					}
				},
				error:function(jqXHR){
					alert("发生错误:"+jqXHR.status);
				}
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
	window.editor=K.create('#content',{
        afterBlur: function () { this.sync();}
    });
});
</script>
</body>
</html>
