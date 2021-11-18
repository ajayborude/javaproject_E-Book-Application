package com.adminServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.databaseOperation.AllBookRegardingOperation;
import com.entities.BookDetails;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String book_name = request.getParameter("book name");
			String author = request.getParameter("author");
			double prize = Double.parseDouble(request.getParameter("prize"));
			String book_categories = request.getParameter("categories");
			String status = request.getParameter("status");

			BookDetails bd = new BookDetails();
			bd.setBookid(id);
			bd.setBookName(book_name);
			bd.setAuthor(author);
			bd.setPrice(prize);
			bd.setCategories(book_categories);
			bd.setStatus(status);

			HttpSession session = request.getSession();

			int result = AllBookRegardingOperation.editBook(bd);

			if (result > 0) {
				session.setAttribute("update-msg", "Book has been Successfully Updated.....");
				response.sendRedirect("Admin/viewAllBooks.jsp");
			} else {
				session.setAttribute("eror-msg", "Something wrong on Server.....");
				response.sendRedirect("Admin/editBook.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
