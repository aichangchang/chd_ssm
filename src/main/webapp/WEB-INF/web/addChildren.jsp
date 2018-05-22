<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>添加用户</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script type="text/javascript" src="../admin/js/jquery.validate.min.js"></script>
<script src="../js/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style type="text/css">
.basicinfo_table .messageinput{
    line-height: 35px;
    width: 400px;
    border: 1px solid #dadada;
    padding: 2px;

}
</style>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>儿童管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">添加儿童</a>
	</div>
	<div class="table_all">
		<div class="info_title">
		</div>
		<div class="basicinfo_table">
			<form id="formUsers" name="formUsers" action="#" method="post">
			<table  cellspacing="0" cellpadding="0">	
				<tr><td class="basicinfo_title">编号:</td><td ><input type="text"  name="c_number" id="c_number" class="txtinput fl"/><p id="checkname" class="fl"></p></td></tr>
				<tr><td class="basicinfo_title td_crossline">姓名:</td><td class="td_crossline"><input type="text" name="c_name" id="c_name" class="txtinput"  /></td></tr>
				<tr><td class="basicinfo_title td_crossline">年龄:</td><td class="td_crossline" ><input type="text" name="c_age" id="c_age" class="txtinput"  /></td></tr>
				<tr><td class="basicinfo_title td_crossline">性别:</td>
					<td class="td_crossline">
						<select name="gender" id="c_sex" class="select_small txtinput">
							<option value="男" >男</option>
							<option value="女" >女</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">出生日期：</td>
					<td class="td_crossline">
						<input type="text" id="c_birth" class="birth txtinput" name="birthday"   onclick="WdatePicker({onpicked:changeFlagTrue(),minDate: '1900-01-01',startDate:'1980-01-01' })">
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">入院日期：</td>
					<td class="td_crossline">
						<input type="text" id="c_reach" class="birth txtinput" name="reach"   onclick="WdatePicker({onpicked:changeFlagTrue(),minDate: '1900-01-01',startDate:'1980-01-01' })">
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">有无病史：</td>
					<td class="td_crossline">
						<select name="caseHistory" class="select_big txtinput" id="u_hljb">
							<option>无</option>
							<option>有</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">记录：</td>
					<td class="td_crossline"><textarea  class="messageinput" name="record" id="c_record" ></textarea></td>
				</tr>	
			</table>
			</form>
			<input id="btn_add" class="btn btn-primary" value="添加儿童"></input>
			
		</div><!--basicinfo_table结束-->	
		<div><p id="createResult_red"></p></div>
		<div><p id="createResult_green"></p></div>
	</div><!--table_all-->		
<script type="text/javascript" src="../plugins/dialog.js"></script>		
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
	$("#btn_add").click(function(){
		changeFlag=false;//更新标识值
		var user=$("#formUsers").serialize();
		console.log(user);
			//过渡中的提示框
		    var d1= dialog({
				content:'<span class=\'save_start\'>正在保存您的信息。</span>'
			});
			$(document).ajaxStart(function(){
				d1.show();					 
			});
			$.ajax({
				type:"post",
				url:"handleAddChildren.do",
				data:{
					number:$("#c_number").val(),
					cname:$("#c_name").val(),
					cage:$("#c_age").val(),
					cgender:$("#c_sex").val(),
					cbirthday:$("#c_birth").val(),
					reach:$("#c_reach").val(),
					caseHistory:$("#u_hljb").val(),
					cmessage:$("#c_record").val(),
				},
				dataType:"json",
				success:function(data){
					console.log(1)
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
					alert("发生错误:"+jqXHR.status);
				}
			});
	});

});
</script>
</body>
</html>
