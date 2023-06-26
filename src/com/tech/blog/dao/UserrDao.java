package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tach.blog.modal.Userr;
import com.tech.blog.utils.ConnectionProvider;

//Database se interect karne ke liye ye class bnai h 
public class UserrDao {

	// Method to insert userr to database
	public static int insertion(Userr user) {
		int status = 0;
		try {
			// User --> database
			String sql = "insert into userr(name, email, password, gender, about) values(?, ?, ?, ?, ?)";
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			status = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	// get user by useremail and userpassword

	public Userr getUserByEmailAndPassword(String email, String password) {
		Userr user = null;

		try {
			String sql = "select * from userr where email=? and password=?";
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				user = new Userr();
				// data from database
				String name = set.getString("name");
				// set to user object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public int updateUser(Userr user) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			String sql = "update userr set name=?, email=?, password=?, gender=?, about=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setInt(6, user.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public Userr getUserByUserId(int userId) {
		Userr user = null;
		try {
			Connection con = ConnectionProvider.getConnection();
			String sql = "select * from userr where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet set = ps.executeQuery();
			if (set.next()) {
				user = new Userr();
				// data from database
				String name = set.getString("name");
				// set to user object
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setDateTime(set.getTimestamp("rdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
