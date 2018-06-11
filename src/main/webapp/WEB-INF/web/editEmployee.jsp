<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑员工</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>人事管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">编辑员工</a>
</div>
<h3 class="biaoti">编辑员工</h3>
<div class="basicinfo_table">
<form id="formEmp" action="doAdminAction.php?act=editEmployee&id=<?php echo $id;?>" method="post" enctype="multipart/form-data">
<table width="70%" cellpadding="0" cellspacing="0" >
	<tr>
		<td class="basicinfo_title">员工用户名</td>
		<td ><input type="text" name="username" id="username" class="txtinput" value="${employee.username}" placeholder="${employee.username}"/></td>
	</tr>
	<tr>
		<td class="basicinfo_title td_crossline">密码</td>
		<td class="td_crossline"><input type="password" name="password" class="txtinput"/></td>
	</tr>
	<tr>
		<td class="basicinfo_title td_crossline">姓名</td>
		<td class="td_crossline"><input type="text" name="name" class="txtinput" value="${employee.name}" placeholder="${employee.name}"/></td>
	</tr>
	<tr>
		<td class="basicinfo_title td_crossline">手机号</td>
		<td class="td_crossline"><input type="text" name="phone" class="txtinput" value="${employee.phone}" placeholder="${employee.phone}"/></td>
		
	</tr>
	<tr>
		<td class="basicinfo_title td_crossline">性别</td>
		<td class="td_crossline">
			<div>	
				<input type="radio" class="fl" name="sex" value="男"><span class="fl">男</span>
				<input type="radio" class="fl" name="sex" value="女"><span class="fl">女</span>
			</div>
		</td>
	</tr>
	<tr>
		<td class="basicinfo_title td_crossline">所属部门</td>
		<td class="td_crossline">
			<select name="d_id" class="txtinput point" id="d_id">
				<c:forEach items="${departments}" var="department">
				<option value="${department.id}">${department.dname}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="basicinfo_title td_crossline">在职情况</td>
		<td class="td_crossline">
			<div>	
				<input type="radio" class="fl" name="isJob" value="1" ><span class="fl">在职</span>
				<input type="radio" class="fl" name="isJob" value="2" ><span class="fl">离职</span>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" class="btn btn-primary" value="编辑"/></td>
	</tr>

</table>
</form>
</div>
</body>

<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script type="text/javascript" src="../admin/js/jquery.validate.min.js"></script>
<script type="text/javascript">
$("#d_id option[value='${employee.departmentId}']").removeAttr("selected");//根据值去除选中状态  
$("#d_id option[value='${employee.departmentId}']").attr("selected","selected");//根据值让option选中 
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
		$("#username").focus();
		$("input[type='text']").change(function(){
			changeFlagTrue()
		});
		$("input[type='radio']").change(function(){
			changeFlagTrue()
		});
		$("select").change(function(){
			changeFlagTrue()
		});
		$("textarea").change(function(){
			changeFlagTrue()
		});
		$(".btn").click(function(){
			changeFlag=false;//更新标识值
		});
		$("#formEmp").validate({
			rules:{
				username:{
					required:true
				},
				password:{
					required:true
				},
				name:{
					required:true
				},
				phone:{
					required:true
				}
			},
			messages:{
				username:{
					required:'必填项'
				},
				password:{
					required:'必填项'
				},
				name:{
					required:'必填项'
				},
				phone:{
					required:'必填项'
				}
			}
		});
	});
</script>
</html>