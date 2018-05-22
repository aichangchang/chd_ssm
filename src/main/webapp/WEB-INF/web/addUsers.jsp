<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>添加儿童</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css"/>
<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script type="text/javascript" src="../admin/js/jquery.validate.min.js"></script>
<script src="../js/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>用户管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">添加用户</a>
	</div>
	<div class="table_all">
		<div class="info_title">
		</div>
		<div class="basicinfo_table">
			<form id="formUsers" name="formUsers" action="#" method="post">
			<table  cellspacing="0" cellpadding="0">	
			<tr><td class="basicinfo_title">账号：</td><td ><input type="text"  name="username" id="u_username" class="txtinput fl"/><p id="checkname" class="fl"></p></td></tr>
			<tr><td class="basicinfo_title td_crossline">密码：</td><td class="td_crossline" ><input type="password" name="password" id="u_pwd" class="txtinput"  /></td></tr>
				<tr><td class="basicinfo_title td_crossline">姓名：</td><td class="td_crossline"><input type="text" name="name" id="u_name" class="txtinput"  /></td></tr>
				<tr><td class="basicinfo_title td_crossline">性别：</td>
					<td class="td_crossline">
						<select name="gender" id="u_sex" class="select_small txtinput">
							<option value="男" >男</option>
							<option value="女" >女</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">出生年月：</td>
					<td class="td_crossline">
						<input type="text" id="u_birth" class="birth txtinput" name="birthday"   onclick="WdatePicker({onpicked:changeFlagTrue(),minDate: '1900-01-01',startDate:'1980-01-01' })">
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">学历状况：</td>
					<td class="td_crossline">
						<select name="education" class="select_small txtinput" id="u_xlzk">
							<option value="小学">小学</option>
							<option value="初中">初中</option>
							<option value="高中">高中</option>
							<option value="大专">大专</option>
							<option value="本科">本科</option>
							<option value="研究生">研究生</option>
							<option value="博士">博士</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">婚烟状况：</td>
					<td class="td_crossline">
						<select name="maritalStatus" class="select_small txtinput" id="u_hyzk">
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离婚">离婚</option>
							<option value="丧偶">丧偶</option>
						</select>
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
				<tr><td class="basicinfo_title td_crossline">手机号码：</td>
					<td class="td_crossline"><input type="text" class="txtinput" name="phone" id="u_phone"  /></td>
				</tr>	
			</table>
			</form>
			<input id="btn_add" class="btn btn-primary" value="添加用户"></input>
			
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
		var flag=$("#formUsers").valid();
		if(flag){
			//过渡中的提示框
		    var d1= dialog({
				content:'<span class=\'save_start\'>正在保存您的信息。</span>'
			});
			$(document).ajaxStart(function(){
				d1.show();					 
			});
			$.ajax({
				type:"post",
				url:"handleAddUsers.do",
				data:{
					username:$("#u_username").val(),
					password:$("#u_pwd").val(),
					name:$("#u_name").val(),
					gender:$("#u_sex").val(),
					birthday:$("#u_birth").val(),
					education:$("#u_xlzk").val(),
					maritalStatus:$("#u_hyzk").val(),
					caseHistory:$("#u_hljb").val(),
					phone:$("#u_phone").val()
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
		}
	});
	$("#formUsers").validate({
			rules:{
				u_username:{
					required:true,
					rangelength:[6,12]
				},
				u_pwd:{
					required:true,
					rangelength:[6,12]
				}
			},
			messages:{
				u_username:{
					required:'必填项',
					 rangelength:'请输入6-12为的用户名'
						
				},
				u_pwd:{
					required:'必填项',
					rangelength:'请输入6-12位的密码'
				}
			}
		});
		$("#u_username").focus();
		$("#u_username").keyup(function(){
				$.ajax({
					type:"post",
					url:"CheckUsername.do",
					data:{
						username:$("#u_username").val()
					},
					dataType:'json',
					success:function(data){
						if(data.code==-1){
							$("#checkname").html("已存在该用户名，请更换");
							$("#checkname").css("color","red");
							$("#btn_add").attr("disabled",true);
						}
						if(data.code==1){
							$("#checkname").html("用户名可用");
							$("#checkname").css("color","green");
							$("#btn_add").attr("disabled",false);
						}
					},
					error:function(jqXHR){
						alert("发生错误"+jqXHR.status);
					}
				});
			
	});
	
});
</script>
</body>
</html>
