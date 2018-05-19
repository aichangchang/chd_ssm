<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title><c:out value="${news.title}"></c:out></title>
<link rel="shortcut icon" href="../images/favicon.ico"/><!--加图标-->
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/main.css" media="screen and (min-width:481px)">
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
<script src="../plugins/myFocus/myfocus-2.0.4.min.js" type="text/javascript"></script><!--引入myFocus库-->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/content.js"></script>
<script type="text/javascript">
myFocus.set({
	id:'boxID',//焦点图盒子ID
	pattern:'mF_kdui',//风格应用的名称
	time:3,//切换时间间隔(秒)
	trigger:'click',//触发切换模式:'click'(点击)/'mouseover'(悬停)
	width:1000,//设置图片区域宽度(像素)
	height:340,//设置图片区域高度(像素)
	txtHeight:'default',//文字层高度设置(像素),'default'为默认高度，0为隐藏
	loadIMGTimeout:0.5 //loading时间
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
				<a href="${base}/admin/index.do" target="_blank" title="进入后台管理系统" class="backstage">进入后台管理系统</a>
			</div>
			<ul class="top_content_user">
				<li>
					<span>欢迎您</span>
				</li>	
				<li class="top_content_nav">
					<div id="pic_tx">
					</div>
					<a class="user" href="javascript:;">${sessionScope.username}<i class="user_ico"></i></a>
						<div class="userCard">
							<a href="${base}/user/personal_info.do">个人中心</a>
							<c:if test="${sessionScope.username != null }">
							<a href="${base}/user/loginOut.do">退出</a>
							</c:if>
						</div>
				</li>
			</ul>
			<ul class="top_content_r">
			<c:if test="${sessionScope.username == null }">
				<li><a href="${base}/user/login.do">请登录</a></li>
				<li><a class="top_zc" href="${base}/user/register.do">注册</a></li>
			</c:if>
			</ul>
		</div>
	</div>	
	<!--页面顶部top结束-->

	<!-- header -->
	<c:import url="header.jsp"></c:import>
	 <div class="wrap">
	 <!-- 轮播图 -->
		<c:import url="carousel.jsp"></c:import>
	<div class="content">
		<div class="content_l">
			<div class="content_l_list">
				<ul>
					<li><a id="about" href="javascript:;">养老院介绍<span>About Us</span></a></li>
					<li><a id="services" href="javascript:;">服务特色<span>Services</span></a></li>
					<li><a id="knowledge" href="javascript:;">保健常识<span>Knowledge</span></a></li>
					<li><a id="professional" href="javascript:;">专业护理<span>Professional Care</span></a></li>
					<li><a id="environment" href="javascript:;">环境设施<span>Environment</span></a></li>
					<li><a id="charges" href="javascript:;">收费标准<span>Charges</span></a></li>
					<li><a id="contact" href="javascript:;">联系我们<span>Contact Us</span></a></li>
				</ul>
			</div>
		</div>
		<div class="content_right">
			<!--文章标题放这里-->
			<h1 class="a_title"><c:out value="${news.title}"></c:out><br />
				<span>发布日期：<c:out value="${news.createTime}"></c:out></span><span class="a_title2">作者：<c:out value="${news.author}"></c:out></span><span class="a_title2">浏览次数:<c:out value="${news.count}"></c:out></span>
			</h1>
			
			<div class="a_content">
				<!--文章内容放这里-->
				<c:out value="${news.content}"></c:out>	
			</div>
		</div><!--content_right结束-->
	</div><!--content结束-->
	</div><!--wrap结束-->
	<a id="to_top" href="javascript:;" title="回到顶部"></a>
	<div class="footer">
		<div class="footer_text">
			<a class="github fl" href="https://github.com/heguofeng" target="_blank" title="我的个人GitHUb"></a>
			<span class="copyright fl">儿童医院 <i>cc</i></span>
			<a class="icp fl" href="http://www.miitbeian.gov.cn" target="_blank" title="浙ICP备17016736号"></a>
		</div>
	</div>
	<div class="masklayer">  </div><!--遮罩层-->
</body>
</html>
