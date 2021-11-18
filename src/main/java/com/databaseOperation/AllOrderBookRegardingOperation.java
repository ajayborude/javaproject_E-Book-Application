package com.databaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseConnection.DatabaseConnection;
import com.entities.BookDetails;
import com.entities.BookOrderDetails;

public class AllOrderBookRegardingOperation {

	public static int getOrderNo() {

		Connection conn;
		conn = DatabaseConnection.getConnection();

		int i = 1;

		String s = "select * from `order_book_table`";

		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

     public static boolean saveOrder(List<BookOrderDetails> list) {
    	 
    	 boolean f=false;
		Connection conn;
		conn=DatabaseConnection.getConnection();
		
		String s="Insert Into `order_book_table` (`Order_Id`, `User Name`, `Email`, `Address`, `Phone No`, `Book Name`, `Author`, `Price`, `Payment`) Values(?,?,?,?,?,?,?,?,?) ";
		
		try 
		{
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(s);
			
			for(BookOrderDetails bod:list)
			{
				ps.setString(1, bod.getOrder_id());
				ps.setString(2, bod.getUser_name());
				ps.setString(3, bod.getEmail());
				ps.setString(4, bod.getFull_address());
				ps.setString(5, bod.getPhone());
				ps.setString(6, bod.getBook_name());
				ps.setString(7, bod.getAuthor());
				ps.setString(8, bod.getPrice());
				ps.setString(9, bod.getPayment_type());
				ps.addBatch();
			}
			
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		}  
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		return f;
     }
     
     public static List<BookOrderDetails> viewMyOrder(String user_email){

    	 List<BookOrderDetails> list = new ArrayList<BookOrderDetails>();
 		Connection conn;
 		conn = DatabaseConnection.getConnection();
 		String s = " Select * From `order_book_table` Where `Email`=? ";

 		try {
 			PreparedStatement ps = conn.prepareStatement(s);
 			ps.setString(1, user_email);
 			ResultSet rs = ps.executeQuery();
 			while (rs.next()) {
 				BookOrderDetails bod = new BookOrderDetails();
 				bod.setId(rs.getInt(1));
 				bod.setOrder_id(rs.getString(2));
 				bod.setUser_name(rs.getString(3));
 				bod.setEmail(rs.getString(4));
 				bod.setFull_address(rs.getString(5));
 				bod.setPhone(rs.getString(6));
 				bod.setBook_name(rs.getString(7));
 				bod.setAuthor(rs.getString(8));
 				bod.setPrice(rs.getString(9));
 				bod.setPayment_type(rs.getString(10));
 				list.add(bod);
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		return list; 
     }
     public static List<BookOrderDetails> viewAllOrderByAdmin(){
    	 
    	 List<BookOrderDetails> list = new ArrayList<BookOrderDetails>();
    	 Connection conn;
    	 conn = DatabaseConnection.getConnection();
    	 String s = " Select * From `order_book_table` order by `Id` desc ";
    	 
    	 try {
    		 PreparedStatement ps = conn.prepareStatement(s);
    		
    		 ResultSet rs = ps.executeQuery();
    		 while (rs.next()) {
    			 BookOrderDetails bod = new BookOrderDetails();
    			 bod.setId(rs.getInt(1));
    			 bod.setOrder_id(rs.getString(2));
    			 bod.setUser_name(rs.getString(3));
    			 bod.setEmail(rs.getString(4));
    			 bod.setFull_address(rs.getString(5));
    			 bod.setPhone(rs.getString(6));
    			 bod.setBook_name(rs.getString(7));
    			 bod.setAuthor(rs.getString(8));
    			 bod.setPrice(rs.getString(9));
    			 bod.setPayment_type(rs.getString(10));
    			 list.add(bod);
    		 }
    	 } catch (SQLException e) {
    		 e.printStackTrace();
    	 }
    	 return list; 
     }
     
}