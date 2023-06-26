<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<!-- CSS Bootstrap Link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<!-- Navbar -->

	<%@include file="normal_navbar.jsp"%>
	<main class="d-flex align-items-center bg-dark " style="height: 150vh">
		<div class="container">
			<div class="row">
				<div class="col-md-8 offset-md-2">
					<div class="card">
						<div class="card-header  bg-dark text-white text-center">
							<span class="fa fa-user fa-3x"></span>
							<p>Ragister Here</p>
						</div>
						<div class="card-body">
							<form id="reg-form" action="RegisterServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Enter Name</label> <input
										name="user_name" type="text" class="form-control"
										id="user_name" aria-describedby="emailHelp" name="uname"
										required="required" placeholder="Enter Name">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email Address</label> <input
										name="user_email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										name="email" required="required" placeholder="Enter Email">
									<small>We'll never share your email with anyone</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="user_password" type="password" class="form-control"
										name="pwd" required="required" placeholder="Enter Password"
										id="exampleInputPassword1">
								</div>
								<div class="form-group">
									<label for="gender">Select Gender</label> <br> <input
										type="radio" id="gender" name="gender" value="male">Male
									<input type="radio" id="gender" name="gender" value="female">Female
								</div>
								<div class="form-group">
									<textarea name="about" class="form-control" rows="5"
										placeholder="Enter something about yourself"></textarea>
								</div>
								<div class="form-group form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree terms and conditions</label>
								</div>
								<button type="submit" class="btn bg-dark text-white">LOGIN</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- Javascript Bootstrap Link -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

</body>
</html>