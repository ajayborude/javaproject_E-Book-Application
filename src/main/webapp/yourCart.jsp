<%@page import="org.w3c.dom.CDATASection"%>
<%@page import="com.entities.CartDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.databaseOperation.AllCartRegardingOperation"%>
<%@page import="com.databaseOperation.AllBookRegardingOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View your Items here</title>
<!-- ===================CSS Files Links============================ -->
<%@include file="CSS/allCssLinks.jsp"%>

</head>

<body>
	<!-- ===================Navbar Files Links============================ -->
	<%@include file="ComenElements/navbar.jsp"%>

	<%
	ud = (UserDetails) session.getAttribute("user-obj");
	session.setAttribute("warning-msg", "Please Login First to view items in Cart");
	if (ud == null) {
		response.sendRedirect("loginUserMsg.jsp");
	}
	%>


	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col-lg-6">
				<div class="card">
					<div class="card-header text-center pt-4 pb-4">
						<h3 style="font-size: 18px; font-weight: bold;">Your Selected
							Items</h3>
					</div>
					<div class="card-body">
						<%
						String reg_msg = (String) session.getAttribute("reg-msg");
						String error_msg = (String) session.getAttribute("eror-msg");
						if (reg_msg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=reg_msg%></div>
						<%
						}
						if (error_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=error_msg%></div>
						<%
						}
						session.removeAttribute("reg-msg");
						session.removeAttribute("eror-msg");
						%>
						<table class="table table-striped">
							<thead class="bg-success text-white">
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<CartDetails> list = AllCartRegardingOperation.viewBooksFromCartByUser(ud.getId());
								double total_price = 0.00;
								for (CartDetails cd : list) {
									total_price = cd.getTotal_price();
								%>

								<tr>
									<th scope="row"><%=cd.getBookname()%></th>
									<td><%=cd.getAuthour()%></td>
									<td><%=cd.getPrice()%></td>
									<td><a
										href="RemoveBookServlet?id=<%=cd.getId()%>&&uid=<%=ud.getId()%>&&bid=<%=cd.getBook_id()%>"
										class="btn btn-danger btn-sm text-white">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr class="bg-dark text-white">
									<th scope="row">Total Price:</th>
									<td></td>
									<td><%=total_price%></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card">
					<div class="card-header text-center pt-4 pb-4">
						<h3 style="font-size: 18px; font-weight: bold;">Please Enter
							Your Details For Order</h3>

						<%
						String sel_msg = (String) session.getAttribute("sel-msg");
						String error1_msg = (String) session.getAttribute("eror1-msg");
						if (sel_msg != null) {
						%>
						<div class="alert alert-info" role="alert"><%=sel_msg%></div>
						<%
						}
						if (error1_msg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=error1_msg%></div>
						<%
						}
						session.removeAttribute("sel-msg");
						session.removeAttribute("eror1-msg");
						%>

					</div>
					<form class="container mt-2 mb-3" action="OrderBookServlet"
						method="post">

						<input type="hidden" name="id" value="<%=ud.getId()%>">

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="name">Name</label> <input type="text"
									class="form-control" value="<%=ud.getName()%>" id="name"
									name="name" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="email">Email</label> <input type="text"
									class="form-control" readonly="readonly"
									value="<%=ud.getEmail()%>" id="email" name="email" required="required">
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="name">Mobile No</label> <input type="text"
									value="<%=ud.getPhone()%>" class="form-control" id="name"
									name="phone" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="name">Address</label> <input type="text"
									class="form-control" id="name" placeholder="Enter Address"
									name="address" required="required">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputCity">Landmark</label> <input type="text"
									class="form-control" id="inputCity"
									placeholder="Enter Landmark" name="land" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="inputCity">City</label> <input type="text"
									class="form-control" id="inputCity" placeholder="Enter City"
									name="city" required="required">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputCity">State</label> <input type="text"
									class="form-control" id="inputCity" placeholder="Enter State"
									name="state" required="required">
							</div>
							<div class="form-group col-md-6">
								<label for="inputCity">Pin-Code</label> <input type="text"
									class="form-control" id="inputCity"
									placeholder="Enter Pin-Code" name="pin" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="inputState">Payment Type</label> <select
								id="inputState" class="form-control" name="payment_type">
								<option value="noselect">----Select----</option>
								<option value="Cash on delivery">Cash on Delivery</option>
							</select>
						</div>

						<button type="submit" class="btn btn-primary mr-3">Order
							Now</button>
						Or <a href="viewAllRecentBooks.jsp"
							class="btn btn-outline-success"><i class="fas fa-cart-plus"></i>
							Continue Shopping</a>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>