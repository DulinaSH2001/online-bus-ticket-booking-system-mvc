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
					<li class="nav-item "><a href="index.html"> <i
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
								<div class="card-title">Update Review</div>
							</div>
							<div class="card-body">
								<form action="/online_bus_ticket/CreateRouteServlet"
									method="post">
									<div class="form-group">
										<label for="fromLocation">From Location:</label> <input
											type="text" id="fromLocation" class="form-control"
											name="fromLocation" required="required">
									</div>

									<div class="form-group">

										<label for="toLocation">To Location:</label> <input
											type="text" id="toLocation" class="form-control"
											name="toLocation" required="required">
									</div>
									<div class="form-group">
										<label for="startTime">Start Time:</label> <input type="time"
											id="startTime" class="form-control" name="startTime" required="required">
									</div>
									<div class="form-group">
										<label for="finishTime">Finish Time:</label> <input
											type="time" id="finishTime" class="form-control"
											name="finishTime" required="required">
									</div>
									<div class="form-group">
										<label for="routeNumber">Route Number:</label> <input
											type="text" id="routeNumber" class="form-control"
											name="routeNumber" required="required">
									</div>
									<div class="form-group">
										<label for="busRegNumber">Bus Registration Number:</label> <input
											type="text" id="busRegNumber" class="form-control" pattern="[A-Za-z]{2,3}-\d{4}" title="Please enter a valid bus registration number (e.g., AA-6666,AAA-7777)."
											name="busRegNumber" required="required">
									</div>
									<div class="form-group">


										<input type="hidden" name="availability" value="1"> <label
											for="price">Price:</label> <input type="number"
											class="form-control" id="price" name="price">
									</div>
									<div class="form-group">
										<label for="seats">Seats:</label> <input type="number"
											id="seats" class="form-control" name="seats">
									</div>
									<div class="form-group">
										<label for="airConditioned">Air Conditioned:</label> <select
											id="airConditioned" name="airConditioned"
											class="form-control">
											<option value="1">AC</option>
											<option value="0">Non-AC</option>
										</select>
									</div>
									<div class="form-group">
										<input type="submit" class="btn btn-success"
											value="Create Route">
									</div>
								</form>
							</div>
						</div>



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