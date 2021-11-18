<%@page import="java.util.List"%>
<%@page import="com.entities.BookOrderDetails"%>
<%@page import="com.databaseOperation.AllOrderBookRegardingOperation"%>
<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Orders Here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
<link rel="stylesheet" href="../CSS/mystyle.css">
<link rel="stylesheet" href="../Admin/style.css">
</head>
<body style="background-color:;">



	<%@include file="navbarAdmin.jsp"%>

	<%
	UserDetails ud = (UserDetails) session.getAttribute("admin-obj");
	session.setAttribute("warning-msg", "You cannot Access this Page <br> You are not an Admin");
	if (ud == null) {
		response.sendRedirect("../loginUserMsg.jsp");
	}
	%>

	<div class="text-center">
		<h2>all orders</h2>
	</div>
	<table class="table table-striped">
		<thead class="bg-success text-white">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Prize</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>



			<%
			List<BookOrderDetails> list = AllOrderBookRegardingOperation.viewAllOrderByAdmin();

			for (BookOrderDetails bod : list) {
			%>
			<tr>
				<th scope="row"><%=bod.getId() %></th>
				<th><%=bod.getOrder_id() %></th>
				<td><%=bod.getUser_name()%></td>
				<td><%=bod.getEmail() %></td>
				<td><%=bod.getFull_address() %></td>
				<td><%=bod.getPhone() %></td>
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