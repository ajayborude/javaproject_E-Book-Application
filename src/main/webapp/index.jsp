<%@page import="com.entities.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>E-Book Management System</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	%>

	<!-- ===================Back Image Links============================ -->
	<div class="back-img">
		<h1>
			<i class="fas fa-book"></i> e-book management system
		</h1>
	</div>

	<!-- ===================Recent Book Start============================ -->

	<section class="recent-book" id="recent-book">
		<div class="container">
			<h2>recent books</h2>
			<div class="row">

				<%
				List<BookDetails> recent_list = AllBookRegardingOperation.viewFourRecentBooks();
				for (BookDetails bd : recent_list) {
				%>
				<div class="col-lg-3">
					<div class="card main-card">
						<div class="card-header text-center">
							<img class="book-img" src="Book/<%=bd.getPhoto()%>">
						</div>
						<div class="card-body">
							<h6>
								book name:
								<%=bd.getBookName()%></h6>
							<h6>
								authour:
								<%=bd.getAuthor()%></h6>
							<h6>
								category:
								<%=bd.getCategories()%></h6>
							<h6>
								prize:
								<%=bd.getPrice()%>
								<i class="fas fa-rupee"></i>
							</h6>
						</div>
						<%
						if (bd.getCategories().equals("New Book")) {
						%>
						<div class="card-footer button-1">
							<a class="btn btn-success btn-sm"
								href="viewBookDetails.jsp?id=<%=bd.getBookid()%>"><i
								class="far fa-eye"></i> view details</a>
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
							<a class="btn btn-success btn-sm"
								href="viewBookDetails.jsp?id=<%=bd.getBookid()%>"><i
								class="far fa-eye"></i> view details</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="butun text-center mt-3">
				<a href="viewAllRecentBooks.jsp" class="btn btn-primary btn-sm"><i
					class="far fa-eye"></i> view all...</a>
			</div>
		</div>
	</section>

	<!-- ===================Recent Book End============================ -->


	<!-- ===================New Book Start============================ -->

	<section class="new-book" id="new-book">
		<div class="container">
			<h2>new books</h2>
			<div class="row">

				<%
				List<BookDetails> new_list = AllBookRegardingOperation.viewFourNewBooks();
				for (BookDetails bd : new_list) {
				%>
				<div class="col-lg-3">
					<div class="card main-card">
						<div class="card-header text-center">
							<img class="book-img" src="Book/<%=bd.getPhoto()%>">
						</div>
						<div class="card-body">
							<h6>
								book name:
								<%=bd.getBookName()%></h6>
							<h6>
								authour:
								<%=bd.getAuthor()%></h6>
							<h6>
								category:
								<%=bd.getCategories()%></h6>
							<h6>
								prize:
								<%=bd.getPrice()%></h6>
						</div>
						<div class="card-footer button-1">
							<a class="btn btn-success btn-sm"
								href="viewBookDetails.jsp?id=<%=bd.getBookid()%>"><i
								class="far fa-eye"></i> view details</a>
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
					</div>
				</div>
				<%
				}
				%>



			</div>
			<div class="butun text-center mt-3">
				<a href="viewAllNewBooks.jsp" class="btn btn-primary btn-sm"><i
					class="far fa-eye"></i> view all...</a>
			</div>
		</div>
	</section>

	<!-- ===================New Book End============================ -->


	<!-- ===================Old Book Start============================ -->

	<section class="old-book" id="old-book">
		<div class="container">
			<h2>Old books</h2>
			<div class="row">

				<%
				List<BookDetails> old_list = AllBookRegardingOperation.viewFourOldBooks();
				for (BookDetails bd : old_list) {
				%>
				<div class="col-lg-3">
					<div class="card main-card">
						<div class="card-header text-center">
							<img class="book-img" src="Book/<%=bd.getPhoto()%>">
						</div>
						<div class="card-body">
							<h6>
								book name:
								<%=bd.getBookName()%></h6>
							<h6>
								authour:
								<%=bd.getAuthor()%></h6>
							<h6>
								category:
								<%=bd.getCategories()%></h6>
							<h6>
								prize:
								<%=bd.getPrice()%></h6>
						</div>
						<div class="card-footer text-center">
							<a class="btn btn-success btn-sm"
								href="viewBookDetails.jsp?id=<%=bd.getBookid()%>"><i
								class="far fa-eye"></i> view details</a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<div class="butun text-center mt-3">
				<a href="viewAllOldBooks.jsp" class="btn btn-primary btn-sm"><i
					class="far fa-eye"></i> view all...</a>
			</div>
		</div>
	</section>

	<!-- ===================Old Book End============================ -->


	<!-- ===================Start of footer============================ -->
	<%@include file="ComenElements/footer.jsp"%>

</body>

</html>