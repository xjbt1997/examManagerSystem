package com.henu.teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.henu.bean.Student;
import com.henu.utils.DaoFactory;
import com.henu.utils.DbUtil;
import com.henu.utils.GetDataFromExcel;

/**
 * Servlet implementation class ImportStuFromExcel
 */
@WebServlet("/ImportStuFromExcel")
public class ImportStuFromExcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImportStuFromExcel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String path = request.getParameter("file");
		HttpSession session=request.getSession();
		String examname = (String) session.getAttribute("examname");
		List<Student> list = GetDataFromExcel.getAllByExcel(null);
		String insert = "insert into student (stu_id,stu_name,stu_class) values(?,?,?)";
		try {
			for(Student student : list){
				if(!GetDataFromExcel.isExist(student.getStu_id())){
					student.setStu_exam(examname);
					DaoFactory.getStudentDaoInstance().add(student);
				}else{
					continue;
				}
			}
			PrintWriter out = response.getWriter();
			out.print("<script>alert('导入成功!'); window.location.href='FenYe?exam="+examname+"'</script>");
			DbUtil.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
