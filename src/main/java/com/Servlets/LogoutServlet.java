package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		session.getAttribute("user-obj");
		session.getAttribute("admin-obj");
		
		session.removeAttribute("user-obj");
		session.removeAttribute("admin-obj");
		
		session.setAttribute("war-msg","You Have Successfully Logout");
		response.sendRedirect("loginUser.jsp");
	}

}
