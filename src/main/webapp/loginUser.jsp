<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header bg-success">
						<div class="text-center text-white">
							<h4>
								<i class="fas fa-users fa-2x"></i><br> Login Page
							</h4>
						</div>
					</div>

					<div class="card-body">

						<%
						String war_msg = (String) session.getAttribute("war-msg");
						if (war_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=war_msg%></div>
						<%
						}
						session.removeAttribute("war-msg");
						%>

						<form method="post" action="LoginUserServlet">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-success">Login</button>
								<br>If you don't have an account then <br> <a
									href="registerUser.jsp">Create an Account</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>