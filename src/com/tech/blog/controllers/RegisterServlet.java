package com.tech.blog.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.DnsSrv.SrvRecord;
import com.tach.blog.modal.Userr;
import com.tech.blog.dao.UserrDao;
import com.tech.blog.utils.ConnectionProvider;

@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetch all form data
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");
		if (check == null) {
			out.print("<html>");
			out.print("<h2 style='color:blue;'> Box Not Checked</h2>");
			out.print("</html>");
		} else {
			// baki ka data yha nikalna h......
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			// create user object and set all data to that object...
			Userr user = new Userr(name, email, password, gender, about);

			// create a user dao object....
			UserrDao dao = new UserrDao();
			int insertion = dao.insertion(user);
			if (insertion != 0) {
//				save...
				out.print("<html>");
				out.print("<h2 style='color:green;'> Registration Successful </h2>");
				out.print("</html>");
			} else {
				out.print("<html>");
				out.print("<h2 style='color:red;'>Registration Failed </h2>");
				out.print("</html>");
			}
		}
	}
}
