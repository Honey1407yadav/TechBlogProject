package com.tech.blog.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tach.blog.modal.Message;
import com.tach.blog.modal.Userr;
import com.tech.blog.dao.UserrDao;
import com.tech.blog.utils.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// login
		// fetch username and password from request
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		UserrDao dao = new UserrDao();
		Userr u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		if (u == null) {
			// login..Error
			Message msg = new Message("Invalid Details.. try again", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
		} else {
			// login success
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}
	}
}
