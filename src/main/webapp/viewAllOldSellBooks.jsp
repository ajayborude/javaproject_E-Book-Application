<%@page import="com.entities.UserDetails"%>
<%@page import="com.entities.BookDetails"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Old Books Here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("warning-msg", "Please Login First to view All Old Book Available for Sell");
	if (ud == null) {
		response.sendRedirect("loginUserMsg.jsp");
	}
	%>



	<div class="text-center p-3">
		<h2>All Old Books</h2>
	</div>
	<%
	String update_msg = (String) session.getAttribute("update-msg");
	String error_msg = (String) session.getAttribute("eror-msg");
	if (update_msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=update_msg%></div>
	<%
	}
	if (error_msg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=error_msg%></div>
	<%
	}
	session.removeAttribute("update-msg");
	session.removeAttribute("eror-msg");
	%>
	<table class="container table table-striped">
		<thead class="bg-success text-white">
			<tr>
				
				<th scope="col">Book Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Prize</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>

		<tbody>

			<%
			String user_email=ud.getEmail();
			List<BookDetails> list = AllBookRegardingOperation.viewAllOldBooksAvailableForSell("Old Book" , user_email);
			for (BookDetails bd : list) {
			%>
			<tr>
				
				<td><img alt="" src="Book/<%=bd.getPhoto() %>"
					style="width: 40px; height: 60px;margin-left: 10px;"></td>
				<td><%=bd.getBookName() %></td>
				<td><%=bd.getAuthor() %></td>
				<td><%=bd.getPrice() %></td>
				<td><%=bd.getCategories() %></td>
				<td><%=bd.getStatus() %></td>
				<td><a href="DeleteUsersoldBook?user_email=<%=user_email %>&&bid=<%=bd.getBookid() %>"
					class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i>
						Delete</a></td>
			</tr>
			<%
			}
			%>




		</tbody>
	</table>

</body>
</html>