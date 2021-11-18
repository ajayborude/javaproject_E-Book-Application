<%@page import="com.entities.UserDetails"%>
<%@page import="com.entities.BookDetails"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Book Here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
<link rel="stylesheet" href="../CSS/mystyle.css">
<link rel="stylesheet" href="../Admin/style.css">
</head>
<body style="background-color: powderblue;">

	<%@include file="navbarAdmin.jsp"%>

	<%
	UserDetails ud = (UserDetails) session.getAttribute("admin-obj");
	session.setAttribute("warning-msg", "You cannot Access this Page <br> You are not an Admin");
	if (ud == null) {
		response.sendRedirect("../loginUserMsg.jsp");
	}
	%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDetails bd = AllBookRegardingOperation.getBookById(id);
	%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-center text-white">
							<h4>
								<i class="fas fa-book fa-2x"></i><br> Edit Book
							</h4>
						</div>
					</div>
					<%
					String error_msg = (String) session.getAttribute("eror-msg");
					if (error_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=error_msg%></div>
					<%
					}
					session.removeAttribute("eror-msg");
					%>
					<div class="card-body">
						<form method="post" action="../UpdateBookServlet">

							<input type="text" name="id" value="<%=bd.getBookid()%>">

							<div class="form-group">
								<label for="exampleInputname">Book Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									name="book name" value="<%=bd.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputname">Author Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									value="<%=bd.getAuthor()%>" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Prize</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=bd.getPrice()%>"
									name="prize">
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Categories</label> <select
									class="form-control" name="categories"
									id="exampleFormControlSelect1">
									<option value="<%=bd.getCategories()%>"><%=bd.getCategories()%></option>
									<option value="new book">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Status</label> <select
									class="form-control" name="status"
									id="exampleFormControlSelect1">
									<option value="<%=bd.getStatus()%>"><%=bd.getStatus()%></option>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sticky-footer">
		<%@include file="../ComenElements/footer.jsp"%>
	</div>
</body>
</html>