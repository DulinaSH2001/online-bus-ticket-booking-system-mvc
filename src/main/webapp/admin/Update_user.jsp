<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controller.DBconnection"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Ready Bootstrap Dashboard</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="assets/css/ready.css">
<link rel="stylesheet" href="assets/css/demo.css">
</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<div class="logo-header">
				<a href="index.html" class="logo"> Ready Dashboard </a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="collapse"
					aria-controls="sidebar" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<button class="topbar-toggler more">
					<i class="la la-ellipsis-v"></i>
				</button>
			</div>
			<nav class="navbar navbar-header navbar-expand-lg">
				<div class="container-fluid"></div>
			</nav>
		</div>
		<div class="sidebar">
			<div class="scrollbar-inner sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item "><a href="AdminDashboard.jsp"> <i
							class="la la-dashboard"></i>
							<p>Dashboard</p>

					</a></li>
					<li class="nav-item active"><a href="Manage_users.jsp"> <i
							class="la la-users"></i>
							<p>Manage Users</p>

					</a></li>
					<li class="nav-item"><a href="Route_list.jsp"> <i
							class="la la-location-arrow"></i>
							<p>Manage Routes</p>

					</a></li>
					<li class="nav-item"><a href="Review_List.jsp"> <i
							class="la la-newspaper-o"></i>
							<p>Manage Reviews</p>

					</a></li>
					<li class="nav-item"><a href="manage_complaint.jsp"> <i
							class="la la-wrench"></i>
							<p>Manage Complaint</p>

					</a></li>


					<li class="nav-item "><a href="../client/Login.jsp"
						class="btn btn-info"> <i class="la la-upload   "></i>
							<p>Logout</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<h4 class="page-title"></h4>
					<div class="row">

						<div class="card">
							<div class="card-header">
								<div class="card-title">Update User</div>
							</div>
							
						<%
						int userId = Integer.parseInt(request.getParameter("id"));
						Connection con = null;
						try {
							con = DBconnection.getconnection();
							String sql = "SELECT * FROM users WHERE u_id=?";
							PreparedStatement ps = con.prepareStatement(sql);
							ps.setInt(1, userId);
							ResultSet rs = ps.executeQuery();
							if (rs.next()) {
								String name = rs.getString("u_name");
								String phone = rs.getString("u_phone");
								String nic = rs.getString("u_nic");
								String username = rs.getString("u_username");
								String email = rs.getString("u_email");
								String password = rs.getString("u_password");
						%>
							
							<div class="card-body">
							
								<form action="/online_bus_ticket/updateUser" method="post">
								
									<input type="hidden" name="id" value="<%=userId%>">
									<div class="form-group">
										<label for="name">Name:</label> <input type="text"
											class="form-control" id="name" name="name" value="<%=name%>"
											required>

									</div>
									<div class="form-group">
										<label for="email">Email:</label> <input type="email"
											class="form-control" id="email" name="email"
											value="<%=email%>" required>

									</div>
									<div class="form-group">
										<label for="phoneNumber">Phone Number:</label> <input
											type="text" class="form-control" id="phoneNumber"
											name="phoneNumber" value="<%=phone%>" required>

									</div>
									<div class="form-group">
										<label for="nic">NIC:</label> <input type="text"
											class="form-control" id="nic" name="nic" value="<%=nic%>"
											required>

									</div>
									<div class="form-group">
										<label for="username">Username:</label> <input type="text"
											class="form-control" id="username" name="username"
											value="<%=username%>" required>

									</div>
									<div class="form-group">
										<label for="password">Password:</label> <input type="password"
											class="form-control" id="password" name="password"
											value="<%=password%>" required>

									</div>
									<input type="submit" class="btn btn-success" value="Update">
								</form>
							</div>
							<%
							} else {
							// Handle user not found
							out.println("User not found");
							}
							rs.close();
							ps.close();
							con.close();
							} catch (Exception e) {
							e.printStackTrace();
							// Handle database error
							response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
							}
							%>
						</div>
						<div class="row"></div>
					</div>
				</div>

			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog"
			aria-labelledby="modalUpdatePro" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header bg-primary">
						<h6 class="modal-title">
							<i class="la la-frown-o"></i> Under Development
						</h6>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body text-center">
						<p>
							Currently the pro version of the <b>Ready Dashboard</b> Bootstrap
							is in progress development
						</p>
						<p>
							<b>We'll let you know when it's done</b>
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="assets/js/core/jquery.3.2.1.min.js"></script>
<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugin/chartist/chartist.min.js"></script>
<script
	src="assets/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>

<script src="assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
<script src="assets/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="assets/js/plugin/chart-circle/circles.min.js"></script>
<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="assets/js/ready.min.js"></script>
<script src="assets/js/demo.js"></script>
</html>
