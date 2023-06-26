package com.tech.blog.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tach.blog.modal.Message;
import com.tach.blog.modal.Userr;
import com.tech.blog.dao.UserrDao;
import com.tech.blog.utils.ConnectionProvider;

@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		fetch all data
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");

		// get the user from the session
		HttpSession s = request.getSession();
		Userr user = (Userr) s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);

		// update database...
		PrintWriter out = response.getWriter();
		UserrDao userDao = new UserrDao();
		int updateUser = userDao.updateUser(user);
		if (updateUser != 0) {
			out.print("Not Updated");
		} else {
			out.print("Updated to bd");
		}
	}
}
