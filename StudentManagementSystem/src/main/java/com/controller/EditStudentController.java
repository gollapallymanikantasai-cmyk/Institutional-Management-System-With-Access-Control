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

/**
 * Servlet implementation class EditStudentController
 */
@WebServlet("/EditStudentController")
public class EditStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email =request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("password");
		String marks=request.getParameter("marks");
		String course=request.getParameter("course");
		String state=request.getParameter("state");
		StudentModal sm=new StudentModal();
		sm.setUserName(userName);
		sm.setFirstName(firstName);
		sm.setLastName(lastName);
		sm.setEmail(email);
		sm.setMobile(mobile);
		sm.setPassword(password);
		sm.setMarks(marks);
		sm.setCourse(course);
		sm.setState(state);
		
		StudentDAO sd=new StudentDAO();
		String status=sd.updateStudent(sm);
		
		if(status.equals("success")) {
			System.out.println(status);
			RequestDispatcher rd=request.getRequestDispatcher("manageStudents.jsp");
			rd.forward(request, response);
		}else {
			System.out.println(status);
			RequestDispatcher rd=request.getRequestDispatcher("manageStudents.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
	}

}
