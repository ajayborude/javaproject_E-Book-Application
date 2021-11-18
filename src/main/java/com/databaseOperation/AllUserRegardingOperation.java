package com.databaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.databaseConnection.DatabaseConnection;
import com.entities.UserDetails;

public class AllUserRegardingOperation {

	public static int registerUser(UserDetails ud) {
		Connection conn;
		int result = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Insert Into `user_details`(`FullName`, `Phone No`, `Email`, `Password`, `ProfilePicture`) Values(?,?,?,?,?) ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getPhone());
			ps.setString(3, ud.getEmail());
			ps.setString(4, ud.getPassword());
			ps.setString(5, ud.getPrifle_picture());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static UserDetails getLoginUser(String email, String pass) {
		Connection conn;
		UserDetails ud = null;
		conn = DatabaseConnection.getConnection();
		String s = " select * from `user_details` Where `Email`=? and `Password`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ud = new UserDetails();
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setPhone(rs.getString(3));
				ud.setEmail(rs.getString(4));
				ud.setPassword(rs.getString(5));
				ud.setPrifle_picture(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ud;
	}

	public static UserDetails viewUserById(int uid) {
		Connection conn;
		UserDetails ud = null;
		conn = DatabaseConnection.getConnection();
		String s = " select * from `user_details` Where `Id`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ud = new UserDetails();
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				ud.setPhone(rs.getString(3));
				ud.setEmail(rs.getString(4));
				ud.setPassword(rs.getString(5));
				ud.setPrifle_picture(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ud;
	}
	
	public static int updateUser(UserDetails ud) {
		
		Connection conn;
		int result = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Update `user_details` Set `FullName`=?, `Phone No`=?, `Email`=?, `Password`=? Where `Id`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getPhone());
			ps.setString(3, ud.getEmail());
			ps.setString(4, ud.getPassword());
			ps.setInt(5, ud.getId());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
