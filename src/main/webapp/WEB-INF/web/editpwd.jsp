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
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>个人中心</title>
<link rel="shortcut icon" href="images/favicon.ico"/><!--加图标-->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/main.css" media="screen and (min-width:481px)">
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
<style type="text/css">
.table_all {
	float :left;
	margin-left: 200px;
}
.basicinfo_table1 td{
	padding-bottom: 15px;
}
.basicinfo_table1 .txtinput{
	height: 18px;
	line-height: 18px;
	width: 150px;
	border: 1px solid #dadada;
	padding: 2px;
}
.basicinfo_table1 .txtinput:hover{
	border-color: #f5b937;
}
.basicinfo_table1 select:hover{
	border-color: #228B22;
}

.basicinfo_title1{
	width: 78px;
	line-height: 21px;
	padding-bottom: 15px;
	vertical-align: top;
	color: #444;
}
</style>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$().ready(function(){
		//在移动端添加菜单Menu
		$(".logo").prepend('<button id="menutoggle">Menu</button>');
		//上方图片点击回主页
		$(".logo_left img").click(function(){
			location.href="${base}/main/index.do";
		})
		//显示侧面菜单
		$("#menutoggle").click(function(){
			var nav_mid=$("#nav_mid");
			if(nav_mid.css("opacity")==1){
				nav_mid.addClass("fadeInLeft");
				nav_mid.removeClass("fadeOutLeft");
				$(".masklayer").css("display","none");
				$("body").css("overflow","auto");
			}else{
				nav_mid.addClass("fadeOutLeft");
				nav_mid.removeClass("fadeInLeft");
				$(".masklayer").css("display","block");//弹出遮罩层
				$("body").css("overflow","hidden");//禁止遮罩层下面滚动
				$(".masklayer").click(function(){
					nav_mid.addClass("fadeInLeft");
					nav_mid.removeClass("fadeOutLeft");
					$(".masklayer").css("display","none");
					$("body").css("overflow","auto");
				});
			}
		});
		//个人中心
		$(".user_mobile").click(function(){
			var top_menu=$("#top");
			if(top_menu.css("opacity")==1){
				top_menu.addClass("fadeInRight");
				top_menu.removeClass("fadeOutRight");
				$(".masklayer").css("display","none");
				$("body").css("overflow","auto");
			}else{
				top_menu.addClass("fadeOutRight");
				top_menu.removeClass("fadeInRight");
				$(".masklayer").css("display","block");//弹出遮罩层
				$("body").css("overflow","hidden");//禁止遮罩层下面滚动
				$(".masklayer").click(function(){
					top_menu.addClass("fadeInRight");
					top_menu.removeClass("fadeOutRight");
					$(".masklayer").css("display","none");
					$("body").css("overflow","auto");
				});
			}
		});
	});
</script>
</head>
<body>
	<!--页面顶部top结束-->
	<!--logo结束-->
	<c:import url="header.jsp"></c:import>
	  <!--nav结束-->
	<div class="wrap bor">	
	<div class="hengxian"><img src="../images/diying.jpg" width="100%" height="20px"></div><!--中间小横线-->
	<div class="content">
		<div class="content_l">
			<div class="content_l_list">
				<ul>
					<div class="pic_bigtx">
						<img width="178" height="178" src=""/>	
						<a id="editTx" class="ghtx" href="javascript:;">更换头像</a>
					</div>						
					<li><a id="personal" href="${base}/user/personal_info.do">个人中心<span>About Us</span></a></li>
					<li><a id="editmsg" href="${base}/user/infoEdit.do">修改信息<span>Services</span></a></li>
					<li><a id="edit" href="${base}/user/infoEditPwd.do">修改密码<span>Knowledge</span></a></li>						
					<li><a id="account" href="javascript:;">我的账户<span>Account</span></a></li>
					<li><a id="pay" href="javascript:;">我的缴费<span>Pay</span></a></li>	
				</ul>
			</div>
		</div>
	<div class="table_all">
		<div class="info_title">
			<h3>修改密码</h3>
		</div>	
			<div class="basicinfo_table1">
				<form id="formP" name="formP" action="" method="post">	
					<table  cellspacing="0" cellpadding="0">
						<tr><td class="basicinfo_title">原密码：</td><td ><input type="password" name="u_pwd" id="u_pwd" class="txtinput"   /></td></tr>
						<tr><td class="basicinfo_title">新密码：</td><td ><input type="password" name="u_newPwd" id="u_newPwd" class="txtinput"  /></td></tr>				
						<tr><td class="basicinfo_title">确认密码：</td><td ><input type="password" name="u_conPwd" id="u_conPwd" class="txtinput" /></td></tr>
					</table>
				</form>
				<button id="btn_editPwd" class="btn_save">修改</button>
			</div><!--basicinfo_table结束-->	
			<div><p id="createResult_red"></p></div>
			<div><p id="createResult_green"></p></div>
	</div><!--table_all-->		
	</div>
	<!--content结束-->
	</div>
	<!--wrap结束-->
	<div class="footer">
		<div class="footer_text">
			<a class="github fl" href="https://github.com/heguofeng" target="_blank" title="我的个人GitHUb">我的GitHub</a>
			<span class="copyright fl">CopyRight © 2017 温州温医养老院 Design by <i>HeGuoFeng</i></span>
			<a class="icp fl" href="http://www.miitbeian.gov.cn" target="_blank" title="浙ICP备17016736号">浙ICP备17016736号</a>
	 		<a class="zgwba fl" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=33078302100239" ><img src="" class="fl"/><p class="fl">浙公网安备 33078302100239号</p></a>
		</div>
	</div>
<script type="text/javascript">
$().ready(function(){
	$("#u_pwd").focus();
	$("#btn_editPwd").click(function(){
		var flag=$("#formP").valid();
		if(flag){
			$.ajax({
				type:"post",
				url:"doUserAction.php?act=editPwd&id=<?php echo $id ?>",
				data:{
					u_pwd:$("#u_pwd").val(),
					u_newPwd:$("#u_newPwd").val(),
				},
				dataType:"json",
				success:function(data){
					if(data.success){
						$("#createResult_green").html(data.msg);
						$("#createResult_green").css("display","block");
						$("#createResult_red").css("display","none");
						setTimeout(function(){
							$("#createResult_green").css("display","none");
						},2000);
					}else{
						$("#createResult_red").html(data.msg);
						$("#createResult_red").css("display","block");
						$("#createResult_green").css("display","none");
					}
				},
				error:function(jqXHR){
					alert("发生错误"+jqXHR.status);
				}
			});
		}
	});
	$("#formP").validate({
		rules:{
			u_pwd:{
				required:true,
				minlength:2,
				maxlength:20
			},
			u_newPwd:{
				required:true,
				minlength:2,
				maxlength:20
			},
			u_conPwd:{
				required:true,
				minlength:2,
				maxlength:20,
				equalTo:"#u_newPwd"
			}
		},
		messages:{
			u_pwd:{
				required:'请输入密码',
				minlength:"密码不能小于2个字符",
				maxlength:"密码不能多于20个字符"
			},
			u_newPwd:{
				required:'请输入新密码',
				minlength:"新密码不能小于2个字符",
				maxlength:"新密码不能多于20个字符"
			},
			u_conPwd:{
				required:'请输入确认密码',
				minlength:"密码不能小于2个字符",
				maxlength:"密码不能多于20个字符",
				equalTo:"两次输入密码不一致"
			}
		}
	});
	
});
</script>
</body>
<div class="masklayer">  </div><!--遮罩层-->
</html>
