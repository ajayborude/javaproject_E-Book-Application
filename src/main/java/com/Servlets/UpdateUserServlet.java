package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.databaseOperation.AllUserRegardingOperation;
import com.entities.UserDetails;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		
		UserDetails ud = new UserDetails();
		ud.setId(uid);
		ud.setName(name);
		ud.setPhone(phone);
		ud.setEmail(email);
		ud.setPassword(pass);
		
		HttpSession session=request.getSession();
		
			int result=AllUserRegardingOperation.updateUser(ud);
			if (result>0) 
			{
				session.setAttribute("updt-msg", "Your Profile Updated Successfully<br>Please login again to view Updated Profile");
				response.sendRedirect("updateProfile.jsp");
			}
			else
			{
				session.setAttribute("eror-msg", "Sorry Something Wrong on Server");
				response.sendRedirect("updateProfile.jsp");
			}
		
	    }
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
