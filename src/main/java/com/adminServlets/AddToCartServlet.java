package com.adminServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllBookRegardingOperation;
import com.databaseOperation.AllCartRegardingOperation;
import com.entities.BookDetails;
import com.entities.CartDetails;

@WebServlet("/AddToCart")
public class AddToCartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int user_id = Integer.parseInt(request.getParameter("uid"));
		int book_id = Integer.parseInt(request.getParameter("bid"));

		BookDetails bd = new BookDetails();
		bd = AllBookRegardingOperation.getBookById(book_id);

		CartDetails cd = new CartDetails();
		cd.setUser_id(user_id);
		cd.setBook_id(book_id);
		cd.setBookname(bd.getBookName());
		cd.setAuthour(bd.getAuthor());
		cd.setPrice(bd.getPrice());
		cd.setTotal_price(bd.getPrice());

		HttpSession session = request.getSession();

		int result = AllCartRegardingOperation.addToCart(cd);
		if (result > 0) {
			session.setAttribute("eror-msg", "Something Wrong On Server...");
			response.sendRedirect("viewAllNewBooks.jsp");
		} else {
			session.setAttribute("suc-msg", "Book has been Successfully Added into Cart....");
			response.sendRedirect("viewAllNewBooks.jsp");
		}
	}

}