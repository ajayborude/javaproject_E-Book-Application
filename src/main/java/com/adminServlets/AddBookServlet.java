package com.adminServlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.databaseOperation.AllBookRegardingOperation;
import com.entities.BookDetails;

@WebServlet("/AddBook")
@MultipartConfig
public class AddBookServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String book_name = request.getParameter("book name");
			String author = request.getParameter("author");
			double prize = Double.parseDouble(request.getParameter("prize"));
			String book_categories = request.getParameter("categories");
			String status = request.getParameter("status");
			Part part = request.getPart("img");
			String filename = part.getSubmittedFileName();

			BookDetails bd = new BookDetails();
			bd.setBookName(book_name);
			bd.setAuthor(author);
			bd.setPrice(prize);
			bd.setCategories(book_categories);
			bd.setStatus(status);
			bd.setPhoto(filename);
			bd.setUser_email("Admin");
			HttpSession session = request.getSession();

			int result = AllBookRegardingOperation.addbook(bd);

			if (result > 0) {
				session.setAttribute("reg-msg", "Book has been Successfully added.....");
				response.sendRedirect("Admin/addBook.jsp");
			} else {
				session.setAttribute("eror-msg", "Something wrong on Server.....");
				response.sendRedirect("Admin/addBook.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
