<%@page import="com.henu.utils.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.henu.utils.DbUtil,java.sql.*,java.util.*,com.henu.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上机考试系统</title>
</head>
<body>
	<%	String error=(String)session.getAttribute("pwderror");
	out.print(error);
	session.setAttribute("pwderror", "");
	%>
	<%
		request.setCharacterEncoding("utf-8");
		//查询所有教师信息
	
		List<Teacher> list=DaoFactory.getTeacherDaoInstance().search();
		StringBuffer sb = new StringBuffer();
		for(Teacher teacher:list)
		{
			sb.append("<tr><td>");
			sb.append(teacher.getT_username());
			sb.append("</td><td>");
			sb.append(teacher.getT_name());
			sb.append("</td><td>");
			if(teacher.getT_manager()){
				sb.append("<span class=\"glyphicon glyphicon-ok\"></span>");
			}else{
				sb.append("");
			}
			sb.append("</td><td>");
			//此处缺少href跳转
			sb.append("<a href='admin_editTeacher.jsp?edit_username="+teacher.getT_username()+"&edit_name="+teacher.getT_name()+"'><span class='glyphicon glyphicon-edit' title='编辑'></span></a>");
			sb.append("&nbsp&nbsp&nbsp");
			sb.append("<a href='../../admin_deleteTeacher?delete_username="+teacher.getT_username()+"'><span class='glyphicon glyphicon-trash' title='删除'></span></a>");
			sb.append("</td></tr>");
		}
	
	%>
	<jsp:include page="admin_head.jsp"></jsp:include>
	<div class="container">
		<div class="alert navbar-inverse"
			style="background-color: #eeeeee; margin-top: 20px">
			<strong style="margin-left: 20px; font-size: 18px">添加教师</strong>
			<form class="form-inline" role="form"
				style="margin-left: 20px; margin-top: 5px;" action="../../admin_addTeacher">
				<div class="form-group">
					<input type="text" class="form-control" style="width: 250px"
						placeholder="用户名*" name="username">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" style="width: 250px"
						placeholder="初始口令*" name="pwd">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" style="width: 250px"
						placeholder="真实姓名" name="name">
				</div>
				<div class="checkbox">
					<label style="font-size: 15px"> <input type="checkbox"
						name="manager">管理员
					</label>
				</div>
				<button type="submit" class="btn btn-info">添加</button>
			</form>
		</div>
		<table class="table table-bordered" style="margin-top: 10px">
			<tr>
				<th class="col-md-3">用户名</th>
				<th class="col-md-3">全名</th>
				<th class="col-md-3">是否为管理员</th>
				<th class="col-md-3"></th>
			</tr>
			<%=sb.toString()%>
		</table>
	</div>
</body>
</html>