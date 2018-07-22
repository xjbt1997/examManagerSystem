<%@page import="com.henu.utils.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.henu.utils.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上机考试系统</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		String stu_name = (String) session.getAttribute("stu_name");
		String examname=DaoFactory.getStudentDaoInstance().search(stu_name).getStu_exam();
		
	%>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-collapse collapse">
		<div class="container">
			<ul class="nav navbar-nav">
				<li style="font-size: 18px; text-color: #ffffff;"><a>上机考试系统</a></li>
				<li><a href="student_about.jsp"><span
						class="glyphicon glyphicon-home"></span>首页</a></li>
				<li><a href="student_submit.jsp"><span
						class="glyphicon glyphicon-eye-open"></span>查看提交</a></li>
			</ul>
			<ul class="nav navbar-nav" style="float: right">
				<li><a><span class="glyphicon glyphicon-user"></span>欢迎您,<%=stu_name%></a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container" style="margin-top: 50px;">
		<h1>
			<img src="../../image/exam-student.png" /><%=stu_name%>,上机考试中...
		</h1>
	</div>
</body>
</html>