package com.controller;

import java.io.IOException;

import com.dao.StudentDAO;
import com.model.StudentModal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentLoginController
 */
@WebServlet("/StudentLoginController")
public class StudentLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		StudentModal sm=new StudentModal();
		sm.setUserName(userName);
		sm.setPassword(password);
		StudentDAO sdao =new StudentDAO();
		StudentModal e=sdao.selectData(sm);
//		System.out.println(s);
		if(e!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("s", e);
			RequestDispatcher rd=request.getRequestDispatcher("studentDashboard.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("error", "invalid email or password");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);

		}
	}
}
