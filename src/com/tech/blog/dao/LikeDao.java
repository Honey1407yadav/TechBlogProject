package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pId, int uId) {
		boolean f = false;
		try {
			String sql = "insert into likee(pid,uid) values(?,?)";
			PreparedStatement p = this.con.prepareStatement(sql);

			// value set............
			p.setInt(1, pId);
			p.setInt(2, uId);
			p.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public int countLikeOnPost(int pId) {
		int count = 0;
		try {
			String sql = "select count (*) from likee where pId=?";
			PreparedStatement p = this.con.prepareStatement(sql);
			p.setInt(1, pId);

			ResultSet set = p.executeQuery();
			if (set.next()) {
				count = set.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pId, int uId) {
		boolean f = false;
		try {
			PreparedStatement p = this.con.prepareStatement("select * from likee where pId=? uId=?");
			p.setInt(1, pId);
			p.setInt(2, uId);
			ResultSet set = p.executeQuery();
			if (set.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteLike(int pId, int uId) {
		boolean f = false;
		try {
			PreparedStatement p = this.con.prepareStatement("delete from likee where pId=? uId=?");
			p.setInt(1, pId);
			p.setInt(2, uId);
			p.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
