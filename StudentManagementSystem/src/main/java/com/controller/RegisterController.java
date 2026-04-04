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
 * Servlet implementation class LoginController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentDAO sdao = new StudentDAO();
		StudentModal sm = new StudentModal();

		String userName = request.getParameter("username");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
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
		
		if(sdao.insertData(sm).equals("success")){
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
			rd.forward(request, response);
		}

	}

}
