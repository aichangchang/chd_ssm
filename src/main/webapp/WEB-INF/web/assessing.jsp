<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="base"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Pragma" content="no-cache" /><!--不缓存-->
		<title>完善个人资料</title>
		<link rel="stylesheet" type="text/css" href="../plugins/layui/css/layui.css" />
		<link rel="stylesheet" type="text/css" href="../css/assess/reset.css" />
		<link rel="stylesheet" type="text/css" href="../css/assess/personal_info.css" />
		<script src="../js/assess/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../plugins/layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/assess/area.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/assess/personal_info.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="top">
			<div class="top_header">
				<div class="top_header_l fl">
					<img class="fl" src="../images/assess/logo.png" height="56" width="56" />
					<a class="logo_txt fl" href="index.html" title="首页">孤儿院领养评估系统</a>
				</div>
				<!--top_header_l-->
				<div class="top_header_r fr">
					<ul>
						<li>
							<a href="">登录</a>
						</li>
						<li class="top_header_r">
							<a class="bor_left" href="">注册</a>
						</li>
					</ul>
				</div>
				<!--top_header_r-->
			</div>
			<!--top_header-->
		</div>
		<!--top-->
		<!--<div class="p_picbox">
			<div class="p_picbox_pic"></div>
			<div class="p_picbox_title">
				<h1>完善个人信息</h1>
			</div>
		</div>-->
		<!--p_picbox-->
		<div class="p_main">
			<div class="p_main_left" id="p_main_left" style="height: 200px;">
				<ul class="layui-nav layui-nav-tree" lay-filter="test" style="height: 100%;">
					<li class="layui-nav-item layui-this">
						<a href="javascript:;"anchor="jbxx">收养动机</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" anchor="jtyy">性格心理</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" anchor="jbqk">道德品行</a>
					</li>
				</ul>
			</div>
			<div class="p_main_right" id="p_main_right">
				<div class="main_right_title">
					<h1 id="jbxx">收养动机</h1>
				</div>
				<hr style="width: 80%;margin: 10px 0;">
				<div class="main_content">
					<form class="layui-form" id="basicdata" action="doUserAction.php?act=save_pi&id=1" method="post" enctype="multipart/form-data">
						<div class="layui-form-item">
							<label class="layui-form-label">收养动机:</label>
							<div class="layui-input-block">
								 <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="main_right_title">
							<h1 id="jtyy">性格心理</h1>
						</div>
						<hr style="width: 80%;margin: 10px 0;">
						<label class="">认识你的人倾向形容你为:</label>
					<div class="layui-input-block">
    	 			   <input type="radio" name="1" value="A 热情和敏感" title="A 热情和敏感" ><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>A 热情和敏感</div></div>
     				 	<br>
     				   <input type="radio" name="1" value="B 逻辑和明确" title="B 逻辑和明确"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>B 逻辑和明确</div></div>
 					 </div>
					
				<label class="">下列哪一件事听起来比较吸引你？:</label>
					<div class="layui-input-block">
    	 			   <input type="radio" name="1" value="A 与恋人到有很多人且社交活动频繁的地方。" title="A 与恋人到有很多人且社交活动频繁的地方。" ><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>A 与恋人到有很多人且社交活动频繁的地方。</div></div>
     				 	<br>
     				   <input type="radio" name="1" value="B 呆在家中与恋人做一些特别的事情，例如说观赏一部有趣的录影带并享用你最喜欢的外卖食物。" title=" B 呆在家中与恋人做一些特别的事情，例如说观赏一部有趣的录影带并享用你最喜欢的外卖食物。"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div> B 呆在家中与恋人做一些特别的事情，例如说观赏一部有趣的录影带并享用你最喜欢的外卖食物。</div></div>
 					 </div>
 					 <label class="">你倾向通过以下哪种方式收集信息:</label>
					<div class="layui-input-block">
    	 			   <input type="radio" name="2" value="A 你对有可能发生之事的想像和期望." title="A 你对有可能发生之事的想像和期望." ><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>A 你对有可能发生之事的想像和期望.</div></div>
     				 	<br>
     				   <input type="radio" name="2" value=" B 你对目前状况的实际认知。" title=" B 你对目前状况的实际认知。"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div> B 你对目前状况的实际认知。</div></div>
 					 </div>
 					 <label class="">哪种特质更像你:</label>
					<div class="layui-input-block">
    	 			   <input type="radio" name="3" value="A 友善而仁慈。" title="A 友善而仁慈。" ><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>A 友善而仁慈。</div></div>
     				 	<br>
     				   <input type="radio" name="3" value=" B 冷静而理智。" title=" B 冷静而理智。"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div> B 冷静而理智。</div></div>
 					 </div>
 					 <label class="">你倾向相信：</label>
					<div class="layui-input-block">
    	 			   <input type="radio" name="4" value="A 你的直觉" title="A 你的直觉" ><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>A 你的直觉</div></div>
     				 	<br>
     				   <input type="radio" name="4" value="B 你直接的观察和现成的经验。" title="B 你直接的观察和现成的经验。"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>B 你直接的观察和现成的经验。</div></div>
 					 </div>
 					  <label class="">你觉得朋友和家人哪个更重要？</label>
					<div class="layui-input-block">
    	 			   <input type="radio" name="5" value="A 朋友" title="A 朋友" ><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i><div>A 朋友</div></div>
     				 	<br>
     				   <input type="radio" name="5" value="B 家人" title="B 家人"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>B 家人</div></div>
 					 </div>
						<div class="main_right_title">
							<h1 id="jbqk">道德品行</h1>
						</div>
							<div class="layui-form-item">
							<label class="layui-form-label lablesRight">1.有无虐待(忽视)儿童、家庭暴力或者其他针对儿童的违法行为,有无吸毒、酗酒或者暴力犯罪</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>					
								<div class="layui-form-item">
							<label class="layui-form-label lablesRight">2.家庭成员有无虐待(忽视)儿童、家庭暴力或者其他针对儿童的违法行为,有无吸毒、酗酒或者暴力犯罪</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
								<div class="layui-form-item">
							<label class="layui-form-label lablesRight">3.收入或经济能力是否足以负担家庭生活</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
								<div class="layui-form-item">
							<label class="layui-form-label lablesRight">4.能否提供充足的空间以满足家中新增被收养儿童的需求</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
								<div class="layui-form-item">
							<label class="layui-form-label lablesRight">5.有无身体或者心理疾病影响其给予被收养儿童适当的照顾</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
							<hr style="width: 80%;margin: 10px 0;">
						<div class="layui-form-item" style="margin-top: 30px;margin-bottom: 20px;">
							<div style="margin: 0 auto;width: 300px;">
								<button id="btn_save" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="btn_save" style="width: 200px;">保存</button>
								<button type="reset" class="layui-btn layui-btn-danger" style="padding:0 8px ;height: 30px;line-height: 30px;">重置</button>
							</div>
						</div>
					</form>

				</div>
				<!--main_content-->
			</div>
			<!--p_main_right-->
		</div>
		<!--p_main-->
		<footer>
			<p>慧评领养评估有限公司&nbsp;&nbsp;2017 ©<a href="###" target="_blank">wmuoldstar.cn</a></p>
			<p> Design by <i>weichang</i></p>
		</footer>
		<a href="javascript:;" id="to_top" title="top"></a><!--to_top-->
		<a href="javascript:;" class="save_btn" title="保存一下"></a>
		<script src="../plugins/layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
	
		<script type="text/javascript">
		layui.use('upload', function(){
			  var upload = layui.upload;
			  //执行实例
			  var uploadInst = upload.render({
			    elem: '#test-upload-change' //绑定元素
			    ,url: 'upload.do' //上传接口
			    ,method:'post'
			    ,accept:'file'
			    ,auto:false
			    ,bindAction: '#test-upload-change-action'
			    ,done: function(res){
			     	alert(res)
			    }
			    ,error: function(){
			     	alert(500)
			    }
			  });
			});
</script>
</body>
</html>