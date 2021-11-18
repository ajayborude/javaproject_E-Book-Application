package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllUserRegardingOperation;
import com.entities.UserDetails;

@WebServlet("/LoginUserServlet")
public class LoginUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		UserDetails ud;
		
		HttpSession session=request.getSession();
		
		if (email.equals("ajay@yahoo.com") && pass.equals("0000")) 
		{
			ud=new UserDetails();
			response.sendRedirect("Admin/adminHome.jsp");
			session.setAttribute("admin-obj", ud);
		}
		else
		{
			ud=AllUserRegardingOperation.getLoginUser(email, pass);
			if (ud!=null)
			{
				response.sendRedirect("index.jsp");
				session.setAttribute("user-obj", ud);
			}
			else 
			{
				session.setAttribute("war-msg", "Invalid Email or Password");
				response.sendRedirect("loginUser.jsp");
			}
		}
	}

}
