<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View your profile here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>
<style type="text/css">
.card a {
	transition: 0.8s;
}

.card a:hover {
	background-color: aliceblue;
}
</style>
</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("warning-msg", "Please Login First to View Setting Page");
	if (ud == null) {
		response.sendRedirect("loginUserMsg.jsp");
	}
	%>

	<div style="background-color: lightgray; height: 71.4vh;">

		<%
		if (ud != null) {
		%>
		<h1
			style="font-size: 25px; font-weight: bold; text-align: center; padding: 15px 0;">
			Hello Mr
			<%=ud.getName()%>
			Welcome
		</h1>
		<%
		}
		%>


		<div class="container">
			<div class="row mt-2">

				<div class="col-lg-4 text-center">
					<div class="card">
						<a href="sellBook.jsp">
							<div class="card-body text-primary">
								<i class="fas fa-book fa-4x mb-3"></i>
								<h6
									style="font-size: 23px; font-weight: bold; text-transform: capitalize; color: black;">sell
									your old books</h6>
								<h6
									style="font-size: 10px; text-transform: capitalize; color: black;">sell
									Your old books here</h6>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-4 text-center">
					<div class="card">
						<a href="updateProfile.jsp">
							<div class="card-body text-success">
								<i class="far fa-address-card fa-4x mb-3"></i>
								<h6
									style="font-size: 23px; font-weight: bold; text-transform: capitalize; color: black;">Edit
									Your profile</h6>
								<h6
									style="font-size: 10px; text-transform: capitalize; color: black;">Edit
									Your profile here</h6>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 text-center">
					<div class="card">
						<a href="">
							<div class="card-body text-info">
								<i class="fas fa-map-marker-alt fa-4x mb-3"></i>
								<h6
									style="font-size: 23px; font-weight: bold; text-transform: capitalize; color: black;">my
									address</h6>
								<h6
									style="font-size: 10px; text-transform: capitalize; color: black;">edit
									your address here</h6>
							</div>
						</a>
					</div>
				</div>

			</div>
		</div>
		<div class="container">
			<div class="row mt-2">

				<div class="col-lg-4 text-center">
					<div class="card">
						<a href="viewAllOldSellBooks.jsp">
							<div class="card-body text-primary">
								<i class="fas fa-book fa-4x mb-3"></i>
								<h6
									style="font-size: 23px; font-weight: bold; text-transform: capitalize; color: black;">view
									all old books</h6>
								<h6
									style="font-size: 10px; text-transform: capitalize; color: black;">view
									Your all old books here</h6>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-4 text-center">
					<div class="card">
						<a href="viewYourOrder.jsp">
							<div class="card-body text-warning">
								<i class="fas fa-box-open fa-4x mb-3"></i>
								<h6
									style="font-size: 23px; font-weight: bold; text-transform: capitalize; color: black;">my
									order</h6>
								<h6
									style="font-size: 10px; text-transform: capitalize; color: black;">track
									your order here</h6>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 text-center">
					<div class="card">
						<a href="">
							<div class="card-body text-info">
								<i class="fas fa-user fa-4x mb-3"></i>
								<h6
									style="font-size: 23px; font-weight: bold; text-transform: capitalize; color: black;">help
									center</h6>
								<h6
									style="font-size: 10px; text-transform: capitalize; color: black;">24*7 service available</h6>
							</div>
						</a>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!-- ===================Start of footer============================ -->
	<div class="sticky-footer">
		<%@include file="ComenElements/footer.jsp"%>
	</div>
</body>
</html>