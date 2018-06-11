<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工列表</title>
<link rel="stylesheet" type="text/css" href="../admin/css/reset.css">
<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="location">
	当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>人事管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">员工列表</a>
</div>
<h3 class="biaoti">员工列表</h3>	
<div class="details">
    <div class="details_operation clearfix">
            <div class="bui_select">
                <input type="button" value="添&nbsp;&nbsp;加" class="btn btn-primary"  onclick="addEmployee()">
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
                    <th width="10%">员工账号</th>
                    <th width="10%">员工姓名</th>
                    <th width="10%">员工性别</th>
                    <th width="10%">工资</th>
                    <th width="15%">所属部门</th>
                    <th width="10%">权限级别</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${listEmployee}" var="Employee">
                <tr>
                    <td><label class="label_id">${Employee.id}</label></td>
                    <td>${Employee.username}</td>
                    <td><a href="detialEmployee.php?id=<?php echo $row['id']; ?>">${Employee.name}</a></td>
                    <td>${Employee.gender}</td>
                    <td>${Employee.salary}</td>
                     <td>
                     ${Employee.dname}
                     </td>
                     <td>
                     	暂无信息
                     </td>
                    <td align="center">
                    	<input type="button" value="修改" class="btn btn-success" onclick="editEmployee(${Employee.id})">
                    	<input type="button" value="删除" class="btn btn-danger"  onclick="delEmployee(${Employee.id})">
                    	<input type="button" value="详细信息" class="btn btn-info"  onclick="detialEmployee(<?php echo $row['id']; ?>)">
                    </td>
                </tr>
             </c:forEach>
             <a	class="btn btn-success" href="listEmployee.do?page=${page.prePage}">上一页</a>
             <a class="btn btn-success" href="listEmployee.do?page=${page.nextPage}">下一页</a>
            </tbody>
        </table>
        
    </div>
</body>
<script type="text/javascript">
console.log(${Employee.gender}+"!#!@#!#!@#!@#");
function addEmployee() {
	window.location = "addEmployee.php";
}

function editEmployee(id) {
	window.location = "editEmployee.do?id=" + id;
}

function delEmployee(id) {
	if(window.confirm("您确定要删除吗？,删除员工将会删除一切与其有关的信息（包括请假条）！")) {
		window.location = "deleteEmployee.do?id=" + id;
	}
}
function detialEmployee(id) {
	window.location = "detialEmployee.php?id=" + id;
}

function search(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var key = evt.keyCode ? evt.keyCode : evt.which;
	if(key == 13) {
		var val = document.getElementById("search").value;
		window.location = "listEmployee.php?keywords=" + val;
	}
}</script>
</html>