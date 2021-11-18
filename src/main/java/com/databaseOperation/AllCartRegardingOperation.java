package com.databaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseConnection.DatabaseConnection;
import com.entities.CartDetails;

public class AllCartRegardingOperation {
	
	public static int addToCart(CartDetails cd) {
		
		Connection conn;
		int result = 0;
		conn=DatabaseConnection.getConnection();
		String s=" Insert Into `cart_details` (`user_id`, `book_id`, `Book Name`, `Author`, `Price`, `Total-Price`) Values(?,?,?,?,?,?) ";
		
		try 
		{
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, cd.getUser_id());
			ps.setInt(2, cd.getBook_id());
			ps.setString(3, cd.getBookname());
			ps.setString(4, cd.getAuthour());
			ps.setDouble(5, cd.getPrice());
			ps.setDouble(6, cd.getTotal_price());
			ps.executeUpdate();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<CartDetails> viewBooksFromCartByUser(int id){
		
		Connection conn;
		conn=DatabaseConnection.getConnection();
		
		List<CartDetails> list=new ArrayList<CartDetails>();
		double total_price = 0;
		String s=" Select * From `cart_details` Where `user_id`=? ";
		
		try 
		{
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) 
			{
				CartDetails cd = new CartDetails();
				cd.setId(rs.getInt(1));
				cd.setUser_id(rs.getInt(2));
				cd.setBook_id(rs.getInt(3));
				cd.setBookname(rs.getString(4));
				cd.setAuthour(rs.getString(5));
				cd.setPrice(rs.getDouble(6));
				
				total_price=total_price+rs.getDouble(7);
				cd.setTotal_price(total_price);
				list.add(cd);
			}
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public static int removeBookFromservlet(int cid , int uid , int bid) {
		
		Connection conn;
		int result = 0;
		conn=DatabaseConnection.getConnection();
		String s=" Delete from `cart_details` Where `Id`=? and `user_id`=? and `book_id`=?  ";
		
		try 
		{
			PreparedStatement ps=conn.prepareStatement(s);
			ps.setInt(1, cid);
			ps.setInt(2, uid);
			ps.setInt(3, bid);
			ps.executeUpdate();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return result;
	}
}
