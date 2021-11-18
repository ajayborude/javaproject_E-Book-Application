package com.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.databaseOperation.AllUserRegardingOperation;
import com.entities.UserDetails;

@WebServlet("/registerUserServlet")
@MultipartConfig
public class registerUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		Part part=request.getPart("profile_picture");
		String fileName=part.getSubmittedFileName();
		
		String cheack=request.getParameter("check");
		
		UserDetails ud = new UserDetails();
		ud.setName(name);
		ud.setPhone(phone);
		ud.setEmail(email);
		ud.setPassword(pass);
		ud.setPrifle_picture(fileName);
		
		HttpSession session=request.getSession();
		
		
		
		if (cheack != null) 
		{
			int result=AllUserRegardingOperation.registerUser(ud);
			if (result>0) 
			{
				session.setAttribute("reg-msg", "You Have Successfully Register");
				response.sendRedirect("registerUser.jsp");
			}
			else
			{
				session.setAttribute("eror-msg", "Sorry Something Wrong on Server");
				response.sendRedirect("registerUser.jsp");
			}
		}
		else 
		{
			session.setAttribute("check-msg", "Please Agree Terms and conditions to Register a Profile");
			response.sendRedirect("registerUser.jsp");
		}
	}

}
