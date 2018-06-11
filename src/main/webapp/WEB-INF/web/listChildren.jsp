<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>儿童列表</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>儿童管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">儿童列表</a>
</div>
<div class="details">
    <div class="details_operation clearfix">
            <div class="bui_select">
                <input type="button" value="添&nbsp;&nbsp;加" class="btn btn-primary"  onclick="addChildren()">
                <a	class="btn btn-success" href="listChildren.do?page=${page.prePage}">上一页</a>
                <a class="btn btn-success" href="listChildren.do?page=${page.nextPage}">下一页</a>
            </div>    
        <div class="fr">
        	<div class="text">
				<span>姓名搜索</span>
                <div class="bui_select">
                	<input type="text" value="" class="form-control"  id="search" onkeypress="search(event)" >
                </div>
           </div>
        </div>
    </div>   
        <!--表格-->
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
                    	<input type="button" value="详细信息" class="btn btn-info"  onclick="detialChildren(${children.id})">	
                    	<input type="button" value="修改资料" class="btn btn-success" onclick="editChildren(${children.id})">
                    	<input type="button" value="删除信息" class="btn btn-danger"  onclick="delChildren(${children.id})">
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
        
    </div>
</body>
<script type="text/javascript">
function addChildren() {
	window.location = "addChildren.do";
}

function editChildren(id) {
	window.location = "editChildren.do?id=" + id;
}

function delChildren(id) {
	if(window.confirm("您确定要删除吗？,删除用户将会删除一切与其有关的信息！")) {
		window.location = "deleteChildren.do?id=" + id;
	}
}
function detialChildren(id) {
	window.location = "detialChildren.do?id=" + id;
}
function checkIn(id){
	window.location = "checkIn.php?id=" + id;
}
function changeBed(id){
	window.location = "changeBed.php?id=" + id;
}
function checkOut(id){
	if(window.confirm("您确定要退房吗？")) {
		window.location = "doAdminAction.php?act=checkOut&id=" + id;
	}
}
function search(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	if(key == 13) {
		var val = document.getElementById("search").value;
		window.location = "listUsers.php?keywords=" + val;
	}
}</script>
</html>