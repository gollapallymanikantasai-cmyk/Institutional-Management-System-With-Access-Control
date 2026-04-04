package com.controller;

import java.io.IOException;

import com.dao.AdminDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteStudentController
 */
@WebServlet("/DeleteStudentController")
public class DeleteStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("u");
		AdminDAO ad=new AdminDAO();
		String status=ad.deleteData(userName);
		if(status.equals("success")) {
			RequestDispatcher rd=request.getRequestDispatcher("manageStudents.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("manageStudents.jsp");
			rd.forward(request, response);
		}
		
	}

}
