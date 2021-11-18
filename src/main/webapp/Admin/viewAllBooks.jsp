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
<title>View All Book Here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
<link rel="stylesheet" href="../CSS/mystyle.css">
<link rel="stylesheet" href="../Admin/style.css">
</head>

<body style="background-color: white;">

	<%@include file="navbarAdmin.jsp"%>

	<%
	UserDetails ud = (UserDetails) session.getAttribute("admin-obj");
	session.setAttribute("warning-msg", "You cannot Access this Page <br> You are not an Admin");
	if (ud == null) {
		response.sendRedirect("../loginUserMsg.jsp");
	}
	%>

	<div class="text-center p-3">
		<h2>All Books</h2>
	</div>
	<%
	String update_msg = (String) session.getAttribute("update-msg");
	if (update_msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=update_msg%></div>
	<%
	}
	session.removeAttribute("update-msg");
	%>
	<table class="table table-striped">
		<thead class="bg-success text-white">
			<tr>
				<th scope="col">Id</th>
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
			List<BookDetails> list = AllBookRegardingOperation.viewAllBooks();
			for (BookDetails bd : list) {
			%>

			<tr>
				<th scope="row"><%=bd.getBookid()%></th>
				<td><img alt="" src="../Book/<%=bd.getPhoto()%>"
					style="width: 40px; height: 60px"></td>
				<td class="mt-2"><%=bd.getBookName()%></td>
				<td><%=bd.getAuthor()%></td>
				<td><%=bd.getPrice()%></td>
				<td><%=bd.getCategories()%></td>
				<td><%=bd.getStatus()%></td>
				<td><a href="editBook.jsp?id=<%=bd.getBookid()%>"
					class="btn btn-success btn-sm"><i class="fas fa-edit"></i> Edit</a>
					<a href="../DeleteBookServlet?id=<%=bd.getBookid()%>"
					class="btn btn-danger btn-sm ml-2"><i class="fas fa-trash-alt"></i>
						Delete</a></td>
			</tr>


			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>