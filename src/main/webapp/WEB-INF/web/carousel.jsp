<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	<div class="ad">
		<div id="boxID"> <!--焦点图盒子-->
			<div class="loading"></div><!--载入画面-->
			<div class="pic">
				<ul>
					<li><a href="#"><img src="../images/pic4.jpg" alt="关爱儿童" text=""/></a></li>
					<li><a href="#"><img src="../images/pic3.jpg" alt="关爱儿童" text=""/></a></li>
					<li><a href="#"><img src="../images/pic2.jpg" alt="关爱儿童" text=""/></a></li>
					<li><a href="#"><img src="../images/pic1.jpg" alt="关爱儿童" text=""/></a></li>
				</ul>
			</div>
		</div>
	</div>  
	<div class="hengxian"><img src="../images/diying.jpg" width="100%" height="20px"></div><!--中间小横线-->
	<div class="pages">
		<ul>
			<li class="pages01">
				<a href="article.do?id=<?php echo $shzl['id']; ?>" title="生活照料"><img src="../images/page01.jpg" alt="生活照料"></a>
			</li>
			<li class="pages02">
				<a href="article.do?id=<?php echo $ylhl['id']; ?>" title="医疗护理"><img src="../images/page02.jpg" alt="医疗护理"></a>
			</li>
			<li class="pages03">
				<a href="article.do?id=<?php echo $ylhd['id']; ?>" title="娱乐活动"><img src="../images/page03.jpg" alt="娱乐活动"></a>
			</li>
			<li class="pages04">
				<a href="article.do?id=<?php echo $jkgl['id']; ?>" title="健康管理"><img src="../images/page04.jpg" alt="健康管理"></a>
			</li>
			<li class="pages05">
				<a href="article.do?id=<?php echo $yyss['id']; ?>" title="营养膳食"><img src="../images/page05.jpg" alt="营养膳食"></a>
			</li>
		</ul>
	</div>