<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style type="text/css">
.body-background {
	

	background:url(images/about.jpg), linear-gradient(90deg, rgba(0, 0, 0, 0.8385854341736695) 20%,
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
						<h3 class="mb-4 text-center" style="color: white;">Have an account?</h3>
						<%
						if (request.getAttribute("errorMessage") != null) {
						%>
						<p style="color: red;"><%=request.getAttribute("errorMessage")%></p>
						<%
						}
						%>

						<form action="/online_bus_ticket/LoginServlet" method="post"
							class="signin-form">
							<div class="form-group">
								<input type="text" id="username" name="username"
									class="form-control" placeholder="Username" required><br>
								<br>
							</div>
							<div class="form-group">

								<input type="password" id="password" name="password"
									class="form-control" placeholder="Password" required><br>
								<br> <span
									class="fa fa-fw fa-eye field-icon toggle-password"></span>
							</div>
							<div class="form-group">

								<input type="submit"
									class="form-control btn btn-primary submit px-3" value="Login">
							</div>
							<div class="form-group d-md-flex">
								<div class="w-50">
									<a href="Signup.jsp" style="color: #fff">Dont Have an
										account? Sigup</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
