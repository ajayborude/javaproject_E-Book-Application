<%@page import="java.util.List"%>
<%@page import="com.entities.BookDetails"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All New Books here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>
</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	String suc_msg = (String) session.getAttribute("suc-msg");
	String error_msg = (String) session.getAttribute("eror-msg");

	if (error_msg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=error_msg%></div>
	<%
	}
	if (suc_msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=suc_msg%></div>
	<%
	}
	session.removeAttribute("suc-msg");
	session.removeAttribute("eror-msg");
	%>

	<!-- ===================New Book Start============================ -->

	<div style="background-color: #efefef">
		<div class="container">
			<h2>all new books</h2>
			<div class="row">


				<%
				List<BookDetails> new_list = AllBookRegardingOperation.viewAllNewBooks();
				for (BookDetails bd : new_list) {
				%>
				<div class="col-lg-3 mt-3">
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
		</div>
	</div>

	<!-- ===================New Book End============================ -->


</body>
</html>