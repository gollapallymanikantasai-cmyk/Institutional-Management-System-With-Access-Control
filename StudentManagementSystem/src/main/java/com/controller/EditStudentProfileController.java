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
 * Servlet implementation class EditStudentProfileController
 */
@WebServlet("/EditStudentProfileController")
public class EditStudentProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String course = request.getParameter("course");
		String state = request.getParameter("state");
		String marks=request.getParameter("marks");
		StudentModal sm = new StudentModal();
		sm.setUserName(userName);
		sm.setFirstName(firstName);
		sm.setLastName(lastName);
		sm.setEmail(email);
		sm.setMobile(mobile);
		sm.setMarks(state);
		sm.setPassword(password);
		sm.setCourse(course);
		sm.setState(state);
        sm.setMarks(marks);
		StudentDAO sd = new StudentDAO();
		String status = sd.updateStudent(sm);

		if (status.equals("success")) {
			System.out.println(status);
			StudentModal updatedStudent = sd.SelectByUserName(sm.getUserName());
			HttpSession session = request.getSession();
			session.setAttribute("s", updatedStudent);
			RequestDispatcher rd = request.getRequestDispatcher("studentProfile.jsp?s=" + sm.getUserName());
			rd.forward(request, response);
		} else {
			System.out.println(status);
			RequestDispatcher rd = request.getRequestDispatcher("editStudentProfile.jsp");
			rd.forward(request, response);
		}

	}

}
