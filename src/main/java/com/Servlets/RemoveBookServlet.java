package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllCartRegardingOperation;

@WebServlet("/RemoveBookServlet")
public class RemoveBookServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int cart_id=Integer.parseInt(request.getParameter("id"));
		int user_id=Integer.parseInt(request.getParameter("uid"));
		int book_id=Integer.parseInt(request.getParameter("bid"));
		
		HttpSession session=request.getSession();
		int result=AllCartRegardingOperation.removeBookFromservlet(cart_id, user_id, book_id);
		
		if (result < 0) {
			session.setAttribute("eror-msg", "Something Wrong on Server.....");
			response.sendRedirect("yourCart.jsp");
		} else {
			session.setAttribute("reg-msg", "Items has been Successfully remove from Cart.....");
			response.sendRedirect("yourCart.jsp");
		}
		
		
	}

}
