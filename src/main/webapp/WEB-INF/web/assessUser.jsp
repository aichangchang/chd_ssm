<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script src="../js/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<script src="../plugins/kindeditor-4.1.11/kindeditor-all-min.js"></script>
<script src="../plugins/kindeditor-4.1.11/lang/zh-CN.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>用户管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">评估</a>
	</div>
	<div class="table_all">
		<div class="basicinfo_table">
			<table  cellspacing="0" cellpadding="0">
				<!--<tr><td class="basicinfo_title td_crossline">密码：</td><td ><input type="password" name="u_pwd" id="u_pwd" class="txtinput" value="<?php echo $userInfo['u_pwd'] ?>" /></td></tr>-->
				<tr><td class="basicinfo_title td_crossline">评估：</td>
					<td class="td_crossline"><textarea class="assessinput" name="assess" id="editor_id" value="" >${user.assess}</textarea></td>
				</tr>
					<tr><td class="basicinfo_title td_crossline">*是否同意领养：</td>
					<td class="td_crossline">
						<select name="agree" id="agree" class="select_small">
							<option>请选择</option>						
							<option value="1" >同意</option>
							<option value="0" >不同意</option>
						</select>
					</td>
					<td class="basicinfo_title td_crossline">(预)领养儿童姓名：</td><td class="td_crossline"><input type="text" name="c_name" id="c_name" class="txtinput" value="${children.cname}" />
				</tr>
				
			</table>
			<input id="btn_save" class="btn_save" value="保存"></input>
			<button class="btn_save" href="###" title="点击预览">预览</button>
		</div><!--basicinfo_table结束-->	
		<div><p id="createResult_red"></p></div>
		<div><p id="createResult_green"></p></div>
	</div><!--table_all-->		
<script type="text/javascript" src="../plugins/dialog.js"></script>				
<script type="text/javascript">
$("#agree option[value='${user.agree}']").removeAttr("selected");//根据值去除选中状态  
$("#agree option[value='${user.agree}']").attr("selected","selected");//根据值让option选中 
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
	var uid=${user.id};
	console.log(uid)
	console.log($("#u_name").val());
	console.log($("#u_sex").val());
	console.log($("#u_birth").val());
	console.log($("#u_xlzk").val());
	console.log($("#u_hyzk").val());
	console.log($("#caseHistory").val());
	console.log($("#evidence").val());
	console.log($("#u_phone").val());
	console.log($("#assess").val());
	console.log($("#agree").val());
	console.log($("#c_name").val());
	$("input[type='text']").change(function(){
		changeFlagTrue()
	});
	$("select").change(function(){
		changeFlagTrue()
	});
	$("#btn_save").click(function(){
		changeFlag=false;//更新标识值
		//过渡中的提示框
	    var d1= dialog({
			content:'<span class=\'save_start\'>正在保存您的信息。</span>'
		});
		$(document).ajaxStart(function(){
			d1.show();					 
		});
		$.ajax({
			type:"post",
			url:"handleEditUsers.do",
			data:{
				id:uid,
				assess:$("#assess").val(),
				agree:$("#agree").val(),
				cname:$("#c_name").val() 
				
			},
			dataType:"json",
			success:function(data){
				if(data.code==1){
					d1.close().remove();//关闭中间过度动画
					var d= dialog({
						content:'<span class=\'save_success\'>'+data.message+'</span>'
					});
					d.show();
					setTimeout(function(){
						d.close().remove();
					},2500);
				}
				else{
					d1.close().remove();//关闭中间过度动画
					var d= dialog({
						content:'<span class=\'save_failed\'>'+fail+'</span>'
					});
					d.show();
					setTimeout(function(){
						d.close().remove();
					},3000);
				}
			},
			error:function(jqXHR){
				console.log($("#u_name").val());
				console.log($("#u_sex").val());
				console.log($("#u_birth").val());
				console.log($("#u_xlzk").val());
				console.log($("#u_hyzk").val());
				console.log($("#caseHistory").val());
				console.log($("#evidence").val());
				console.log($("#u_phone").val());
				console.log($("#assess").val());
				console.log($("#agree").val());
				console.log($("#c_name").val());
				alert("发生错误:"+jqXHR.status);
			},
		});
	});
});
</script>
<script>
        KindEditor.ready(function(K) {
                window.editor = K.create('#editor_id');
        });
</script>
</body>
</html>
