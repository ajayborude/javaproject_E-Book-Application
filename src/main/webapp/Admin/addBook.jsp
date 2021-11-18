<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Book Here</title>
<%@include file="../CSS/allCssLinks.jsp"%>
<link rel="stylesheet" href="../CSS/mystyle.css">
<link rel="stylesheet" href="../Admin/style.css">
</head>
<body style="background-color: powderblue;">

	<%@include file="navbarAdmin.jsp"%>
<%
UserDetails ud=(UserDetails)session.getAttribute("admin-obj");
session.setAttribute("warning-msg", "You cannot Access this Page <br> You are not an Admin");
if(ud==null)
{
	response.sendRedirect("../loginUserMsg.jsp");
}
%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-center text-white">
							<h4>
								<i class="fas fa-book fa-2x"></i><br> Add Book
							</h4>
						</div>
					</div>
					<%
					String reg_msg = (String) session.getAttribute("reg-msg");
					String error_msg = (String) session.getAttribute("eror-msg");

					if (reg_msg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=reg_msg%></div>
					<%
					}
					if (error_msg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=error_msg%></div>
					<%
					}
					session.removeAttribute("reg-msg");
					session.removeAttribute("eror-msg");
					%>
					<div class="card-body">
						<form method="post" action="../AddBook"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputname">Book Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									name="book name">
							</div>
							<div class="form-group">
								<label for="exampleInputname">Author Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Prize</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="prize">
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Categories</label> <select
									class="form-control" name="categories"
									id="exampleFormControlSelect1">
									<option>--select--</option>
									<option>New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Status</label> <select
									class="form-control" name="status"
									id="exampleFormControlSelect1">
									<option>--select--</option>
									<option>Active</option>
									<option>Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Upload Photo</label> <input
									type="file" class="form-control-file" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="img">
							</div>

							<button type="submit" class="btn btn-primary">Add
								Book...</button>
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