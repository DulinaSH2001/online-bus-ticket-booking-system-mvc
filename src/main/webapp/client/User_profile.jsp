<html lang="en">
<head>
<title>BusTicket - Online Bus Ticket Booking</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="Index.jsp">Bus<span>Ticket</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item "><a href="Index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="Add_review.jsp" class="nav-link">About</a></li>
					
					



					<li class="nav-item"><a href="Add_Complaint.jsp" class="nav-link">Contact Us</a></li>
					
					<% 
                    
                    if (session.getAttribute("userObj") != null) {
                       
                %>
					<li class="nav-item active"><a href="User_profile.jsp" class="nav-link">Hello,
							<%=((Model.User) session.getAttribute("userObj")).getName() %></a></li>
					<li class="nav-item"><a href="Logout.jsp" class="nav-link">Logout</a></li>
					<% 
                    } else {
                       
                %>
                <li class="nav-item"><a href="Login.jsp" class="nav-link">Login</a></li>
                 <li class="nav-item"><a href="Signup.jsp" class="nav-link">Sign up</a></li>
                  <% } %>
				</ul>
			</div>
		</div>
	</nav>
	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_3.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Profile <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Profile</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section contact-section">
		<div class="container">
			<div class="row d-flex mb-5 contact-info">


				<h2>My Profile</h2>
				<div class="col-md-8 block-9 mb-md-5">
					<form action="/online_bus_ticket/UpdateProfileServlet"
						method="post" class="bg-light p-5 contact-form">
						<div class="form-group">
							<label for="name">Name:</label> <input type="text"
								class="form-control" id="name" name="name"
								value="<%=((Model.User) session.getAttribute("userObj")).getName()%>"
								required>
						</div>
						<div class="form-group">
							<label for="email">Email:</label> <input type="email" id="email"
								name="email" class="form-control"
								value="<%=((Model.User) session.getAttribute("userObj")).getEmail()%>"
								required>
						</div>
						<div class="form-group">
							<label for="phoneNumber">Phone Number:</label> <input type="text"
								id="phoneNumber" name="phoneNumber" class="form-control"
								value="<%=((Model.User) session.getAttribute("userObj")).getPhoneNumber()%>"
								required>
						</div>
						<div class="form-group">
							<label for="nic">Nic:</label> <input type="text" id="nic"
								name="nic" class="form-control"
								value="<%=((Model.User) session.getAttribute("userObj")).getNic()%>"
								required>
						</div>
						<div class="form-group">
							<label for="phoneNumber">Username:</label> <input type="text"
								id="username" name="username" class="form-control"
								value="<%=((Model.User) session.getAttribute("userObj")).getUsername()%>"
								required>
						</div>
						<div class="form-group">
							<label for="phoneNumber">Password:</label> <input type="text"
								id="password" name="password" class="form-control"
								value="<%=((Model.User) session.getAttribute("userObj")).getPassword()%>"
								required>
						</div>
						<div class="form-group">
							<input type="submit"  class="btn btn-primary py-3 px-5" value="Update">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">
							<a href="#" class="logo">Car<span>book</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>


						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>



							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright ©
						<script>
							document.write(new Date().getFullYear());
						</script>
						2024 All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>





	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>


</body>
</html>