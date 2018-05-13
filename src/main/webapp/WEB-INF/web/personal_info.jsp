<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="../js/jquery.min.js"></script>
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
					<li><a id="editpwd" href="javascript:;">修改密码<span>Knowledge</span></a></li>						
					<li><a id="account" href="javascript:;">我的账户<span>Account</span></a></li>
					<li><a id="pay" href="javascript:;">我的缴费<span>Pay</span></a></li>	
				</ul>
			</div>
		</div>
		<div class="content_right">
			<div class="info_preview">
				<div class="info_title prev_title">
					<h3>个人信息<a class="info_title_txt" href="javascript:;" title="点击修改">修改</a></h3>
				</div>
				<div class="info_list">
					<ul>
						<li><label class="fl">姓名：</label><div class="info_val fl">${user.name}</div></li>
						<li><label class="fl">性别：</label><div class="info_val fl">${user.gender}</div></li>
						<li><label class="fl">生日：</label><div class="info_val fl">${user.birthday}</div></li>
						<li><label class="fl">民族：</label><div class="info_val fl">${user.nation}</div></li>
						<li><label class="fl">学历状况：</label><div class="info_val fl">${user.education}</div></li>
						<li><label class="fl">婚烟状况：</label><div class="info_val fl">${user.maritalStatus}</div></li>
						<li><label class="fl">家庭人口：</label><div class="info_val fl">${user.children}</div></li>
						<li><label class="fl">身份证号：</label><div class="info_val fl">${user.idNumber}</div></li>
						<li><label class="fl">手机号码：</label><div class="info_val fl">${user.phone}</div></li>
						<li><label class="fl">邮箱：</label><div class="info_val fl">${user.email}</div></li>
						<li><label class="fl">家庭地址：</label><div class="info_val fl">${user.address}</div></li>
					</ul>
				</div><!--info_list结束-->
			</div>	<!--info_preview结束-->
		</div><!--content_r结束-->	
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
</body>
<div class="masklayer">  </div><!--遮罩层-->
<script type="text/javascript" src="../js/content.js"></script>

</html>
