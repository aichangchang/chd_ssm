<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>后台登录</title>
	<link rel="shortcut icon" href="images/favicon.ico"/><!--加图标-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link rel="stylesheet" type="text/css" href="../admin/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../admin/css/main.css">
    <script type="text/javascript" src="../admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="../admin/js/jquery.validate.min.js"></script>
</head>
<body>
<div id="background"><img src="../images/bj_zhuce.jpg" width="100%" height="100%"/></div><!--背景层-->
<div class="login_body">
	<div class="logo"><a href="###"><img src="../images/logo.png" alt="logo" width="350" height="100" border="0"></a></div>
    <div class="login_kuang">
    	<div class="dl">
        	<div class="bj_left"><!--左边输入框-->
	            <h3>管理员登录</h3>
	       	  	  <form id="formD" name="formD" method="get" action="#">
		       	  	  	<table border="0" cellspacing="0" cellpadding="0">
		       	  	  		<tr><td>账号<input type="text" id="username" name="username" class="kuang_txt" placeholder="admin" value="admin"></td></tr>
		       	  	  		<tr><td>密码<input type="password" id="password" name="password" class="kuang_txt" placeholder="admin" value="admin" onkeypress="login(event)"></td></tr>
		       	  	  	</table>       
		                <div>
		               		<a href="#" title="忘记密码">忘记密码？</a><input id="autoFlag" name="autoFlag" type="checkbox" value=""><span>记住我</span> 
		                </div>
		                <input name="btn_denglu" type="button" id="btn_denglu" class="btn_denglu" value="登录">
		                <p id="createResult"></p>
		                  <span class="save_start" style="display: none;margin-left: 80px;"> 正在登录 </span>
	              </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"> 
	$(document).ajaxStart(function(){
		$(".save_start").css("display",'block');
		$("#createResult").css("display",'none');
	});
$().ready(function() {	
		$("#username").focus();
		$("#btn_denglu").click(function(){
			var flag = $('#formD').valid();//验证表单有效性
	    	if(flag){
				$.ajax({
					type:"POST",
					//url:"login.php?username="+$("#username").val(),
					url:"handleLogin.do",
					data:{
						username:$("#username").val(),
						password:$("#password").val(),
						},
					dataType:"json",
					success:function(data){
						$(".save_start").css("display",'none');
						if(data.code==1){
								$("#createResult").html(data.message);
								$("#createResult").css({"display":'block',"color":"#228b22"});
							   window.location="${base}/admin/index.do";
						}
						else{
								$("#createResult").html(data.message);
								$("#createResult").css({"display":'block',"color":"red"});
								setTimeout(function(){
									$("#createResult").css("display",'none');
								},2000);
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
                    minlength: 1,
                    maxlength: 20
               },
			   password: {
				    required: true,
				    minlength: 1
			   }
	 		},
	        messages: 
	        {
			   username: {
                    required: '请输入账号',
                    minlength: '账号不能小于1个字符',
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
function login(evt){
	evt=(evt)?evt:((window.event)?window.event:"");
	var key=evt.keyCode?evt.keyCode:evt.which;
	if(key==13){
		$("#btn_denglu").click();
	}
}
</script>
</body>

</html>