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
<title>修改信息</title>
<link rel="shortcut icon" href="images/favicon.ico"/><!--加图标-->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/main.css" media="screen and (min-width:481px)">
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../js/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../plugins/dialog.js"></script>
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
<style type="text/css">
	.change_username {
	width: 92px;
	height: 26px;
	padding: 0 7px;
	background-color: #7b8c9e;
	border: 1px solid #6d7c8c;
	color: #ffffff;
	margin: 0 auto;
}

.change_username:hover {
	background-color: #6c7d8e;
}
</style>
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
					<li><a id="editpwd" href="${base}/user/infoEditPwd.do">修改密码<span>Knowledge</span></a></li>						
					<li><a id="account" href="javascript:;">我的账户<span>Account</span></a></li>
					<li><a id="pay" href="javascript:;">我的缴费<span>Pay</span></a></li>	
				</ul>
			</div>
		</div>
		<div class="content_right">
			<div class="info_preview">
				<div class="info_title prev_title">
					<h3>个人信息 </h3>
				</div>
				<table  cellspacing="0" cellpadding="0">
				<tr><td class="basicinfo_title">姓名：</td>
				<td >
				<span class="rs_username">${user.name}</span>
				<input type="text" name="u_name" id="u_name" style="display: none;" class="txtinput" value="" />
				</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">性别:</td>
					<td class="td_crossline">
						<select name="u_sex" id="u_sex" class="select_small">
						 <option>男</option>  
						 <option>女</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">出生日期:</td>
					<td class="td_crossline">
					<f:formatDate var="date" value="${user.birthday}" pattern="yyyy-MM-dd"/>
					<input type="text" id="u_birth" class="birth" name="u_birth" value="${date}" onclick="WdatePicker({onpicked:changeFlagTrue(),minDate: '1900-01-01',startDate:'1980-01-01' })"/>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">身份证:</td>
					<td class="td_crossline">
					<span class="rs_username">${user.idNumber}</span>
					<input type="text" class="txtinput" name="u_mz" id="u_mz" style="display: none;" value=""/></td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">学历状况:</td>
					<td class="td_crossline">
						<select name="u_xlzk" class="select_small" id="u_xlzk">
							<option value="小学">小学</option>
							<option value="初中">初中</option>
							<option value="高中">高中</option>
							<option value="大专">大专</option>
							<option value="本科">本科</option>
							<option value="研究生">研究生</option>
							<option value="博士">博士</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">婚烟状况：</td>
					<td class="td_crossline">
						<select name="u_hyzk" class="select_small" id="u_hyzk">
							<option value="未婚">未婚</option>
							<option value="已婚">已婚</option>
							<option value="离婚">离婚</option>
							<option value="丧偶">丧偶</option>
						</select>
					</td>
				</tr>
				<tr><td class="basicinfo_title td_crossline">手机号码：</td>
					<td class="td_crossline"><input type="text" class="txtinput" name="u_phone" id="u_phone" value="${user.phone}"  /></td>
				</tr>
			</table>
			<div>
			<button id="change_username" class="change_username">更改</button>
			<button id="btn_save" class="btn_save">保存</button>
			</div>
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
<script type="text/javascript">
$("#u_xlzk option[value='${user.education}']").removeAttr("selected");//根据值去除选中状态  
$("#u_xlzk option[value='${user.education}']").attr("selected","selected");//根据值让option选中  
$(".change_username").click(function(){
	$(".rs_username").hide();
	var name = $(".rs_username").html();
	$(".txtinput").val(name);
	$(".txtinput").show();
})
	var changeFlag=false;//标识文本框值是否改变，为true，标识已变
	function changeFlagTrue(){
		changeFlag=true;
	}
	$().ready(function(){
		$("input[type='text']").change(function(){
			changeFlagTrue()
		});
		$("select").change(function(){
			changeFlagTrue()
		});
	
		//保存按钮
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
				url:"save.do",
				data:{
					name:$("#u_name").val(),
					gender:$("#u_sex").val(),
					birthday:$("#u_birth").val(),
					idNumber:$("#u_mz").val(),
					education:$("#u_xlzk").val(),
					maritalStatus:$("#u_hyzk").val(),
					phone:$("#u_phone").val()
				},
				dataType:"json",
				success:function(data){
					if(data.code==1){
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_success\'>'+data.message+'</span>',
						});
						d.show();
						setTimeout(function(){
							d.close().remove();
						},2500);
					}
					else{
						d1.close().remove();//关闭中间过度动画
						var d= dialog({
							content:'<span class=\'save_failed\'>'+data.message+'</span>',
							quickClose:true,//点击空白出快速关闭
						});
						d.show();
						setTimeout(function(){
							d.close().remove();
						},3000);
					}
				},
				error:function(jqXHR){
					console.log($("#u_birth").val())
					console.log($("#u_name").val())
					console.log($("#u_sex").val())
					console.log($("#u_birth").val())
					console.log($("#u_mz").val())
					console.log($("#u_xlzk").val())
					console.log($("#u_hyzk").val())			
					console.log($("#u_phone").val())
					alert("发生错误:"+jqXHR.status);
				},
			});
		});
	});
	//当页面刷新或者离开时，警告提示
	window.onbeforeunload = function(event) {
		if (changeFlag==true) {
		    event.returnValue = "我在这写点东西...";
		}
	}
</script>
<script type="text/javascript" src="../js/content.js"></script>
</html>
