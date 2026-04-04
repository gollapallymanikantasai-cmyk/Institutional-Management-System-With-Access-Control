package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.StudentDAO;
import com.model.StudentModal;

/**
 * Servlet implementation class AddStudentController
 */
@WebServlet("/AddStudentController")
public class AddStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentDAO sdao = new StudentDAO();
		StudentModal sm = new StudentModal();

		String userName = request.getParameter("userName");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String course = request.getParameter("course");
		String state = request.getParameter("state");

		sm.setUserName(userName);
		sm.setFirstName(firstName);
		sm.setLastName(lastName);
		sm.setEmail(email);
		sm.setMobile(mobile);
		sm.setPassword(password);
		sm.setCourse(course);
		sm.setState(state);

		if (sdao.insertData(sm).equals("success")) {
//			request.setAttribute("success", "Student registered successfully!");
			RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			rd.forward(request, response);
		}

		else {
//            request.setAttribute("error", "Failed to register student!");
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
    		rd.forward(request, response);

		}

		
	}
}