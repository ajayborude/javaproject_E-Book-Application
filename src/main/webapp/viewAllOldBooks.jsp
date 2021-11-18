<%@page import="com.entities.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Old Books here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>
</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<!-- ===================Old Book Start============================ -->

	<section class="" style="background-color: #efefef">
		<div class="container">
			<h2>all Old books</h2>
			<div class="row">
				<%
				List<BookDetails> old_list = AllBookRegardingOperation.viewAllOldBooks();
				for (BookDetails bd : old_list) {
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
								<%=bd.getPrice()%>
								<i class="fas fa-rupee"></i>
							</h6>
						</div>
						<div class="card-footer text-center">
							<a class="btn btn-success btn-sm" href="viewBookDetails.jsp?id=<%= bd.getBookid() %>"><i
								class="far fa-eye"></i> view details</a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</section>

	<!-- ===================Old Book End============================ -->



</body>
</html>