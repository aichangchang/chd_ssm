<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<!--加图标-->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/main.css"
	/ media="screen and (min-width:481px)">
<link rel="stylesheet" type="text/css" href="../css/main480.css"
	media="screen and (max-width:480px)" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../plugins/dialog.js"></script>
</head>
<body>
	<div id="background"></div>
	<!--背景层-->
	<div class="zhuce_body">
		<div class="logo_login">
			<a href="${base}/main/index.do"><img src="../images/logo.png" border="0"
				title="儿童院"></a>
		</div>
		<div class="zhuce_kong ">
			<div class="zc">
				<div class="bj_left">
					<h3>欢迎注册</h3>
					<form id="formZ" name="formZ" action="#" method="post">
						<input type="text" id="username" name="username" class="kuang_txt phone" placeholder="请输入账号"> 
							<input type="password" id="password" name="password" class="kuang_txt password" placeholder="请输入密码"> 
							<input type="password" id="confirm_password" name="confirmPassword" class="kuang_txt password" placeholder="请再确认一次密码"> 
							<input type="text" id="email" name="email" class="kuang_txt email" placeholder="请输入常用邮箱">
						<div>
							<input name="securityCode" id="security_code" type="text"
								class="kuang_txt yanzm" placeholder="请输入验证码"> <img
								src="${base}/yz/kaptcha.do" id="kaptchaImage" title="看不清，点击换一张">
						</div>
						<div>
							<input name="autoFlag" id="autoFlag" type="checkbox"
								checked="checked" value=""><span>已阅读并同意<a
								href="#" target="_blank"><span class="lan">《XXXXX使用协议》</span></a></span>
						</div>
						<input name="btn_zhuce" type="button" id="btn_zhuce"
							class="btn_zhuce" value="注册"> <a class="toggle_btn"
							href="login.html" title="登录">立即登录&gt;&gt;</a>
						<p id="createResult"></p>
					</form>
				</div>
				<!--bj_left左框-->
				<div class="bj_right">
					<p>使用以下账号直接登录</p>
					<a href="#" class="zhuce_qq" title="QQ注册">QQ注册</a> <a href="#"
						class="zhuce_wb" title="微博注册">微博注册</a> <a href="#"
						class="zhuce_wx" title="微信注册">微信注册</a>
					<p>
						已有账号？<a href="login.do" title="立即登录">立即登录</a>
					</p>
				</div>
				<!--bj_right右框-->
			</div>
			<!--zc注册框-->
		</div>
		<!--zhuce_kong-->
	</div>
	<!--zhuce_body-->
	<script type="text/javascript"> 
$("#kaptchaImage").click(function(){ 
	var img=this; 
	console.log(img); //添加请求参数的目的避免浏览器的缓存 
	img.src="${base}/yz/kaptcha.do?"+new Date().getTime(); 
	});
$().ready(function() {
	$("#username").focus();
	$("#btn_zhuce").click(function(){
	var data = $('#formZ').serialize();	
		//先通过button验证表单有效性
		var flag = $('#formZ').valid();
    	if(flag){
    		var d1= dialog({
				content:'<span class=\'save_start\'>正在注册您的信息。</span>'
			});
			$(document).ajaxStart(function(){
				d1.show();					 
			});
			$.ajax({
				"type":"POST",
				"url":"handleRegister.do",
				"data":data,
				"dataType":"json",
				success:function(obj){
					if(obj.code==1){
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_success\'>'+obj.message+'</span>'
						});
						d.show();
						setTimeout(function(){
							d.close().remove();
							window.location='${base}/user/login.do';
						},2500);	
					}
					else{
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_failed\'>'+obj.message+'</span>',
							quickClose:true,//点击空白出快速关闭
						});
						d.show();
						setTimeout(function(){
							d.close().remove();
						},3000);
					}
				},
				error:function(jqXHR){
					alert("发生错误:"+jqXHR.message);
				},
			
			});
		}
	});	
	$("#formZ").validate({	 	
	        rules: {
			    username: {
                    required: true,
                	rangelength:[6,12],
                	remote:{
                		url:"registerCheckUsername.do",
                		type:"POST",
                		dateType:"json",
                		data: {                     
                	        username: function() {
                	            return $("#username").val();
                	        }
                	    }
                	}
                },
			   password: {
				    required: true,
				    minlength: 6,
				    rangelength:[6,12]
			   },
			   confirm_password: {
				    required: true,
				    minlength: 6,
				    equalTo: "#password"
			   },
			   security_code:{
				   required: true
			   },
			   email:{
				   required: true,
				   email:true
			   }
	 		},
	        messages: 
	        {
			      username: {
                    required: '请输入用户名',
                    rangelength:'请输入6-12为的用户名',
                    remote: '账号已存在'
                },
			   password: {
				    required: "请输入密码",
				    rangelength:'请输入6-12位的密码',
				    minlength: jQuery.format("密码不能小于{0}个字符")
			   },
			   confirm_password: {
				    required: "请输入确认密码",
				    minlength: "确认密码不能小于6个字符",
				    equalTo: "两次输入密码不一致！"
			   },
			   security_code:{
				    required:"验证码不能为空"  
			   },
			   email:{
				   required:"邮箱不能为空",	
				   email:'请输入正确的邮箱格式'
			   }
	  		}	
	   	 });
});

</script>
</body>
</html>