<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上机考试系统</title>
<link href="../css/exam_login.css" rel="stylesheet" type="text/css"> 
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 40px;
}
</style>
</head>
<body>
	<div class="container">
		<ul id="main_nav" class="nav nav-pills">
			<li class="active"><a href="#student" data-toggle="tab">学生登录</a></li>
			<li><a href="#teacher" data-toggle="tab">教师登录</a></li>
			<li><a href="#admin" data-toggle="tab">管理员登录</a></li>
		</ul>
		<div id="myTabContent" class="tab-content" style="margin-top: 30px">
			<div class="tab-pane fade in active" id="student">
				<jsp:include page="student_login.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="teacher">
				<jsp:include page="teacher_login.jsp"></jsp:include>
			</div>
			<div class="tab-pane fade" id="admin">
				<jsp:include page="admin_login.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>