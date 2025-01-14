<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Controller.DBconnection"%>
<!DOCTYPE html>
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
<style>



    /* Custom CSS for testimonial carousel */
    /* Gray color for carousel controls */
    .carousel-control-prev,
    .carousel-control-next {
        color: #808080; /* Gray color */
        text-shadow: none; /* Remove text shadow */
    }

    /* Add shadow to the container */
    .testimony-section {
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Add shadow */
    }
</style>
</head>
<body data-aos-easing="slide" data-aos-duration="800" data-aos-delay="0">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Bus<span>Ticket</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item "><a href="Index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item active"><a href="Add_review.jsp" class="nav-link">About</a></li>
					
					



					<li class="nav-item"><a href="Add_Complaint.jsp" class="nav-link">Contact Us</a></li>
					
					<% 
                    
                    if (session.getAttribute("userObj") != null) {
                       
                %>
					<li class="nav-item"><a href="User_profile.jsp" class="nav-link">Hello,
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
								class="ion-ios-arrow-forward"></i></a></span> <span>About us <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">About Us</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-about">
		<div class="container">
			<div class="row no-gutters">
				<div
					class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(images/about.jpg);"></div>
				<div class="col-md-6 wrap-about ftco-animate">
					<div class="heading-section heading-section-white pl-md-5">
						<span class="subheading">About us</span>
						<h2 class="mb-4">Welcome to Carbook</h2>

						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia. It is a paradisematic country,
							in which roasted parts of sentences fly into your mouth.</p>
						<p>On her way she met a copy. The copy warned the Little Blind
							Text, that where it came from it would have been rewritten a
							thousand times and everything that was left from its origin would
							be the word "and" and the Little Blind Text should turn around
							and return to its own, safe country. A small river named Duden
							flows by their place and supplies it with the necessary
							regelialia. It is a paradisematic country, in which roasted parts
							of sentences fly into your mouth.</p>
						<p>
							<a href="#" class="btn btn-primary py-3 px-4">Search Vehicle</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section contact-section">
		<div class="container">
			<div class="row d-flex mb-5 contact-info">
				<div class="col-md-8 block-9 mb-md-5">
					<h2>Add Review</h2>
					<%
					if (session != null && session.getAttribute("userObj") != null) {
						int userId = ((Model.User) session.getAttribute("userObj")).getId();
						String userName = ((Model.User) session.getAttribute("userObj")).getName();
						String userEmail = ((Model.User) session.getAttribute("userObj")).getEmail();
					%>
					<form action="/online_bus_ticket/AddReview" method="post"
						class="bg-light p-5 contact-form">

						<input type="hidden" id="userId" name="userId" value="<%=userId%>"
							readonly> <input type="hidden" id="userId" name="userId"
							value="<%=userId%>" readonly>
						<div class="form-group">
							<label for="userName">Name:</label> <input type="text"
								class="form-control" id="userName" name="userName"
								value="<%=userName%>" readonly><br>
						</div>
						<div class="form-group">

							<label for="userEmail">Email:</label> <input type="email"
								class="form-control" id="userEmail" name="userEmail"
								value="<%=userEmail%>" readonly><br>
						</div>
						<div class="form-group">
							<label for="reviewContent">Review:</label><br>
							<textarea id="reviewContent" class="form-control"
								name="reviewContent" rows="4" cols="50" required></textarea>
							<br>
						</div>
						<div class="form-group">
							<input type="submit" value="Submit Review"
								class="btn btn-primary py-3 px-5">
						</div>
					</form>

					<%
					} else {
					%>
					<p>You must be logged in to add a review.</p>
					<%
					}
					%>


				</div>
			</div>

		</div>
	</section>



	<section class="ftco-section testimony-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div
					class="col-md-7 text-center heading-section ftco-animate fadeInUp ftco-animated">
					<span class="subheading"></span>
					<h2 class="mb-3">Reviews</h2>
				</div>
			</div>
			<div class="row ftco-animate fadeInUp ftco-animated">

				<div id="testimonial-carousel" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<%
						Connection con = null;
						try {
							con = DBconnection.getconnection();
							String sql = "SELECT * FROM reviews";
							PreparedStatement ps = con.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
							int count = 0; // Counter to manage active class
							while (rs.next()) {
								String name = rs.getString("user_name");
								String userEmail = rs.getString("user_email");
								String reviewText = rs.getString("review_content");
						%>
						<!-- Testimonial Item -->
						<div class="carousel-item <%=(count == 0) ? "active" : ""%>">
							<div class="testimonial-item">
								<h3><%=name%></h3>
								<p>
									Email:
									<%=userEmail%></p>
								<p><%=reviewText%></p>
							</div>
						</div>
						<%
						count++; // Increment counter
						}
						rs.close();
						ps.close();
						} catch (Exception e) {
						e.printStackTrace();
						} 
						%>
					</div>

					<!-- Carousel Controls -->
					<a class="carousel-control-prev" href="#testimonial-carousel"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#testimonial-carousel"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
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
						Copyright �
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
