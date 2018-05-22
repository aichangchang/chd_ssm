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
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>儿童管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">修改信息</a>
	</div>
	<div class="table_all">
		<div class="basicinfo_table">
			<table  cellspacing="0" cellpadding="0">
				<tr><td class="basicinfo_title">编号:</td><td ><input type="text"  name="c_number" id="c_number" class="txtinput fl"/><p id="checkname" class="fl"></p></td></tr>
				<tr><td class="basicinfo_title td_crossline">姓名：</td><td class="td_crossline"><input type="text" name="c_name" id="c_name" class="txtinput" value="${children.cname}" /></td>
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
					<f:formatDate var="birthday" value="${children.cbirthday}" pattern="yyyy-MM-dd"/>
						<input type="text" id="c_birth" class="birth" name="u_birth" value="${birthday}" onclick="WdatePicker({minDate: '1900-01-01',startDate:'1980-01-01' })">
					</td>		
					<td class="basicinfo_title td_crossline">入院<br>日期：</td>
					<td class="td_crossline">
					<f:formatDate var="reachdate" value="${children.reach}" pattern="yyyy-MM-dd"/>
						<input type="text" id="c_reach" class="birth" name="u_birth" value="${reachdate}" onclick="WdatePicker({minDate: '1900-01-01',startDate:'1980-01-01' })">
					</td>
				</tr>
				<tr>
				<td class="basicinfo_title td_crossline">病史：</td>
					<td class="td_crossline"><input type="text" class="txtinput" name="caseHistory" id="caseHistory" value="${children.cCaseHistory}"/></td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">记录：</td>
					<td class="td_crossline"><textarea class="assessinput" name="record" id="c_record" value="" >${children.cMessage}</textarea></td>
					<td class="basicinfo_title td_crossline">(预)领养<br>人姓名：</td><td class="td_crossline"><input type="text" name="u_name" id="u_name" class="txtinput" value="${user.name}" />
				</tr>
					<tr><td class="basicinfo_title td_crossline">*是否同意被领养：</td>
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
$("#u_sex option[value='${children.cgender}']").removeAttr("selected");//根据值去除选中状态  
$("#u_sex option[value='${children.cgender}']").attr("selected","selected");//根据值让option选中 
$("#agree option[value='${children.cagree}']").removeAttr("selected");//根据值去除选中状态  
$("#agree option[value='${children.cagree}']").attr("selected","selected");//根据值让option选中 

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
	var cid=${children.id};
	$("input[type='text']").change(function(){
		changeFlagTrue()
	});
	$("select").change(function(){
		changeFlagTrue()
	});
	$("#btn_save").click(function(){
	  var cagree=	$("#agree").val();
	  if(cagree=="请选择"){
		  cagree=null;
	  }
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
			url:"handleChildren.do",
			data:{
				id:cid,
				number:$("#c_number").val(),
				name:$("#c_name").val(),
				gender:$("#u_sex").val(),
				birthday:$("#c_birth").val(),
				reach:$("#c_reach").val(),
				caseHistory:$("#caseHistory").val(),
				record:$("#c_record").val(),
				agree:cagree,
				uname:$("#u_name").val() 
				
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
				alert("发生错误:"+jqXHR.status);
			},
		});
	});
});
</script>
</body>
</html>
