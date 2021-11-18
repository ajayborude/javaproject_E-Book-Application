<%@page import="com.entities.UserDetails"%>
<div class="empty bg-primary"></div>

<div class="container logo">
	<div class="row">
		<div class="col-lg-4">
			<h4>
				<i class="fas fa-book"></i> e-book application
			</h4>
		</div>
		<div class="col-lg-4">


			<form class="d-flex" method="post" action="searchBar.jsp">
				<input class="form-control my-2 my-sm-0" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
			</form>

		</div>
		<%
		UserDetails ud = (UserDetails) session.getAttribute("user-obj");
		if (ud == null) {
		%>
		<%
		} else {
		%>
		<div class="col-lg-4 text-lg-end">

			<a href="settingPage.jsp" class="btn btn-secondary"><i
				class="fas fa-cog"></i> setting</a> <a href="" class="btn btn-secondary"><i
				class="fas fa-address-book"></i> contact us</a>
		</div>

		<%
		}
		%>
	</div>
</div>



<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fas fa-book-medical"></i>
			E-BOOK</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fas fa-home"></i>
						Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="viewAllRecentBooks.jsp"><i class="fas fa-book-reader"></i>
						recent book</a></li>

				<li class="nav-item"><a class="nav-link"
					href="viewAllNewBooks.jsp"><i class="fas fa-book-open"></i> new
						book</a></li>
				<li class="nav-item"><a class="nav-link"
					href="viewAllOldBooks.jsp"><i class="fas fa-book-reader"></i>
						old book</a></li>
			</ul>
			<form class="buttons">
				<%
				if (ud == null) {
				%>
				<a href="registerUser.jsp" class="btn btn-success"><i
					class="fas fa-user"></i> register</a> <a href="loginUser.jsp"
					class="btn btn-success"><i class="fas fa-sign-in-alt"></i>
					login</a>
				<%
				} else {
				%>
				<a data-toggle="modal" data-target="#exampleModal"
					class="btn btn-success text-white"><i
					class="fas fa-address-book"></i> <%=ud.getName()%></a>
				<!-- Button trigger modal for profile -->
				<!-- Modal for profile -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Your Profile</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="container">
								<div class="col-lg-8 offset-2">
									<div class="card">
										<div class="card-header text-center">
											<img
												style="height: 180px; width: 160px; border-radius: 50pt;"
												src="Book/<%=ud.getPrifle_picture()%>">
										</div>
										<div class="card-body">
											<div class="card-body">
												<h6>
													full name:
													<%=ud.getName()%></h6>
												<h6>
													phone no:
													<%=ud.getPhone()%></h6>
												<h6>
													email:
													<%=ud.getEmail()%></h6>
												<h6>
													password:
													<%=ud.getPassword()%>
												</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="updateProfile.jsp" class="btn btn-primary">Edit
									Profile</a>
							</div>
						</div>
					</div>
				</div>

				<a href="yourCart.jsp?id=<%=ud.getId()%>"
					class="btn btn-outline-light"> <i class="fas fa-cart-plus"></i>
					your cart
				</a> <a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-danger text-white"><i
					class="fas fa-sign-out-alt"></i> logout</a>

				<%
				}
				%>
			</form>
		</div>
	</div>
</nav>


<!-- Button trigger modal for logout -->
<!-- Modal for logout -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Logout
					Massage</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h6>Do You Really Want to Logout</h6>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="LogoutServlet" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>