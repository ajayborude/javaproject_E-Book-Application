package com.adminServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllBookRegardingOperation;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id=Integer.parseInt(request.getParameter("id"));
		HttpSession session=request.getSession();
		int result=AllBookRegardingOperation.deleteBook(id);
		
		if (result > 0) 
		{
			session.setAttribute("update-msg", "Book has been Successfully Deleted.....");
			response.sendRedirect("Admin/viewAllBooks.jsp");
		} 
		else 
		{
			session.setAttribute("update-msg", "Something wrong on Server.....");
			response.sendRedirect("Admin/viewAllBooks.jsp");
		}
	}

}
