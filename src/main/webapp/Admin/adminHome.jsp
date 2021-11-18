<%@page import="com.entities.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Book Management System</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="../CSS/allCssLinks.jsp"%>
<link rel="stylesheet" href="../CSS/mystyle.css">
<link rel="stylesheet" href="../Admin/style.css">
</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="../Admin/navbarAdmin.jsp"%>

<%
UserDetails ud=(UserDetails)session.getAttribute("admin-obj");
session.setAttribute("warning-msg", "You cannot Access this Page <br> You are not an Admin");
if(ud==null)
{
	response.sendRedirect("../loginUserMsg.jsp");
}
%>

	<!-- ===================Back Image Links============================ -->
	<div class="back-img-1">
		<h1>
			<i class="fas fa-book"></i> hello admin welcome
		</h1>
	</div>

<!-- ===================Start of footer============================ -->
	<%@include file="../ComenElements/footer.jsp"%>


</body>
</html>