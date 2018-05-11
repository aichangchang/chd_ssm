<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content=""/>
<meta name="baidu-site-verification" content="SU2RQnG68g" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta charset="UTF-8"/>
<title>福利儿童院</title>
<link rel="shortcut icon" href=""/><!--加图标-->
<link rel="stylesheet" type="text/css" href="../css/reset.css"/>

<link rel="stylesheet" type="text/css" href="../css/main.css"/ media="screen and (min-width:481px)">
<link rel="stylesheet" type="text/css" href="../css/main480.css" media="screen and (max-width:480px)"/>
<link rel="stylesheet" type="text/css" href="../plugins/jquery.bxslider/jquery.bxslider.css"/>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../plugins/jquery.bxslider/jquery.bxslider.js"></script>
<script type="text/javascript">
	$().ready(function(){
		//轮播图
		$('.bxslider').bxSlider({
			auto:true,
			mode:"horizontal",//设置滚动模式
			captions:true,
			autoHover:false,
			controls:false
		});
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
	<!--wrap_logo结束-->
	  <c:import url="header.jsp"></c:import>
		<!--nav_mid结束-->
	<!--nav结束-->
	 <div class="wrap clearfix">
	  	<ul class="bxslider">
			<li><img src="../images/tim1.jpg" alt="" title=""/></li>
			<li><img src="../images/tim3.jpg" alt="" title=""/></li>
			<li><img src="../images/tim2.jpg" alt="" title=""/></li>
			<li><img src="../images/tim4.jpg" alt="" title=""/></li>
		</ul>
		<div class="hengxian"><img src="../images/diying.jpg" width="100%" height="20px"></div><!--中间小横线-->
		<div class="itemBg">
			<div class="item">
				<ul>
					<li class="special01">
						<i></i>
						<a href="article.php?id=<?php echo $shzl['id']; ?>" title="生活照料"><em></em><span><strong>生活照料</strong>Life Care</span></a>
					</li>
					<li class="special02">
						<i></i>
						<a href="article.php?id=<?php echo $ylhl['id']; ?>" title="医疗护理"><em></em><span><strong>医疗护理</strong>Medical Care</span></a>
					</li>
					<li class="special03">
						<i></i>
						<a href="article.php?id=<?php echo $ylhd['id']; ?>" title="娱乐活动"><em></em><span><strong>娱乐活动</strong>Activities</span></a>
					</li>
					<li class="special04">
						<i></i>
						<a href="article.php?id=<?php echo $jkgl['id']; ?>" title="健康管理"><em></em><span><strong>健康管理</strong>Management</span></a>
					</li>
					<li class="special05">
						<i></i>
						<a href="article.php?id=<?php echo $yyss['id']; ?>" title="营养膳食"><div><em></em><span><strong>营养膳食</strong>Dietary</span></div></a>
					</li>
				</ul>
			</div>
		</div>
		<!--itemBgj结束-->
		<div class="new">
			<div class="new_left">
				<div class="titleBox">
					<h3 class="title"><a href="#" title="孤儿救助"><span>孤儿救助</span>/Professional Care</a></h3>
				</div>
				<div class="HLlist">
					<dl>
						<dt>
							<a href="#" title="救助儿童"><img src="../images/zyhl.jpg" width="100%" alt="救助儿童"></a>
						</dt>
						<c:forEach items="${oneListNews}" var="oneListNews">
							<dd><a href="article.do?id=${oneListNews.id}" title="${oneListNews.title}">${oneListNews.title}</a></dd>
						</c:forEach>
					</dl>
				</div>
			</div>
			<div class="new_mid">
				<div class="titleBox">
					<h3 class="title"><a href="nav_about.php?id=2" title="本院要闻"><span>本院要闻</span>/news</a></h3>
				</div>
				<div class="CHlist">
					<dl>
						<dt>
							<a href="article.php?id=<?php echo $last_bjcs['id']; ?>" title="<?php echo $last_bjcs['title']; ?>"><img src="../images/chd.jpg" width="27%" height="100%" alt="<?php echo $last_bjcs['title']; ?>"></a>
							<h2><a href="article.php?id=<?php echo $last_bjcs['id']; ?>"><?php echo $last_bjcs['title']; ?></a></h2>
							<div id="description">
								<p><?php echo $last_bjcs['description']; ?></p>
								<a href="article.php?id=<?php echo $last_bjcs['id']; ?>">[&gt;&gt;查看详细&lt;&lt;]</a>
							</div>
						</dt>
						<div id="scrollBox">
							<ul>
								<c:forEach items="${twoListNews}" var="twoListNews">
								<dd><a href="article.do?id=${twoListNews.id}" title="${twoListNews.title}">${twoListNews.title}</a></dd>
								</c:forEach>
							</ul>
						</div>
					</dl>
				</div>
			</div>
			<div class="new_right">
				<div class="titleBox">
					<h3 class="title"><a href="#" title="营养膳食"><span>营养膳食</span>/Dietary</a></h3>
				</div>
				<ul class="bxslider">
					<li><img src="../images/yyss01.jpg" alt="蔬菜搭配" title="蔬菜搭配" height="100%" width="100%" /></li>
					<li><img src="../images/yyss02.jpg" alt="五谷杂粮" title="五谷杂粮" height="100%" width="100%" /></li>
					<li><img src="../images/yyss03.jpg" alt="早餐学问" title="早餐学问" height="100%" width="100%" /></li>
					<li><img src="../images/yyss04.jpg" alt="必要蛋白质补充" title="必要蛋白质补充" height="100%" width="100%"/></li>
				</ul>
			</div>
		</div>
		<!--new结束-->
		<div class="zzfc">
			<div class="titleBox">
				<h3 class="title"><a href="#" title="院内风采"><span>院内风采</span>/style</a></h3>
			</div>
			<div class="zzfc_box">
				<div id="scrollPic">
					<ul>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td id="scrollPic1">
									<table border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td><li><img src="../images/zzfc.jpg"/><a class="pic_name">温馨</a></li></td>
											<td><li><img src="../images/zzfc2.jpg"/><a class="pic_name">充满爱</a></li></td>
											<td><li><img src="../images/zzfc3.jpg"/><a class="pic_name">休闲时光</a></li></td>
											<td><li><img src="../images/zzfc4.jpg"/><a class="pic_name">快乐</a></li></td>
										</tr>
									</table>
								</td>
								<td id="scrollPic2"></td><!--复制一个框-->
							</tr>
						</table>
					</ul>
				</div>
			</div>
		</div>
		<!--zzfc长者风采结束-->
		<div class="environment">
			<ul>
				<li class="environment01"><a href="#"><span>环境设施</span>Environment</a></li>
				<li class="environment02">
					<a href="#">
						<img src="../images/environment01.jpg" >
						<div class="img_cover"></div>
					</a>
					<p><a class="henfan" href="#">儿童院院景</a></p>
				</li>
				<li class="environment03">
					<a href="#">
						<img src="../images/environment02.jpg" alt="养老院院景" />	
						<div class="img_cover"></div>
					</a>
					<p><a class="henfan"  href="#">儿童院院景</a></p>
				</li>
				<li class="environment04">
					<a href="#">
						<img src="../images/environment03.jpg" alt="养老院院景" />		
						<div class="img_cover"></div>			
					</a>
					<p><a class="henfan" href="#">儿童院院景</a></p>
				</li>
				<li class="environment05">
					<a href="#">
						<img src="../images/environment051.jpg" alt="养老院院景">
							<div class="img_cover"></div>
					</a>
					<p><a class="henfan"  href="#">儿童院院景</a></p>
				</li>
				<li class="environment06">
					<a href="#">
						<img src="../images/environment04.jpg" alt="养老院院景" />	
						<div class="img_cover"></div>
					</a>
					<p><a class="henfan"  href="#">儿童院院景</a></p>
				</li>
				<li class="environment07">
					<a href="#">
						<img src="../images/environment06.jpg" width="100%" alt="养老院院景" />
						<div class="img_cover"></div>
						
					</a>
					<p><a class="henfan"  href="#">儿童院院景</a></p>
				</li>
				<li class="environment08">
					<a href="nav_about.do?id=12">查看更多&gt;&gt;</a>
				</li>
			</ul>
		</div>
		<!--environment环境设施结束-->
		<div class="history">
			<h4>关爱&nbsp;&nbsp;儿童</h4>
			<div class="history_pic">
				<ul>
					<li class="history_pic01">
						<span></span>
						<em>专业管理<br>
							专业护理
						</em>
					</li>
						<li class="history_pic02">
						<span></span>
						<em>建筑面积<br>
							2000平方米
						</em>
					</li>
						<li class="history_pic03">
						<span></span>
						<em>大小独立套房<br>
							共计100余间
						</em>
					</li>
						<li class="history_pic04">
						<span></span>
						<em>员工<br>
							50余人
						</em>
					</li>
				</ul>
			</div>
			<!--history_pic结束-->
			<div class="history_text">
			<p >
				福利儿童院，希望您多关注。
			</p>
			</div>
		</div>
		<!--history结束-->
	</div>
	<!--wrap结束-->
	<!--to_top-->
	<a id="to_top" class="clearfix" href="javascript:;" title="回到顶部"></a>
	
	<div class="masklayer">  </div><!--遮罩层-->
</body>
<script type="text/javascript" src="../js/main.js"></script><!--自己写的js文件要放在最后面-->

</html>
