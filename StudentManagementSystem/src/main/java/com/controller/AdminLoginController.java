package com.controller;

import java.io.IOException;

import com.dao.AdminDAO;
import com.model.AdminModal;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminModal am=new AdminModal();
		AdminDAO adao=new AdminDAO();
		String userName=request.getParameter("userName");
		String password=request.getParameter("password");
		am.setUserName(userName);
		am.setPassword(password);
		AdminModal a=adao.selectData(am);
		if(a!=null){
			HttpSession session =request.getSession();
			session.setAttribute("admin", a);
			RequestDispatcher rd=request.getRequestDispatcher("adminDashboard.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("adminLogin.jsp");
			rd.forward(request, response);

		}
		
		
	}

}
