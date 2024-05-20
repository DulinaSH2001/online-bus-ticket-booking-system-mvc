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
					<li class="nav-item"><a href="Manage_users.jsp"> <i
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
					<li class="nav-item active"><a href="manage_complaint.jsp"> <i
							class="la la-wrench"></i>
							<p>Manage Complaint</p>

					</a></li>


					<li class="nav-item "><a href="../client/Login.jsp" class="btn btn-info"> <i
							class="la la-upload   "></i>
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
									<div class="card-title">Manage Complaints</div>
								</div>
								<div class="card-body">
									<table class="table table-hover">
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Full Name</th>
											<th scope="col">Email</th>
											<th scope="col">Complaint</th>
											<th scope="col">Complaint status</th>

											<th scope="col">Action</th>
										</tr>
										<%
										Connection con = null;
										try {
											con = DBconnection.getconnection();
											String sql = "SELECT * FROM complaints";
											PreparedStatement ps = con.prepareStatement(sql);
											ResultSet rs = ps.executeQuery();
											if (!rs.isBeforeFirst()) {
												out.println("<tr><td colspan='6'>No complaints found</td></tr>");
											} else {
												while (rs.next()) {
											int id = rs.getInt("id");
											String fullName = rs.getString("full_name");
											String email = rs.getString("email");
											String complaint = rs.getString("complaint");
											String createdAt = rs.getString("created_at");
											String cStatus = rs.getString("c_status");
										%>
										<tr>
											<td><%=id%></td>
											<td><%=fullName%></td>
											<td><%=email%></td>
											<td><%=complaint%></td>
											<td><%=cStatus%></td>
											<td>
												<div class="btn-group" role="group"
													aria-label="User Actions">
													<%
													if ("Unread".equals(cStatus)) {
													%>
													<a href="/online_bus_ticket/readComplaint?id=<%=id%>"
														class="btn btn-info">Read</a>
													<%
													}
													%>
													<a href="/online_bus_ticket/deleteComplaint?id=<%=id%>"
														class="btn btn-danger">Delete</a>
												</div>
											</td>
										</tr>
										<%
										}
										}
										rs.close();
										ps.close();
										con.close();
										} catch (Exception e) {
										e.printStackTrace();
										}
										%>
									</table>
								</div>
							</div>
						</div>
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
