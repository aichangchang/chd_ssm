<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户列表</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/backstage.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="location">
	当前位置:&nbsp;<a id="first" href="main.php">首页</a>&nbsp;&gt;&nbsp;<a>用户管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">用户列表</a>
</div>
<div class="details">
    <div class="details_operation clearfix">
            <div class="bui_select">
                <input type="button" value="添&nbsp;&nbsp;加" class="btn btn-primary"  onclick="addUsers()">
                		 <a	class="btn btn-success" href="listUsers.do?page=${page.prePage}">上一页</a>
                     <a  class="btn btn-success" href="listUsers.do?page=${page.nextPage}">下一页</a>
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
                    <th width="10%">用户账号</th>
                    <th width="10%">用户姓名</th>
                    <th width="5%">性别</th>
                    <th width="10%">领养儿童</th>
                    <th width="20%">评估</th>
                    <th width="10%">是否同意</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
              <c:forEach begin="0" step="1"  items="${listUsersInfo}" var="users">
                <tr>
                    <td><label class="label_id">${users.id}</label></td>
                    <td>${users.username}</td>
                    <td><a href="detialUsers.php?id=${users.id}">${users.name}</a></td>
                    <td>${users.gender}</td>
                    <td>${users.cname}</td>
               		<td><c:if test="${users.assess==null}">               	
						 暂无评估
               		</c:if>${users.assess}</td>
               		<td>${users.agree eq 1 ? "同意":"不同意" }</td>
                    <td align="left">
                    	<input type="button" value="详细信息" class="btn btn-info"  onclick="detialUsers(${users.id})">	
                    	<input type="button" value="修改资料" class="btn btn-success" onclick="editUsers(${users.id})">
                    	<input type="button" value="删除用户" class="btn btn-danger"  onclick="delUsers(${users.id})">
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
function addUsers() {
	window.location = "addUsers.do";
}

function editUsers(id) {
	window.location = "editUsers.do?id=" + id;
}

function delUsers(id) {
	if(window.confirm("您确定要删除吗？,删除用户将会删除一切与其有关的信息！")) {
		window.location = "deleteUser.do?id=" + id;
	}
}
function detialUsers(id) {
	window.location = "detialUsers.do?id=" + id;
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