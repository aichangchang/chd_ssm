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
<style type="text/css">
.basicinfo_table .assessinput{
    line-height: 30px;
    width: 400px;
    border: 1px solid #dadada;
    padding: 2px;

}
</style>
</head>
<body>
	<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>用户管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">修改信息</a>
	</div>
	<div class="table_all">
		<div class="basicinfo_table">
			<table  cellspacing="0" cellpadding="0">
				<!--<tr><td class="basicinfo_title td_crossline">密码：</td><td ><input type="password" name="u_pwd" id="u_pwd" class="txtinput" value="<?php echo $userInfo['u_pwd'] ?>" /></td></tr>-->
				<tr><td class="basicinfo_title td_crossline">姓名：</td><td class="td_crossline"><input type="text" name="u_name" id="u_name" class="txtinput" value="${user.name}" /></td>
				<td class="basicinfo_title td_crossline">性别：</td>
					<td class="td_crossline">
						<select name="u_sex" id="u_sex" class="select_small">
							<option value="男" >男</option>
							<option value="女" >女</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">出生<br>年月：</td>
					<td class="td_crossline">
					<f:formatDate var="date" value="${user.birthday}" pattern="yyyy-MM-dd"/>
						<input type="text" id="u_birth" class="birth" name="u_birth" value="${date}" onclick="WdatePicker({minDate: '1900-01-01',startDate:'1980-01-01' })">
					</td>		
				<td class="basicinfo_title td_crossline">联系<br>方式：</td>
					<td class="td_crossline"><input type="text" class="txtinput" name="u_phone" id="u_phone" value="${user.phone}"/></td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">学历<br>状况：</td>
					<td class="td_crossline">
						<select name="education" class="select_small" id="u_xlzk">
							<option value="小学">小学</option>
							<option value="初中">初中</option>
							<option value="高中">高中</option>
							<option value="大专">大专</option>
							<option value="本科">本科</option>
							<option value="研究生">研究生</option>
							<option value="博士">博士</option>
						</select>
					</td>			
			      <td class="basicinfo_title td_crossline">婚烟<br>状况：</td>
					<td class="td_crossline">
						<select name="maritalStatus" class="select_small" id="u_hyzk">
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离婚">离婚</option>
							<option value="丧偶">丧偶</option>
						</select>
					</td>
				</tr>
				<td class="basicinfo_title td_crossline">病史：</td>
					<td class="td_crossline"><input type="text" class="txtinput" name="caseHistory" id="caseHistory" value="${user.caseHistory}"/></td>
					<td class="basicinfo_title td_crossline">相关证明:</td>
					<td class="td_crossline">
						<select name="evidence" id="evidence" class="select_small">
							<option value="未提交" >未提交</option>
							<option value="已提交" >已提交</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">评估：</td>
					<td class="td_crossline"><textarea class="assessinput" name="assess" id="assess" value="" >${user.assess}</textarea></td>
					<td class="basicinfo_title td_crossline">(预)领养<br>儿童姓名：</td><td class="td_crossline"><input type="text" name="c_name" id="c_name" class="txtinput" value="${children.cname}" />
				</tr>
					<tr><td class="basicinfo_title td_crossline">*是否同意领养：</td>
					<td class="td_crossline">
						<select name="agree" id="agree" class="select_small">
							<option>请选择</option>						
							<option value="1" >同意</option>
							<option value="0" >不同意</option>
						</select>
					</td>
				</tr>
				
			</table>
			<input id="btn_save" class="btn_save" value="保存"></input>
			<button class="btn_save" href="detialUsers.php?id=<?php echo $id ?>" title="点击预览">预览</button>
		</div><!--basicinfo_table结束-->	
		<div><p id="createResult_red"></p></div>
		<div><p id="createResult_green"></p></div>
	</div><!--table_all-->		
<script type="text/javascript" src="../plugins/dialog.js"></script>				
<script type="text/javascript">
$("#u_sex option[value='${user.gender}']").removeAttr("selected");//根据值去除选中状态  
$("#u_sex option[value='${user.gender}']").attr("selected","selected");//根据值让option选中 
$("#u_xlzk option[value='${user.education}']").removeAttr("selected");//根据值去除选中状态  
$("#u_xlzk option[value='${user.education}']").attr("selected","selected");//根据值让option选中 
$("#u_hyzk option[value='${user.maritalStatus}']").removeAttr("selected");//根据值去除选中状态  
$("#u_hyzk option[value='${user.maritalStatus}']").attr("selected","selected");//根据值让option选中 
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
				name:$("#u_name").val(),
				gender:$("#u_sex").val(),
				birthday:$("#u_birth").val(),
				education:$("#u_xlzk").val(),
				maritalStatus:$("#u_hyzk").val(),
				caseHistory:$("#caseHistory").val(),
				evidence:$("#evidence").val(),
				phone:$("#u_phone").val(),
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
</body>
</html>
