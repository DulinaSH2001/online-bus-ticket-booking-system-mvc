<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<style type="text/css">
.body-background {
	background: url(images/about.jpg),
		linear-gradient(90deg, rgba(0, 0, 0, 0.8385854341736695) 20%,
		rgba(0, 0, 0, 0.6425070028011204) 50%,
		rgba(0, 0, 0, 0.771358543417367) 80%);
}
</style>
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
<body>
<body class="img body-background">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section" style="color: white;">Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
						<form action="/online_bus_ticket/SignUpServlet" method="post"
							class="signin-form">
							<div class="form-group">
								<input type="text" id="name" name="name" class="form-control"
									required placeholder="Name">
							</div>
							<div class="form-group">
								<input type="text" id="nic" name="nic" class="form-control"
									required placeholder="NIC">
							</div>
							<div class="form-group">
								<input type="email" id="email" name="email" class="form-control"
									required placeholder="Email">
							</div>
							<div class="form-group">
								<input type="text" id="phoneNumber" name="phoneNumber"
									class="form-control" required placeholder="Phone Number">
							</div>
							<div class="form-group">
								<input type="text" id="username" name="username"
									class="form-control" required placeholder="Username">
							</div>
							<div class="form-group">
								<input type="password" id="password" name="password"
									class="form-control" required placeholder="Password">
							</div>
							<div class="form-group">
								<input type="submit" value="Sign Up"
									class="form-control btn btn-primary submit px-3">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>