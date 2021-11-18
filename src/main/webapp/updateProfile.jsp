<%@page import="com.databaseOperation.AllUserRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Your Profile here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	%>

	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-center text-white">
							<h4>
								<i class="fas fa-users fa-2x"></i><br> Edit Profile Page
							</h4>
						</div>
					</div>
					
				

					<div class="card-body">

						<%
						String update_msg = (String) session.getAttribute("updt-msg");
						String error_msg = (String) session.getAttribute("eror-msg");
						if (update_msg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=update_msg%>
						</div>
						<%
						}
						if (error_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=error_msg%></div>
						<%
						}
						session.removeAttribute("updt-msg");
						session.removeAttribute("eror-msg");
						%>

						<form method="post" action="UpdateUserServlet">
						
							<input type="hidden" value="<%=ud.getId()%>" name="uid">
						
							<div class="form-group">
								<label for="exampleInputname">Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									value="<%=ud.getName()%>" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputname">Phone No</label> <input
									type="text" class="form-control" id="exampleInputname"
									value="<%=ud.getPhone()%>" name="phone">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=ud.getEmail()%>"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									value="<%=ud.getPassword()%>" name="password">
							</div>

							<button type="submit" class="btn btn-primary">Update
								Profile</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>