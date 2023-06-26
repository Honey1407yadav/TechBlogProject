package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tach.blog.modal.Categories;
import com.tach.blog.modal.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Categories> getAllCategories() {
		ArrayList<Categories> list = new ArrayList<>();
		try {
			String dbQuery = "select * from categories";
			Statement statement = this.con.createStatement();
			ResultSet resultSet = statement.executeQuery(dbQuery);
			while (resultSet.next()) {
				int cid = resultSet.getInt("cid");
				String name = resultSet.getString("cname");
				String description = resultSet.getString("cdescription");
				Categories c = new Categories(cid, name, description);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean savePost(Post p) {
		boolean f = false;
		try {
			String sql = "insert into posts(pTitle, pContent, pCode, catId, userId) values(?, ?, ?, ?, ?)";
			PreparedStatement preparedStatment = con.prepareStatement(sql);
			preparedStatment.setString(1, p.getpTitle());
			preparedStatment.setString(2, p.getpContent());
			preparedStatment.setString(3, p.getpCode());
			preparedStatment.setInt(4, p.getCatId());
			preparedStatment.setInt(5, p.getUserId());
			preparedStatment.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get all the posts
	public List<Post> getAllPosts() {

		List<Post> list = new ArrayList<>();
		// fetch all the post
		try {
			PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
			ResultSet set = p.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<>();
		// fetch all the post by id
		try {
			PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
			p.setInt(1, catId);
			ResultSet set = p.executeQuery();
			while (set.next()) {
				int pid = set.getInt("pId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				Post post = new Post(pid, pTitle, pContent, pCode, date, catId, userId);
				list.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Post getPostByPostId(int postId) {
		Post post = null;
		String sql = "select * from posts where pid=?";
		try {
			PreparedStatement p = this.con.prepareStatement(sql);
			p.setInt(1, postId);
			ResultSet set = p.executeQuery();
			if (set.next()) {
				int pid = set.getInt("pId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				int cid = set.getInt("catId");
				post = new Post(pid, pTitle, pContent, pCode, date, cid, userId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
}
