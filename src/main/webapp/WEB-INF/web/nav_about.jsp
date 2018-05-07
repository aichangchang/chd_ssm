<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title> <?php echo $title['category']; ?> </title>
<link rel="shortcut icon" href="images/favicon.ico"/><!--加图标-->
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/main.css" media="screen and (min-width:481px)"/>
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../plugins/myFocus/myfocus-2.0.4.min.js" type="text/javascript" charset="utf-8"></script><!--引入myFocus库-->
<script type="text/javascript">
myFocus.set({
	id:'boxID',//焦点图盒子ID
	pattern:'mF_kdui',//风格应用的名称
	time:3,//切换时间间隔(秒)
	trigger:'click',//触发切换模式:'click'(点击)/'mouseover'(悬停)
	width:1000,//设置图片区域宽度(像素)
	height:340,//设置图片区域高度(像素)
	txtHeight:'default',//文字层高度设置(像素),'default'为默认高度，0为隐藏

});
$(document).ready(function(){
		//在移动端添加菜单Menu
		$(".logo").prepend('<button id="menutoggle">Menu</button>');
		//上方图片点击回主页
		$(".logo_left img").click(function(){
			location.href="index.do";
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
	<div class="top" id="top">
		<div class="top_content">
			<div class="top_content_l">
				<a href="admin/index.php" target="_blank" class="backstage">进入后台管理系统</a>
			</div>
			<?php if($userInfo['id']):?>
			<ul class="top_content_user">
				<li>
					<span>欢迎您</span>
				</li>	
				<li class="top_content_nav">
					<div id="pic_tx">
						<img alt="我的头像" width="20" height="20" src="" />
					</div>
					<a class="user" href="javascript:;"><?php echo $userInfo['u_name']?$userInfo['u_name']:$userInfo['u_username'];?><i class="user_ico"></i></a>
						<div class="userCard">
							<a href="personal_info.php">个人中心</a>
							<a href="doUserAction.php?act=userOut">退出</a>
						</div>
				</li>
			</ul>
			<?php else:?>
			<ul class="top_content_r">
				<li><a href="login.html">请登录</a></li>
				<li><a class="top_zc" href="reg.html">注册</a></li>
			</ul>
			<?php endif;?>
		</div>
	</div>	
	<!--页面顶部top结束-->
	<div class="wrap_logo">
	<div class="logo">
			<div class="logo_left"><a href="#"><img src="../images/logo.gif"/></a> </div>
			<div class="logo_right"><img src="../images/tel.jpg" width="28" height="28" />24小时服务热线：<span class="tel">158-8827-4549</span></div>
			<div class="user_mobile"><img src="../images/user_green.png"/></div>
	</div>
	</div>
	<!--logo结束-->
	<c:import url="header.jsp"></c:import>
	  <!--nav结束-->
 <div class="wrap">
	<c:import url="carousel.jsp"></c:import>
	<!--ad结束-->
	<!--pages结束-->
	<div class="content">
		<div class="content_l">
			<div class="content_l_list">
				<ul>
					<li><a id="about" href="javascript:;">本院介绍<span>About Us</span></a></li>
					<li><a id="environment" href="javascript:;">环境设施<span>Environment</span></a></li>
					<li><a id="services" href="javascript:;">孤儿救助<span>Services</span></a></li>
					<li><a id="knowledge" href="javascript:;">孤儿助养<span>Knowledge</span></a></li>
					<li><a id="professional" href="javascript:;">法律法规<span>Professional Care</span></a></li>
					<li><a id="contact" href="javascript:;">联系我们<span>Contact Us</span></a></li>
				</ul>
			</div>
		</div>
		<div class="content_right" name="content_right">
			<div class="load_img">
				<img src="../images/loading2.gif"/>
			</div>
		</div><!--content_right结束-->
		<c:if test="${id==12}">
		<iframe class="content_right2" src="c_environment.do" frameborder="0" width="" height=""></iframe>
		</c:if>
	</div><!--content结束-->
	</div><!--wrap结束-->
	<a id="to_top" href="javascript:;" title="回到顶部"></a>
	<div class="footer">
		<div class="footer_text">
			<a class="github fl" href="https://github.com/heguofeng" target="_blank" title="我的个人GitHUb">我的GitHub</a>
			<span class="copyright fl">儿童医院 <i>cc</i></span>
			<a class="icp fl" href="http://www.miitbeian.gov.cn" target="_blank" title="浙ICP备17016736号"></a>
		</div>
	</div>
	<div class="masklayer">  </div><!--遮罩层-->
</body>
<script type="text/javascript" src="../js/content.js"></script>
<script type="text/javascript">
    var id=${id}
	switch (id) {
	case 1:
		$(".content_right").load("c_about.do?id=1");
		break;
	case 2:
		$(".content_right").load("c_environment.do?");
		break;
	case 3:
		$(".content_right").load("c_about.do?id=3");
		break;
	case 4:
		$(".content_right").load("c_knowledge.php?id=2");
		break;
	case 13:
		$(".content_right").load("c_charges.php");
		break;
	case 5:
		$(".content_right").load("c_about.php?id=5");
		break;
	case 12:
		$(".content_right").css("display","none");
		$(".content_right2").css("display","block");
		break;
	default:
		break;
	}
	
</script>
</html>
