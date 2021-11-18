<%@page import="com.entities.BookDetails"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book Details here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>
</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDetails bd = AllBookRegardingOperation.getBookById(id);
	%>

	<!-- =================== Book Details============================ -->
	<div style="background-color: #efefef; padding-bottom: 25px">
		<input type="hidden" name="id" value="<%=bd.getBookid()%>">
		<div class="container">
			<h2>book details</h2>
			<div class="row">
				<div class="col-lg-6 offset-3">
					<div class="card">
						<div class="card-body">
							<div class="book-img1 text-center">
								<img class="book-img" src="Book/<%=bd.getPhoto()%>">
							</div>
							<div class="container mt-2 text-center">
								<h6 style="font-size: 18px; margin-bottom: 10px;">
									book name:
									<%=bd.getBookName()%></h6>
								<h6 style="font-size: 18px; margin-bottom: 10px;">
									authour name:
									<%=bd.getAuthor()%></h6>
								<h6 style="font-size: 18px; margin-bottom: 10px;">
									category:
									<%=bd.getCategories()%></h6>
								<h6 style="font-size: 18px; margin-bottom: 10px;">
									prize:
									<%=bd.getPrice()%>
									<i class="fa fa-rupee text-success"></i>
								</h6>

							</div>
						</div>
						<div class="card-footer text-danger">
							<div class="container-fluid">
								<div class="row my-3">
									<div class="col-lg-4 text-center icon ">
										<i class="fas fa-money-bill-wave fa-2x mb-2"></i>
										<h6
											style="font-size: 15px; font-weight: bold; text-transform: capitalize;">cash
											on delivery available</h6>
									</div>
									<div class="col-lg-4 text-center">
										<i class="fas fa-undo-alt fa-2x mb-2"></i>
										<h6
											style="font-size: 15px; font-weight: bold; text-transform: capitalize;">return
											available</h6>
									</div>
									<div class="col-lg-4 text-center">
										<i class="fas fa-truck fa-2x mb-2"></i>
										<h6
											style="font-size: 15px; font-weight: bold; text-transform: capitalize;">free
											delivery available</h6>
									</div>
								</div>
							</div>
						</div>

						<%
						if (bd.getCategories().equals("New Book")) {
						%>
						<div class="card-footer text-center">
							<%
							session.setAttribute("warning-msg", "Please Login First to add Items into Cart");

							if (ud == null) {
							%>
							<a class="btn btn-primary btn-sm" href="loginUserMsg.jsp"> <i
								class="fas fa-cart-plus"></i> add to cart
							</a>
							<%
							} else {
							%>
							<a class="btn btn-primary btn-sm"
								href="AddToCart?uid=<%=ud.getId()%>&&bid=<%=bd.getBookid()%>">
								<i class="fas fa-cart-plus"></i> add to cart
							</a>
							<%
							}
							%>

						</div>
						<%
						} else {
						%>
						<div class="card-footer text-center">
							<h6 style="font-size: 18px;">Contact to seller</h6>
							<h6 style="font-size: 17px;">
								User Email ID:
								<%=bd.getUser_email()%></h6>
						</div>
						<%
						}
						%>
						<div class="card-footer text-center">
							<a class="btn btn-primary btn-sm my-1"
								href="viewAllRecentBooks.jsp"> <i class="fas fa-cart-plus"></i>
								continue shopping...
							</a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ===================New Book End============================ -->



</body>
</html>