<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
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
					<img class="fl" src="images/logo.png" height="56" width="56" />
					<a class="logo_txt fl" href="index.html" title="首页">乐佰年智慧评估</a>
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
			<div class="p_main_left" id="p_main_left">
				<ul class="layui-nav layui-nav-tree" lay-filter="test" style="height: 100%;">
					<li class="layui-nav-item layui-this">
						<a href="javascript:;"anchor="jbxx">基本资料</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" anchor="jtyy">家庭情况与用药</a>
					</li>
					<li class="layui-nav-item">
						<a href="javascript:;" anchor="jbqk">疾病情况</a>
					</li>
				</ul>
			</div>
			<div class="p_main_right" id="p_main_right">
				<div class="main_right_title">
					<h1 id="jbxx">基本信息</h1>
				</div>
				<hr style="width: 80%;margin: 10px 0;">
				<div class="main_content">
					<form class="layui-form" id="basicdata" action="doUserAction.php?act=save_pi&id=1" method="post" enctype="multipart/form-data">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-inline">
								<input type="text" name="username" id="username" autocomplete="off" class="layui-input" disabled>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" for="realname">姓名</label>
							<div class="layui-input-inline">
								<input type="text" name="realname" id="realname" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
							</div>
						</div>
						<!--出生日期-->
						<div class="layui-form-item">
							<label class="layui-form-label">出生日期</label>
							<div class="layui-input-inline">
								<input class="layui-input" placeholder="点击选择" name="birth" id="birth" onclick="layui.laydate({elem: this, festival: true})">
							</div>
						</div>
						<!--家庭地址-->
						<div class="layui-form-item">
							<label class="layui-form-label">家庭地址</label>
							<div class="layui-input-inline">
								<select name="province" id="province" lay-filter="province" lay-search="">
									<option value="">请选择省</option>
								</select>
							</div>
							<div class="layui-input-inline" lay-search="">
								<select name="city" id="city" lay-filter="city">
									<option value="">请选择市</option>
								</select>
							</div>
							<div class="layui-input-inline" lay-search="">
								<select name="area" id="area" lay-filter="area">
									<option value="">请选择县/区</option>
								</select>
							</div>
						</div>
						<!--详细地址-->
						<div class="layui-form-item">
							<label class="layui-form-label">详细地址</label>
							<div class="layui-input-block" style="width: 80%;">
								<input type="text" name="address" id="address" lay-verify="title" autocomplete="off" placeholder="请输入详细地址" class="layui-input">
							</div>
						</div>
						<!--性别-->
						<div class="layui-form-item">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block">
								<input type="radio" name="sex" value="1" title="男" checked>
								<input type="radio" name="sex" value="2" title="女">
								<input type="radio" name="sex" value="3" title="保密" disabled>
							</div>
						</div>
						<!--单行选择框-->
						<div class="layui-form-item">
							<label class="layui-form-label">文化程度</label>
							<div class="layui-input-inline">
								<select name="educational_level" id="educational_level" lay-filter="educational_level">
									<option value=""></option>
									<option value="0">小学</option>
									<option value="1">初中</option>
									<option value="2">中职</option>
									<option value="3">高中</option>
									<option value="4">专科</option>
									<option value="5">本科</option>
									<option value="6">硕士</option>
									<option value="7">博士</option>
								</select>
							</div>
						</div>
						<!--目前工作情况-->
						<div class="layui-form-item">
							<label class="layui-form-label">目前工作情况</label>
							<div class="layui-input-inline">
								<input type="checkbox" name="work" id="work" lay-skin="switch" lay-filter="work" lay-text="在职|退休" value="0">
							</div>
							<!--医保形式-->
							<label class="layui-form-label">医保形式</label>
							<div class="layui-input-inline">
								<select name="care_form" id="care_form" lay-filter="care_form">
									<option value=""></option>
									<option value="0">自费</option>
									<option value="1">农保</option>
									<option value="2">市级医保</option>
									<option value="3">省级医保</option>
									<option value="4">市级离休</option>
									<option value="5">省级离休</option>
									<option value="6">重保</option>
								</select>
							</div>
						</div>
						<!--身份证-->
						<div class="layui-form-item">
							<label class="layui-form-label">身份证</label>
							<div class="layui-input-inline">
								<input type="text" name="id_card" id="id_card"  placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<!--身份证-->
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">手机号码</label>
								<div class="layui-input-inline">
									<input type="tel" name="phone_num" id="phone_num" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">电话号码</label>
								<div class="layui-input-inline">
									<input type="text" name="tel_num" id="tel_num" autocomplete="off" class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">身高</label>
								<div class="layui-input-inline" style="width: 100px;">
									<input type="text" name="height" id="height" placeholder="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">m</p>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">体重</label>
								<div class="layui-input-inline" style="width: 100px;">
									<input type="text" name="weight" id="weight" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">kg</p>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label" style="width: 120px;">BMI（体重指数）</label>
								<div class="layui-input-inline" style="width: 100px;">
									<input type="text" name="bmi" id="bmi" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">kg/m²</p>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">是否住院</label>
							<div class="layui-input-inline" style="width: 100px;">
								<input type="checkbox" name="is_hospital" id="is_hospital" lay-skin="switch" lay-filter="is_hospital" lay-text="是|否" value="1" checked>
							</div>
							<div class="hospital_detial">
								<!--用来显示隐藏整个div-->
								<div class="layui-inline">
									<label class="layui-form-label" style="width: 42px;">住院号</label>
									<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
										<input type="text" name="hospital_num" id="hospital_num" placeholder="" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label" style="width: 42px;">科室</label>
									<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
										<input type="text" name="hospital_department" id="hospital_department" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label" style="width: 42px;">床号</label>
									<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
										<input type="text" name="hospital_bed" id="hospital_bed" autocomplete="off" class="layui-input">
									</div>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label" style="width: 42px;">病员号</label>
									<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
										<input type="text" name="patient_num" id="patient_num" autocomplete="off" class="layui-input">
									</div>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">是否吸烟</label>
							<div class="layui-input-inline" style="width: 100px;">
								<input type="checkbox" name="is_smoke" id="is_smoke" lay-skin="switch" lay-filter="is_smoke" lay-text="是|否" value="1" checked>
							</div>
							<div class="smoke_detial">
								<div class="layui-inline">
									<div class="layui-input-inline" style="width: 70px;">
										<input type="text" name="smoke_count" id="smoke_count" autocomplete="off" class="layui-input">
									</div>
									<p class="unit fl">支/天×&nbsp;</p>
									<div class="layui-input-inline" style="width: 70px;">
										<input type="text" name="smoke_time" id="smoke_time" autocomplete="off" class="layui-input">
									</div>
									<p class="unit fl">年</p>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label" style="width: 100px;">若已戒烟，戒了</label>
									<div class="layui-input-inline" style="width: 70px;">
										<input type="text" name="nosmoke_time" id="nosmoke_time" autocomplete="off" class="layui-input">
									</div>
									<p class="unit fl">年</p>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">是否喝酒</label>
							<div class="layui-input-inline" style="width: 100px;">
								<input type="checkbox" name="is_drink" id="is_drink" lay-skin="switch" lay-filter="is_drink" lay-text="是|否" value="1" checked>
							</div>
							<div class="drink_detial">
								<div class="layui-inline">
									<div class="layui-input-inline" style="width: 70px;">
										<input type="text" name="drink_count" id="drink_count" autocomplete="off" class="layui-input">
									</div>
									<p class="unit fl">两/天×&nbsp;</p>
									<div class="layui-input-inline" style="width: 70px;">
										<input type="text" name="drink_time" id="drink_time" autocomplete="off" class="layui-input">
									</div>
									<p class="unit fl">年</p>
								</div>
								<div class="layui-inline">
									<label class="layui-form-label" style="width: 100px;">若已戒酒，戒了</label>
									<div class="layui-input-inline" style="width: 70px;">
										<input type="text" name="nodrink_time" id="nodrink_time" autocomplete="off" class="layui-input">
									</div>
									<p class="unit fl">年</p>
								</div>
							</div>
						</div>
						<div class="main_right_title">
							<h1 id="jtyy">家庭情况与用药</h1>
						</div>
						<hr style="width: 80%;margin: 10px 0;">
						<div class="layui-form-item">
							<label class="layui-form-label">婚烟状况</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">未婚</option>
									<option value="1">已婚</option>
									<option value="2">离异</option>
									<option value="3">丧偶</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">长期住所</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">家里</option>
									<option value="1">医院</option>
									<option value="2">养老院</option>
									<option value="3">子女家</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">是否空巢</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">宗教信仰</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">无</option>
									<option value="1">有</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">育有子女</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">无</option>
									<option value="1">有</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">照料者</label>
							<div class="layui-input-block">
								<input type="checkbox" name="" title="自己" id="" value="" />
								<input type="checkbox" name="" title="配偶" id="" value="" />
								<input type="checkbox" name="" title="子女" id="" value="" />
								<input type="checkbox" name="" title="保姆" id="" value="" />
								<input type="checkbox" name="" title="其他" id="" value="" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">是否多重用药（≥5种）</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">无</option>
									<option value="1">有</option>
								</select>
							</div>
						</div>
						<div class="main_right_title">
							<h1 id="jbqk">疾病情况</h1>
						</div>
						<hr style="width: 80%;margin: 10px 0;">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">听力（左）</label>
								<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
									<input type="text" name="hospital_num" id="hospital_num" placeholder="" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label"">听力（右）</label>
								<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
									<input type="text" name="hospital_department" id="hospital_department" autocomplete="off" class="layui-input">
								</div>
							</div>
							<label class="layui-form-label">主诉听力</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">不正常</option>
									<option value="1">正常</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">视力（左）</label>
								<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
									<input type="text" name="hospital_num" id="hospital_num" placeholder="" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label"">视力（右）</label>
								<div class="layui-input-inline" style="width: 70px; margin-right: 0;">
									<input type="text" name="hospital_department" id="hospital_department" autocomplete="off" class="layui-input">
								</div>
							</div>
							<label class="layui-form-label">主诉视力</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">不正常</option>
									<option value="1">正常</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">配镜</label>
							<div class="layui-input-block">
								<input type="checkbox" name="" title="近视镜" id="" value="" />
								<input type="checkbox" name="" title="老花镜" id="" value="" />
								<input type="checkbox" name="" title="散光镜" id="" value="" />
								<input type="checkbox" name="" title="放大镜" id="" value="" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">假牙</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">进食</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">无影响</option>
									<option value="1">有影响</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">睡眠情况</label>
							<div class="layui-input-inline">
								<select name="" id="" lay-filter="">
									<option value=""></option>
									<option value="0">差</option>
									<option value="1">一般</option>
									<option value="2">好</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">高血压</label>
							<div class="layui-input-inline" style="width: 100px;">
								<input type="checkbox" name="is_HBP" id="is_HBP" lay-skin="switch" lay-filter="is_HBP" lay-text="是|否" value="1" checked>
							</div>
						</div>	
						<div class="HBP_detial">
							<div class="layui-form-item">
								<label class="layui-form-label">高血压病程</label>
								<div class="layui-input-inline">
									<input type="text" name="id_card" id="id_card"  placeholder="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">年&nbsp;</p>
								<label class="layui-form-label">最高血压</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">目前血压</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
								<label class="layui-form-label">卧位血压</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">直立即刻</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
								<label class="layui-form-label">直立1分钟</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">直立3分钟</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
								<label class="layui-form-label">直立5分钟</label>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">/&nbsp;</p>
								<div class="layui-input-inline" style="width: 70px;">
									<input type="text" name="" id="" autocomplete="off" class="layui-input">
								</div>
								<p class="unit fl">mmHg</p>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">体位性低血压</label>
								<div class="layui-input-inline">
									<select name="" id="" lay-filter="">
										<option value=""></option>
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</div>
								<label class="layui-form-label">体位性高血压</label>
								<div class="layui-input-inline">
									<select name="" id="" lay-filter="">
										<option value=""></option>
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">目前疾病诊断</label>
							<div class="layui-input-block">
								 <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
							</div>
						</div>
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
			<p>乐佰年智慧评估有限公司&nbsp;&nbsp;2017 ©<a href="http://www.wmuoldstar.cn" target="_blank">wmuoldstar.cn</a></p>
			<p> Design by <i>HeGuoFeng</i></p>
		</footer>
		<a href="javascript:;" id="to_top" title="top"></a><!--to_top-->
		<a href="javascript:;" class="save_btn" title="保存一下"></a>
	</body>

</html>