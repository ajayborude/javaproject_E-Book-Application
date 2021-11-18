package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllBookRegardingOperation;

@WebServlet("/DeleteUsersoldBook")
public class DeleteUsersoldBook extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int bid=Integer.parseInt(request.getParameter("bid"));
			String user_email = request.getParameter("user_email");
			HttpSession session = request.getSession();
			int result = AllBookRegardingOperation.deleteUsersOldBook(bid, "Old Book", user_email)   ;

			if (result > 0) {
				session.setAttribute("update-msg", "Book has been Successfully Deleted.....");
				response.sendRedirect("viewAllOldSellBooks.jsp");
			} else {
				session.setAttribute("eror-msg", "Something wrong on Server.....");
				response.sendRedirect("viewAllOldSellBooks.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
