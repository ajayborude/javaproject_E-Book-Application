<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<div class="container">
		<a class="navbar-brand" href="#"><i class="fas fa-book"></i>
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
					aria-current="page" href="adminHome.jsp"><i class="fas fa-home"></i>
						Home</a></li>
				<li class="nav-item"><a class="nav-link" href="addBook.jsp"><i
						class="fas fa-book-reader"></i> Add book</a></li>

				<li class="nav-item"><a class="nav-link"
					href="viewAllBooks.jsp"><i class="fas fa-book-open"></i> All
						books</a></li>

			</ul>
			<form class="buttons">
				<a href="viewaLLOrder.jsp" class="btn btn-success"><i
					class="fas fa-box-open"></i> All Orders</a> <a data-toggle="modal"
					data-target="#exampleModalCenter" class="btn btn-danger text-white"> <i
					class="fas fa-sign-out-alt"></i> logout
				</a>
			</form>
		</div>
	</div>
</nav>


<!-- Button trigger modal -->
<!-- Modal -->
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
				<a href="../LogoutServlet" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>