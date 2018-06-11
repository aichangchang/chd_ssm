<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="base" 
  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title></title>
		<!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
		<link rel="stylesheet" type="text/css" href="../admin/css/reset.css">
		<link rel="stylesheet" type="text/css" href="../admin/css/backstage.css">
		<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="location">
			当前位置:&nbsp;<a id="first" href="main.do">首页</a>&nbsp;&gt;&nbsp;<a>部门管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">部门列表</a>
		</div>
		<h3 class="biaoti">部门列表</h3>
		<div class="details">
                    <div class="details_operation clearfix">
                        <div class="bui_select">
                            <input type="button" value="添&nbsp;&nbsp;加" class="btn btn-primary" id="add"  onclick="addDepartment()">
                            <a	class="btn btn-success" href="listDepartment.do?page=${page.prePage}">上一页</a>
                			<a class="btn btn-success" href="listDepartment.do?page=${page.nextPage}">下一页</a>
                        </div>
                            
                    </div>
                    <!--表格-->
                    <table class="table table-hover" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th width="15%">编号</th>
                                <th width="25%">部门类别</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listDepartment}" var="departments">
			                <tr>
			                    <td><label class="label_id">${departments.id}</label></td>
                                <td>${departments.dname}</td>
                                <td align="center"><input type="button" value="修改" class="btn btn-success" id="edit" onclick="editDepartment(${departments.id})"><input type="button" value="删除" class="btn btn-danger" id="del" onclick="delDepartment(${departments.id})"></td>
                            </tr>
						 </c:forEach>
                        </tbody>
                    </table>
                </div>
<script type="text/javascript">
	function editDepartment(id){
		window.location="editDepartment.do?id="+id;
	}
	function delDepartment(id){
		if(window.confirm("您确定要删除吗？删除之后不能恢复哦！！！")){
			window.location="deleteDepartment.do?id="+id;
		}
	}
	function addDepartment(){
		window.location="addDepartment.do";
	}
</script>
	</body>
</html>