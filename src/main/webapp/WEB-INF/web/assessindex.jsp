<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="base"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta name="keywords" content="" />
		<meta name="description" content="领养儿童智慧评估"/>
		<meta http-equiv="Pragma" content="no-cache" /><!--不缓存-->
		<link rel="shortcut icon" href="images/logo.png"/>
		<meta charset="UTF-8"/>
		<title>领养评估</title>
		<link rel="stylesheet" type="text/css" href="../plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../css/assess/reset.css"/>
		<link rel="stylesheet" type="text/css" href="../css/assess/index.css"/>
		<link rel="stylesheet" type="text/css" href="../css/assess/public.css"/>
		<script src="../js/assess/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../plugins/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="top">
			<div class="top_header">
				<div class="top_header_l fl">
					<img class="fl" src="../images/assess/logo.png" height="56" width="56"/>
					<a class="logo_txt fl" href="index.html">领养评估</a>
				</div><!--top_header_l-->
				<div class="top_header_r fr">
					<ul>
						<li><a href="javascript:;" id="btn_login">登录</a></li>
						<li class="top_header_r"><a class="bor_left" id="btn_reg" href="javascript:;">注册</a></li>
					</ul>
				</div><!--top_header_r-->
			</div><!--top_header-->
		</div><!--top-->
		<div class="main">
			<div class="pic"></div><!--图片-->
			<div class="pic_aixin"><!--爱心-->
				<img src="../images/assess/aixin01.png"/>
			</div>
			<div class="main_title">
				<cite>孤儿院领养评估系统</cite><br />
				<span>对领养人领养能力等方面的评估</span>
			</div><!--main_title-->
			<div class="main_start">
				<a href="#miantitle" class="start">开始测试</a>
			</div><!--main_start-->
		</div><!--main-->
		<div class="nav">
			<nav>
				<div class="row">
					<h3 id="miantitle">使用教程</h3>
					<p>先完善您的个人资料，再点击对应的评估模块进行量表评估。</p>
				</div>
				<div class="row">
					<div class="nav_box fl" style="margin-left: 16.65%;">
						<a href="assess_personal_info.do" title="完善个人资料">
							<div class="nav_boxx">
								<img src="../images/assess/tp01.png"/>
								<div class="nav_txt">
									完善个人资料
								</div>
							</div>
						</a>
					</div>
					<div class="nav_box fl">
						<a href="assessing.do">
							<div class="nav_boxx">
								<img src="../images/assess/tp02.png"/>
								<div class="nav_txt">
									开始评估
								</div>
							</div>
						</a>
					</div>
				
				</div><!--row-->
			</nav>
		</div><!--nav-->
		<footer>
			<p>领养儿童智慧评估有限公司&nbsp;&nbsp;2018 ©<a href="###">wmuoldstar.cn</a></p>
			<p> Design by <i>weichang</i></p>
		</footer>
		<div class="loginBg" id="loginBg"></div>  <!--遮罩层-->
		<div class="loginBox frameBox" id="regBox"><!--注册框-->
			<div class="login_title">
				<h3>注册账号</h3>
				<div class="yzc">
					已注册
					<a href="javascript:;" id="box_btn_login">登录</a>
				</div>
			</div>
			<form class="layui-form layui-form-pane" action="#" method="post">
				<div class="loginiBOX">
					<div class="layui-form-item">
						<label class="layui-form-label" style="line-height: 28px;height: 44px;">手机号</label>
						<div class="layui-input-block" style="margin-bottom: 24px;">
							<input type="text" name="username" id="reg_username" value="" lay-verify="phone" class="layui-input" style="height: 44px;line-height: 44px;" autocomplete="off" placeholder="手机号"/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="line-height: 28px;height: 44px;">设置密码</label>
						<div class="layui-input-block" style="margin-bottom: 24px;">
							<input type="password" name="password" id="reg_password" value="" class="layui-input" style="height: 44px;line-height: 44px;" autocomplete="off" placeholder="密码"/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label blue-hover" id="btn_code" style="line-height: 28px;height: 44px; background-color: #1E9FFF;border-radius: 5px;cursor: pointer;color: #fff;"onmouseover="this.style.backgroundColor='#0065d0';" onmouseout="this.style.backgroundColor='#1E9FFF'">获取验证码</label>
						<div class="layui-input-block" style="margin-bottom: 24px;padding-left: 10px;">
							<input type="text" name="security_code" id="security_code" value="" class="layui-input" style="height: 44px;line-height: 44px;border-radius: 5px;" autocomplete="off" placeholder="短信验证码"/>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="margin-left: 0; text-align: center;margin-bottom: 24px;">
							<button id="reg_btn" class="layui-btn layui-btn-normal blue-hover" lay-submit="" lay-filter="login_btn" style="width: 100%;height: 44px;line-height: 44px;font-size: 18px;border-radius: 4px;">注册</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="loginBox frameBox" id="loginBox"><!--登录框-->
			<div class="login_title">
				<h3>账号登录</h3>
				<div class="yzc">
					没有账号
					<a href="javascript:;" id="box_btn_reg">注册</a>
				</div>
			</div>
			<form class="layui-form layui-form-pane" id="form_login" action="#" method="post">
				<div class="loginiBOX">
					<div class="layui-form-item">
						<label class="layui-form-label" style="line-height: 28px;height: 44px;">账号</label>
						<div class="layui-input-block" style="margin-bottom: 24px;">
							<input type="text" name="username" id="username" value="" lay-verify="phone" class="layui-input" style="height: 44px;line-height: 44px;" autocomplete="off" placeholder="手机号"/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label" style="line-height: 28px;height: 44px;">密码</label>
						<div class="layui-input-block" style="margin-bottom: 24px;">
							<input type="password" name="password" id="password" value="" class="layui-input" style="height: 44px;line-height: 44px;" autocomplete="off" placeholder="密码"/>
						</div>
					</div>
					<div class="layui-form-item" style="position: relative;">
						<label class=" fl rmb_pwd">记住密码</label>
						<div class="layui-input-inline">
							<input type="checkbox" name="autoFlag" id="autoFlag" lay-skin="switch" lay-filter="autoFlag" lay-text="是|否" />
						</div>
						<a href="#" class="forget_pwd">忘记密码</a>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="margin-left: 0; text-align: center;margin-bottom: 24px;">
							<button id="login_btn" class="layui-btn layui-btn-normal blue-hover" lay-submit="" lay-filter="login_btn" style="width: 100%;height: 44px;line-height: 44px;font-size: 18px;border-radius: 4px;">登录</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
	<style type="text/css">

	</style>
	<script src="../js/assess/login.js" type="text/javascript" charset="UTF-8"></script>
	<script type="text/javascript">
	</script>
</html>