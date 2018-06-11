<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>添加部门</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css" />
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
</head>
<body>
<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>部门管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">添加部门</a>
</div>
<div class="info_title">
	<h3>添加部门</h3>
</div>
<div class="basicinfo_table">
<form id="formDep" action="handleAddDepartment.do" method="post">
<table class="edittable" width="70%" cellpadding="0" cellspacing="0" >
	<tr>
		<td class="basicinfo_title">部门名称</td>
		<td><input type="text" name="dname" id="d_name" class="txtinput fl" placeholder="请输入部门名称"/><p id="checkname" class="fl"></p></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" class="btn btn-primary"  value="添加部门"/></td>
	</tr>

</table>
</form>
</body>

<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script type="text/javascript" src="../admin/js/jquery.validate.min.js"></script>
<script>
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
	$(document).ready(function(){
		$("input[type='text']").change(function(){
			changeFlagTrue()
		});
		$("#btn_save").click(function(){
			changeFlag=false;//更新标识值
		});
		$("#d_name").focus();
			$("#d_name").keyup(function(){
				var flag=$("#formDep").valid();
				if(flag){
				$.ajax({
					type:"post",
					url:"CheckaddDepartment.do",
					data:{
						dname:$("#d_name").val()
					},
					dataType:'json',
					success:function(data){
						if(data.code==-1){
							$("#checkname").html("已存在，请更换");
							$("#checkname").css("color","red");
							$("#editbtn").attr("disabled",true);
						}
						if(data.code==1){
							$("#checkname").html("用户名可用");
							$("#checkname").css("color","green");
							$("#editbtn").attr("disabled",false);
						}
					},
					error:function(jqXHR){
						alert("发生错误"+jqXHR.status);
					}
				});
				}
			});	
			
		$("#formDep").validate({
			rules:{
				d_name:{
					required:true
				}
			},
			messages:{
				d_name:{
					required:'部门名称必填!'
				}
			}
		});
	});
</script>
</html>