<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserrDao"%>
<%@page import="com.tach.blog.modal.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.utils.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tach.blog.modal.Post"%>
<%@page import="com.tach.blog.modal.Userr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page errorPage="error.jsp"%>
<%
	Userr user = (Userr) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login.jsp");
}
%>

<%
	int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());

Post p = d.getPostByPostId(postId);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle()%>|| TechBlog</title>

<!-- CSS Bootstrap Link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.post-user-info {
	font-size: 20px;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding: 15px;
}

body {
	background: url(img/s5.jpg);
	background-size: cover;
	background-attachment: fixed;
}
</style>

</head>
<body>


	<!-- navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"> <span class="fa fa-bell-o"></span>
						LearnCode With Honey <span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square-o"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						class="fa fa-address-book"></span> Contact
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"> <span
						class="fa fa-edit"></span> Do Post
				</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="btn-outline-light btn-lg"> <%=user.getName()%>
					</span></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet">
						<span class="btn-outline-light btn-lg"> <span
							class="fa fa-user-plus"></span> Logout 
				</a></li>
			</ul>
		</div>
	</nav>
	<!-- navbar end -->


	<!-- main content of body start -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header bg-dark text-white">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<div class="row my-3 row-user">
							<div class="col-md-8">
								<p class="post-user-info">
									<%
										UserrDao ud = new UserrDao();
									%>
									<a href="#"><%=ud.getUserByUserId(p.getUserId()).getName()%></a>
									has posted
								</p>
							</div>
							<div class="col-md-4">
								<p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
							</div>

						</div>
						<p class="post-content"><%=p.getpContent()%></p>
						<br> <br>
						<div class="post-code">
							<pre><%=p.getpCode()%></pre>
						</div>
					</div>
					<div class="card-footer bg-dark">
						<a href="#" class="btn btn-outline-light btn-sm"><i
							class="fa fa-thumbs-o-up"></i> <span>10</span> </a> <a href="#"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"></i> <span>20</span> </a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- main content of body end -->


	<!-- profile modal -->
	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- details -->
						<div id="profile-details">
							<table class="table table-striped table-dark">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="EditServlet" method="post">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About :</td>
										<td><textarea rows="2" cols="" class="form-control"
												name="user_about"><%=user.getAbout()%>
										</textarea></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn bg-dark text-white">Save</button>
								</div>
							</form>
						</div>
					</div>
					<!-- profile edit End-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn bg-dark text-white"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn bg-dark text-white">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end of profile modal -->


	<!-- Add post modal start -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Category---</option>
								<%
									PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Categories> list = postd.getAllCategories();
								for (Categories c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">

							<input name="pTitle" type="text" placeholder="Enter Post Title"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea name="pContent" rows="" cols="" style="height: 100px;"
								class="form-control" placeholder="Enter Your Content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" rows="" cols="" style="height: 100px;"
								class="form-control" placeholder="Enter Your Program(if any)"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn bg-dark text-white">Post</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add post modal End-->


	<!-- Javascript Bootstrap Link -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
		
	</script>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {

			let editStatus = false;
			$('#edit-profile-button').click(function() {

				if (editStatus == false) {
					$("#profile-details").hide()

					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()

					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		});
	</script>
</body>
</html>