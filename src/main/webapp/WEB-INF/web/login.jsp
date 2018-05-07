<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<c:set value="${pageContext.request.contextPath}" var="base"></c:set>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="shortcut icon" href="images/favicon.ico"/><!--加图标-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
   	<link rel="stylesheet" type="text/css" href="../css/main.css"/ media="screen and (min-width:481px)">
	<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../plugins/dialog.js"></script>
</head>
<body>
<div id="background"></div><!--背景层-->
<div class="zhuce_body">
	<div class="logo_login"><a href="index.php"><img src="../images/logo1.png" alt="logo" border="0"></a></div>
    <div class="zhuce_kong login_kuang">
    	<div class="zc">
        	<div class="bj_left"><!--左边输入框-->
	            <h3>登录</h3>
	       	  	  <form id="formD" name="formD" method="get" action="#" autocomplete="off">
		                <input type="text" id="username" name="username" class="kuang_txt phone" placeholder="请输入账号" autocomplete="off" onkeypress="dologin(event)">
		                <input type="password" id="password" name="password" class="kuang_txt password" placeholder="请输入密码" autocomplete="off" onkeypress="dologin(event)">
		                <div class="wjmm">
		               		<a href="forget_pwd.html" title="忘记密码">忘记密码？</a><input id="autoFlag" name="autoFlag" type="checkbox" value=""><span>记住我</span> 
		                </div>
		                <input name="btn_denglu" type="button" id="btn_denglu" class="btn_denglu" value="登录">
		                <a class="toggle_btn" href="register.do" title="点此进行注册">立即注册&gt;&gt;</a>
		                <p id="createResult"></p>
		                <span class="login_start"> 正在登录 </span>
	              </form>
            </div>
        	<div class="bj_right">
            	<p>使用以下账号直接登录</p>
                <a href="javascript:;" class="zhuce_qq" title="QQ注册">QQ注册</a>
                <a href="javascript:;" class="zhuce_wb" title="微博注册">微博注册</a>
                <a href="javascript:;" class="zhuce_wx" title="微信注册">微信注册</a>
                <p>还没有账号？<a href="register.do" title="立即注册">立即注册</a></p>            
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"> 
$().ready(function() {
	$("#username").focus();

	$("#btn_denglu").click(function(){
		$(document).ajaxStart(function(){
			$(".save_start").css("display",'block');
			$("#createResult").css("display",'none');
		});
			var flag = $('#formD').valid();//验证表单有效性
	    	if(flag){
				$.ajax({
					type:"GET",
					//url:"login.php?username="+$("#username").val(),
					url:"doUserAction.php?act=login",
					data:{
						username:$("#username").val(),
						password:$("#password").val(),
						autoFlag:$("#autoFlag").is(':checked')
						},
					dataType:"json",
					success:function(data){
						if(data.success){
							$(".save_start").css("display",'none');
							$("#createResult").css({"display":'block',"color":"#228b22"});
							$("#createResult").html(data.msg);
							window.location="${base}/main/index.do";
						}
						else{
							$(".save_start").css("display",'none');
							$("#createResult").css({"display":'block',"color":"red"});
							$("#createResult").html(data.msg);
							setTimeout(function(){
								$("#createResult").css("display",'none');
							},2000);
							$("#password").val("");
						}
					},
					error:function(jqXHR){
						alert("发生错误:"+jqXHR.status);
					},
				});
			}
	});	 
		//表单验证	
	 $("#formD").validate({	
	        rules: {
			    username: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
               },
			   password: {
				    required: true,
				    minlength: 2
			   },
	 		},
	        messages: 
	        {
			   username: {
                    required: '请输入用户名',
                    minlength: '账号不能小于2个字符',
                    maxlength: '账号不能超过20个字符',
                    remote: '账号不存在'
               },
			   password: {
				    required: "请输入密码",
				    minlength: jQuery.format("密码不能小于{0}个字 符")
			   }
	  		}	
	   });
	 
});
	function dologin(evt){
		evt=(evt)?evt:((window.event)?window.event:"");
		var key=evt.keyCode?evt.keyCode:evt.which;
		if(key==13){
			$("#btn_denglu").click();
		}
	}

</script>
</body>

</html>