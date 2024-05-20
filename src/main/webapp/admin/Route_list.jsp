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
					<li class="nav-item active"><a href="Route_list.jsp"> <i
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
								<div class="card-title">Manage Routes</div>
								 <a href="create_route.jsp" class="btn btn-primary float-right">Add Route</a>
							</div>
							<div class="card-body">
								<table  class="table table-hover">
									<tr>
										<th scope="col">ID</th>
										<th scope="col">From Location</th>
										<th scope="col">To Location</th>
										<th scope="col">Start Time</th>
										<th scope="col">Finish Time</th>
										<th scope="col">Route Number</th>
										<th scope="col">Bus Registration Number</th>
										<th scope="col">Availability</th>
										<th scope="col">Price</th>
										<th scope="col">Seats</th>
										<th scope="col">Air Conditioned</th>
										<th scope="col">Change Availability</th>
										<th scope="col">Action</th>
									</tr>
									<%
									Connection con = null;
									try {
										con = DBconnection.getconnection();
										String sql = "SELECT * FROM routes";
										PreparedStatement ps = con.prepareStatement(sql);
										ResultSet rs = ps.executeQuery();
										if (!rs.isBeforeFirst()) {
											out.println("<tr><td colspan='13'>No routes found</td></tr>");
										} else {
											while (rs.next()) {
										int id = rs.getInt("r_id");
										String fromLocation = rs.getString("from_location");
										String toLocation = rs.getString("to_location");
										String startTime = rs.getString("start_time");
										String finishTime = rs.getString("finish_time");
										String routeNumber = rs.getString("route_number");
										String busRegNumber = rs.getString("bus_reg_number");
										int availability = rs.getInt("availability");
										double price = rs.getDouble("price");
										int seats = rs.getInt("seats");
										boolean airConditioned = rs.getBoolean("air_conditioned");
									%>
									<tr>
										<td><%=id%></td>
										<td><%=fromLocation%></td>
										<td><%=toLocation%></td>
										<td><%=startTime%></td>
										<td><%=finishTime%></td>
										<td><%=routeNumber%></td>
										<td><%=busRegNumber%></td>
										<td><p
												class="<%=availability == 1 ? "badge badge-success" : "badge badge-warning"%>">
												<%=availability == 1 ? "Available" : "Unavailable"%></p></td>
										<td><%=price%></td>
										<td><%=seats%></td>
										<td>
											<p
												class="<%=airConditioned ? "badge badge-success" : "badge badge-warning"%>">
												<%=airConditioned ? "AC" : "Non AC"%></p>
										</td>
										<td><a
											href="/online_bus_ticket/updateAvailability?id=<%=id%>&availability=<%=availability%>"
											class="btn btn-info">Change</a></td> 
										<td>
											<div class="btn-group" role="group"
												aria-label="Route Actions">
												<a href="Update_route.jsp?id=<%=id%>"
													class="btn btn-warning mr-1">Edit</a> <a
													href="/online_bus_ticket/DeleteRoute?id=<%=id%>"
													class="btn btn-danger">Delete</a>
											</div>
										</td>
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

