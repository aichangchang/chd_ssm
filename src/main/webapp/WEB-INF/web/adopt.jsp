<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="base"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title></title>
<style type="text/css">
.table {
	border-spacing: 0;
	border-color: grey;
	box-sizing: border-box;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
    width: 100%;
    text-align: center;
    background-color: transparent;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.table>thead:first-child>tr:first-child>th {
    border-top: 0;
}
.table>thead>tr>th {
    vertical-align: bottom;
    padding: 8px;
    line-height: 1.42857143;
    border-bottom: 2px solid #ddd;
}
.table th, .table td {
    border: solid 1px #ccc;
    padding: 8px;
}
.table th {
    background-color: #E8E8E8;
}
iframe {
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: middle;
    border-top: 1px solid #ddd;
}
.label_id, .check {
    vertical-align: middle;
}
label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 700;
}
a {
    color: #337ab7;
    text-decoration: none;
}
a {
    background-color: transparent;
}

.btn-info:hover {
    color: #fff;
    background-color: #31b0d5;
    border-color: #269abc;
}
.btn.focus, .btn:focus, .btn:hover {
    color: #333;
    text-decoration: none;
}
button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
}
.btn {
    display: inline-block;
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    margin-left: 10px;
    margin-bottom: 5px;
}
button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
}
.btn-info {
    color: #fff;
    background-color: #5bc0de;
    border-color: #46b8da;
}
.btn-success {
    color: #fff;
    background-color: #5cb85c;
    border-color: #4cae4c;
}




</style>
<link rel="shortcut icon" href="images/favicon.ico"/><!--加图标-->
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../css/main.css" media="screen and (min-width:481px)"/>
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script src="../plugins/myFocus/myfocus-2.0.4.min.js" type="text/javascript" charset="utf-8"></script><!--引入myFocus库-->
<script type="text/javascript" src="../js/content.js"></script>
<script type="text/javascript" src="../plugins/dialog.js"></script>
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
	<c:import url="header.jsp"></c:import>
	  <!--nav结束-->
 <div class="wrap">
	<div class="content">
		 <table class="table table-striped" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th width="5%">编号</th>
                    <th width="10%">儿童姓名</th>
                    <th width="10%">年龄</th>
                    <th width="5%">性别</th>
                    <th width="10%">入院日期</th>
                    <th width="20%">记录</th>
                    <th width="10%">领养人</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
              <c:forEach begin="0" step="1"  items="${listChildren}" var="children">
                <tr>
                    <td><label class="label_id">${children.number}</label></td>
                    <td><a href="detialChildren.do?id=${children.id}">${children.cname}</a></td>
                    <td>${children.cage}</td>
                    <td>${children.cgender}</td>
                    <f:formatDate value="${children.reach}" pattern="yyyy-MM-dd" var="date"/>
                    <td>${date}</td>
               		<td>${children.cMessage}</td>
               		<td><c:if test="${children.uname==null||children.cagree!=1}">无领养人信息</c:if>${children.uname}</td>
                    <td align="left">
                    	<input type="button" value="详细信息" class="btn btn-info"  onclick="">	
                    	<input type="button" value="领养" class="btn btn-success" onclick="adoptChildren(${children.id})">
                    	<%-- <?php if($row['u_bed']==0): ?>	
                    	<input type="button" value="入住" class="btn btn-primary" onclick="checkIn(<?php echo $row['id']; ?>)">
                    		<?php else: ?>
                    	<input type="button" value="换床" class="btn btn-warning" onclick="changeBed(<?php echo $row['id']; ?>)">
                    	<input type="button" value="退房" class="btn btn-danger" onclick="checkOut(<?php echo $row['id']; ?>)">
                    		<?php endif;?> --%>
                    </td>
                </tr>
       		
                <tr>
                	<td colspan="8"><!--  <?php echo showPage($page, $totalPage, "keywords={$keywords}&condition={$condition}"); ?>--></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>
         <a	class="btn btn-success" href="adopt.do?page=${page.prePage}">上一页</a>
         <a class="btn btn-success" href="adopt.do?page=${page.nextPage}">下一页</a>
	</div>
		
</div>
	<a id="to_top" href="javascript:;" title="回到顶部"></a>
	<div class="footer">
		<div class="footer_text">
			<a class="github fl" href="https://github.com/heguofeng" target="_blank" title="我的个人GitHUb">我的GitHub</a>
			<span class="copyright fl">某孤儿院 <i>cc</i></span>
			<a class="icp fl" href="http://www.miitbeian.gov.cn" target="_blank" title="浙ICP备17016736号"></a>
		</div>
	</div>
	<div class="masklayer">  </div><!--遮罩层-->
</body>
<script type="text/javascript">
function adoptChildren(id) {
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
			url:"${base}/user/adoptChildren.do",
			data:{
				childrenId:id
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
				alert("发生错误:"+jqXHR.status);
			},
		});
}
</script>
</html>
