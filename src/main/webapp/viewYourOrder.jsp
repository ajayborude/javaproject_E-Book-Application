<%@page import="com.entities.BookOrderDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.databaseOperation.AllOrderBookRegardingOperation"%>
<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Orders Here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("warning-msg", "Please Login First");
	if (ud == null) {
		response.sendRedirect("loginUserMsg.jsp");
	}
	%>

	<div class="text-center">
		<h2>Your Order</h2>
	</div>




	<table class="table container table-striped">
		<thead class="bg-success text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Prize</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%

			List<BookOrderDetails> list = AllOrderBookRegardingOperation.viewMyOrder(ud.getEmail());

			for (BookOrderDetails bod : list) 
			{%>
			<tr>
				<th scope="row"><%=bod.getOrder_id() %></th>
				<td><%=bod.getUser_name() %></td>
				<td><%=bod.getBook_name() %></td>
				<td><%=bod.getAuthor() %></td>
				<td><%=bod.getPrice() %></td>
				<td><%=bod.getPayment_type() %></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>

</body>
</html>