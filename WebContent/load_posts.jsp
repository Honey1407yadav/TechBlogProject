<%@page import="com.tach.blog.modal.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.utils.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%
			PostDao d = new PostDao(ConnectionProvider.getConnection());
		int cid = Integer.parseInt(request.getParameter("cid"));
		List<Post> posts = null;
		if (cid == 0) {
			posts = d.getAllPosts();
		} else {
			posts = d.getPostByCatId(cid);
		}
		if (posts.size() == 0) {
			out.print("<h3 class='display-3 text-center'>No Posts in this category...</h3>");
			return;
		}
		for (Post p : posts) {
		%>
		<div class="col-md-10 mt-2">
			<div class="card">
				<div class="card-body">
					<b> <%=p.getpTitle()%></b>
					<p><%=p.getpContent()%></p>
				</div>
				<div class="card-footer bg-dark text-center">
					<a href="show_blog_page.jsp?post_id=<%=p.getpId()%>"
						class="btn btn-outline-light btn-sm">Read More...</a> <a href="#"
						class="btn btn-outline-light btn-sm"><i
						class="fa fa-thumbs-o-up"></i> <span>10</span> </a> <a href="#"
						class="btn btn-outline-light btn-sm"><i
						class="fa fa-commenting-o"></i> <span>20</span> </a>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<br>
</body>
</html>