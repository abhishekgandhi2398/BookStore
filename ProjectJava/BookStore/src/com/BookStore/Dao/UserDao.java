package com.BookStore.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.BookStore.User.User;

public class UserDao {

	public static Connection getConnection()
	{
	Connection con=null;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Found");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","iloveyou3000");
	System.out.println("Done");
	}
	catch (Exception e) {
	// TODO: handle exception
	System.out.println(e);
	}
	return con;
	}
	
	
	
	
	public static int save(User u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into user(mobile,name,password,email,address,address1,city,pincode) values(?,?,?,?,?,?,?,?)");
			ps.setLong(1,u.getMobile());
			ps.setString(2, u.getName());
			ps.setString(3,u.getPassword());
			ps.setString(4,u.getEmail());
			ps.setString(5,u.getAddress());
			ps.setString(6,u.getAddress1());
			ps.setString(7,u.getCity());
			ps.setString(8,u.getPincode());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	
	
	
	  public static boolean singinvals(User u) throws SQLException
			{
		  		boolean status=false;
				Connection con=UserDao.getConnection();
				PreparedStatement pstmt=con.prepareStatement("Select * from user where mobile=? and password=?");
				pstmt.setLong(1, u.getMobile());
				System.out.println(u.getMobile());
				
				pstmt.setString(2, u.getPassword());
				System.out.println(u.getPassword());
				ResultSet rs=pstmt.executeQuery();
				status=rs.next();
				return status;
				
			}
		
	  
	  public static List<User> getAllRecords(){
			List<User> list=new ArrayList<User>();
			
			try{
				Connection con=getConnection();
				PreparedStatement ps=con.prepareStatement("select * from user");
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					User u=new User();
					
					u.setMobile(rs.getLong("mobile"));
					u.setName(rs.getString("name"));
					u.setPassword(rs.getString("password"));
					u.setEmail(rs.getString("email"));
					u.setAddress(rs.getString("address"));
					u.setAddress1(rs.getString("address1"));
					u.setCity(rs.getString("city"));
					u.setPincode(rs.getString("pincode"));
					
					list.add(u);
				}
			}catch(Exception e){System.out.println(e);}
			return list;
		}
	  
	  
	  public static int update(User u){
			int status=0;
			try{
				Connection con=getConnection();
				
				
				PreparedStatement ps=con.prepareStatement("update user set mobile=?,name=?,password=?,email=?,address=?,address1=?,city=?,pincode=? where mobile=?");
				ps.setLong(1,u.getMobile());
				ps.setString(2,u.getName());
				ps.setString(3,u.getPassword());
				ps.setString(4,u.getEmail());
				ps.setString(5,u.getAddress());
				ps.setString(6,u.getAddress1());
				ps.setString(7,u.getCity());
				ps.setString(8,u.getPincode());
				ps.setLong(9,u.getMobile());
				status=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return status;
		}
	
	  
	  public static User getRecordById(long mobile){
			User u=null;
			try{
				Connection con=getConnection();
				PreparedStatement ps=con.prepareStatement("select * from user where mobile=?");
				ps.setLong(1,mobile);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					u=new User();
					u.setMobile(rs.getLong("mobile"));
					u.setName(rs.getString("name"));
					u.setPassword(rs.getString("password"));
					u.setEmail(rs.getString("email"));
					u.setAddress(rs.getString("address"));
					u.setAddress1(rs.getString("address1"));
					u.setCity(rs.getString("city"));
					u.setPincode(rs.getString("pincode"));
				}
			}catch(Exception e){System.out.println(e);}
			return u;
		}
	  public static int delete(User u){
			int status=0;
			try{
				Connection con=getConnection();
				PreparedStatement ps=con.prepareStatement("delete from user where mobile=?");
				ps.setLong(1,u.getMobile());
				status=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}

			return status;
		} 
	
}
