package com.databaseOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseConnection.DatabaseConnection;
import com.entities.BookDetails;

public class AllBookRegardingOperation {

	public static int addbook(BookDetails bd) {
		Connection conn = null;
		int result = 0;

		conn = DatabaseConnection.getConnection();

		String s = " Insert into `book_details`(`Book Name`, `Author`, `Price`, `Book Categories`, `Book Status`, `Photo`, `User Email`) Values(?,?,?,?,?,?,?) ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, bd.getBookName());
			ps.setString(2, bd.getAuthor());
			ps.setDouble(3, bd.getPrice());
			ps.setString(4, bd.getCategories());
			ps.setString(5, bd.getStatus());
			ps.setString(6, bd.getPhoto());
			ps.setString(7, bd.getUser_email());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static List<BookDetails> viewAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` ";

		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static BookDetails getBookById(int id) {
		Connection conn;
		conn = DatabaseConnection.getConnection();
		BookDetails bd = null;
		String s = " Select * From `book_details` where `Id`=? ";

		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bd;
	}

	public static int editBook(BookDetails bd) {

		Connection conn = null;
		int result = 0;

		conn = DatabaseConnection.getConnection();

		String s = " Update `book_details` Set `Book Name`=?, `Author`=?, `Price`=?, `Book Categories`=?, `Book Status`=? Where `Id`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, bd.getBookName());
			ps.setString(2, bd.getAuthor());
			ps.setDouble(3, bd.getPrice());
			ps.setString(4, bd.getCategories());
			ps.setString(5, bd.getStatus());
			ps.setInt(6, bd.getBookid());
			;
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static int deleteBook(int id) {
		Connection conn;
		int result = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Delete from  `book_details` where `Id`=? ";

		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static List<BookDetails> viewFourRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		int i = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next() && i < 4) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<BookDetails> viewFourNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		int i = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Categories`=? And `Book Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next() && i < 4) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<BookDetails> viewFourOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		int i = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Categories`=? and `Book Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next() && i < 4) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public static List<BookDetails> viewAllRecentBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<BookDetails> viewAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Categories`=? And `Book Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<BookDetails> viewAllOldBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Categories`=? and `Book Status`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<BookDetails> viewAllOldBooksAvailableForSell(String catagory , String user_email) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Categories`=? and `User Email`=? order by `Id` desc ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, catagory);
			ps.setString(2, user_email);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public static int deleteUsersOldBook(int bid , String catagory , String user_email) {
		Connection conn;
		int result = 0;
		conn = DatabaseConnection.getConnection();
		String s = " Delete from  `book_details` where `Id`=? and `Book Categories`=? and `User Email`=? ";

		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setInt(1, bid);
			ps.setString(2, catagory);
			ps.setString(3, user_email);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public static List<BookDetails> getBookBySearchBar(String ch)
	{
		List<BookDetails> list = new ArrayList<BookDetails>();
		Connection conn;
		conn = DatabaseConnection.getConnection();
		String s = " Select * From `book_details` Where `Book Name` like ? or `Author` like ? or `Book Categories` like ? And `Book Status`=? ";
		try {
			PreparedStatement ps = conn.prepareStatement(s);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDetails bd = new BookDetails();
				bd.setBookid(rs.getInt(1));
				bd.setBookName(rs.getString(2));
				bd.setAuthor(rs.getString(3));
				bd.setPrice(rs.getDouble(4));
				bd.setCategories(rs.getString(5));
				bd.setStatus(rs.getString(6));
				bd.setPhoto(rs.getString(7));
				bd.setUser_email(rs.getString(8));
				list.add(bd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
	
}