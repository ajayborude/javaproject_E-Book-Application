package com.Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.databaseOperation.AllCartRegardingOperation;
import com.databaseOperation.AllOrderBookRegardingOperation;
import com.entities.BookOrderDetails;
import com.entities.CartDetails;

@WebServlet("/OrderBookServlet")
public class OrderBookServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		String address=request.getParameter("address");
		String landmark=request.getParameter("land");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String pin=request.getParameter("pin");
		String payment_type=request.getParameter("payment_type");
		
		String full_address= address+","+landmark+","+city+","+state+","+pin;
		
		HttpSession session=request.getSession();
		
		List<CartDetails> list=AllCartRegardingOperation.viewBooksFromCartByUser(id);
		
		Random rd = new Random();
		BookOrderDetails bod=null;
		
		ArrayList<BookOrderDetails> order_list=new ArrayList<BookOrderDetails>();
		for(CartDetails cd:list)
		{
			bod= new BookOrderDetails();
			bod.setOrder_id("BOOK-ORD-00"+ rd.nextInt(1000));
			bod.setUser_name(name);
			bod.setEmail(email);
			bod.setFull_address(full_address);
			bod.setPhone(phone);
			bod.setBook_name(cd.getBookname());
			bod.setAuthor(cd.getAuthour());
			bod.setPrice(cd.getPrice()+"");
			bod.setPayment_type(payment_type);
			order_list.add(bod);
		
		}
		
		
		if("noselect".equals(payment_type))
		{
			session.setAttribute("sel-msg", "Please Select Payment Method to Order Book");
			response.sendRedirect("yourCart.jsp");
		}
		else 
		{	
			boolean f=AllOrderBookRegardingOperation.saveOrder(order_list);
			if (f)
			{
				response.sendRedirect("orderSuccess.jsp");
			}
			else
			{
				session.setAttribute("eror1-msg", "Something Wrong On Server...");
				response.sendRedirect("yourCart.jsp");
			}
		}
	
	}

}
