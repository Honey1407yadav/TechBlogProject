package com.tech.blog.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tach.blog.modal.Post;
import com.tach.blog.modal.Userr;
import com.tech.blog.dao.PostDao;
import com.tech.blog.utils.ConnectionProvider;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");

		// getting currentuser id
		HttpSession session = request.getSession();
		Userr user = (Userr) session.getAttribute("currentUser");
		Post p = new Post(pTitle, pContent, pCode, null, cid, user.getId());
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		if (dao.savePost(p)) {
			out.print("<html>");
			out.print("<h2 style='color:green;'> Done </h2>");
			out.print("</html>");
		} else {
			out.print("<html>");
			out.print("<h2 style='color:red;'>Failed </h2>");
			out.print("</html>");
		}
	}
}
