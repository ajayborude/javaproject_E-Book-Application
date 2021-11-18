<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Placed</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("warning-msg", "Please Login First");
	if (ud == null) {
		response.sendRedirect("loginUserMsg.jsp");
	}
	%>


	<div class="container mt-5">

		<div class="col-lg-6 offset-3">
			<div class="card" style="background: #efefef">
				<div class="card-body text-primary text-center">
					<i class="fas fa-check-circle fa-4x mb-4 text-success"></i>
					<h6
						style="font-size: 25px; font-weight: bold; text-transform: capitalize; color: black;margin-bottom: 10px;">thank
						you...<%=ud.getName() %></h6>
					<h6
						style="font-size: 21px; text-transform: capitalize; color: black;">your
						order has been placed successfully</h6>
					<h6
						style="font-size: 15px; text-transform: capitalize; color: black;">within
						a 7 days your order will be deliver on your address</h6>
				</div>
				<div class="card-footer text-center">
				<a class="btn btn-primary btn-sm" href="index.jsp"> <i class="fas fa-home"></i> Home...</a>
				<a class="btn btn-success btn-sm" href="viewYourOrder.jsp"><i class="far fa-eye"></i> View Order...</a>
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