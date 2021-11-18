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
								<i class="fas fa-users fa-2x"></i><br> Register Page
							</h4>
						</div>
					</div>

						<%
						String cheack_msg = (String) session.getAttribute("check-msg");
						String reg_msg = (String) session.getAttribute("reg-msg");
						String error_msg = (String) session.getAttribute("eror-msg");
						if (cheack_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=cheack_msg %></div>
						<%
						}
						if (reg_msg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=reg_msg %><br><a href="loginUser.jsp">Click Here To Login</a></div>
						<%
						}
						if (error_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=error_msg %></div>
						<%
						}
						session.removeAttribute("check-msg");
						session.removeAttribute("reg-msg");
						session.removeAttribute("eror-msg");
						%>
						<div class="card-body">
						<form method="post" action="registerUserServlet"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputname">Full Name</label> <input
									type="text" class="form-control" id="exampleInputname"
									placeholder="Enter Name" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputname">Phone No</label> <input
									type="text" class="form-control" id="exampleInputname"
									placeholder="Enter Phone No" name="phone">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Email"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Upload Profile
									Picture</label> <input type="file" class="" id="exampleInputPassword1"
									name="profile_picture">
							</div>

							<div class="form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and condition</label>
							</div>

							<button type="submit" class="btn btn-primary">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>