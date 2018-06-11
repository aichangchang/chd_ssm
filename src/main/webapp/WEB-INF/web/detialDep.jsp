<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>部门详情</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/backstage.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<div class="location">
	当前位置:&nbsp;<a id="first" href="main.php">首页</a>&nbsp;&gt;&nbsp;<a>部门管理</a>&nbsp;&gt;&nbsp;<a href="#" id="third">部门详情</a>
</div>
<h3 class="biaoti">部门详情</h3>
<div class="details">
    <div class="details_operation clearfix">
        <div class="fr">
        	 <div class="text">
                    <span>部门搜索</span>
                    <div class="bui_select">
                        <select id="" class="form-control" onchange="change(this.value)">
                        	<option value="">-请选择-</option>
                        </select>
                    </div>
                </div>
        	<div class="text">
                    <span>部门搜索</span>
                     <div class="bui_select">
                    	<input type="text" value="" class="form-control"  id="search" onkeypress="search(event)" >
                    </div>
            </div>
        </div>
    </div>   
        <!--表格-->
        <table class="table table-hover" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <th width="5%">编号</th>
                    <th width="10%">部门名称</th>
                    <th width="10%">员工账号</th>
                    <th width="10%">员工姓名</th>
                </tr>
            </thead>
            <tbody>
				<c:forEach items="${departments}" var="lists">
                <tr>
                    <td><label class="label_id">${lists.id}</label></td>
                    <td>${lists.dname}</td>
                    <td>${lists.username}</td>
                    <td><a href="detialEmployee.do?username=${lists.username}">${lists.uname}</a></td>
                </tr>
              </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<script type="text/javascript">
	//兼容火狐浏览器的keypress写法
	function search(evt){
		evt=(evt)?evt:((window.event)?window.event:"");
		var key=evt.keyCode?evt.keyCode:evt.which;
		if(key==13){
			var val=document.getElementById("search").value;
			window.location="detialDep.php?keywords="+val;
		}
	}
	function change(val){
		window.location="detialDep.php?keywords="+val;
	}
</script>
</html>