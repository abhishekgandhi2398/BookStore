package com.BookStore.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.BookStore.User.Order;


public class OrderDao {

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
	

	public static int save(long mm)
	{
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into orders(uid,pid,qty,price,amt) select cart.usid,cart.prodid,cart.qty,cart.price,cart.amt from book.cart where cart.usid=?");
			ps.setLong(1, mm);
			status=ps.executeUpdate();
		    con.close();  
		}catch(Exception e){System.out.println(e);}
		return status;
	}
		
	

	public static List<Order> getAllRecords(){
		List<Order> list=new ArrayList<Order>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT orders.uid,orders.qty,orders.price,orders.amt,orders.date,orders.orderids,user.name,user.address,books.name FROM orders,books,user where orders.uid=user.mobile and orders.pid=books.idbooks");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				Order c=new Order();
				
				c.setMobile(rs.getLong(1));
				c.setQty(rs.getInt(2));
				c.setPrice(rs.getInt(3));
				c.setAmt(rs.getInt(4));
				c.setD(rs.getDate(5));
				c.setOid(rs.getString(6));
				c.setName(rs.getString(7));
				c.setBname(rs.getString(8));
				c.setAddress(rs.getString(9));
				list.add(c);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	
	
	public static List<Order> getAllRecords(Long mm){
		List<Order> list=new ArrayList<Order>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT orders.uid,orders.qty,orders.price,orders.amt,orders.date,orders.orderids,user.name,user.address,books.name FROM orders,books,user where orders.uid=? and user.mobile=? and orders.pid=books.idbooks");
			ps.setLong(1,mm);
			ps.setLong(2,mm);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				Order c=new Order();
				
				c.setMobile(rs.getLong(1));
				c.setQty(rs.getInt(2));
				c.setPrice(rs.getInt(3));
				c.setAmt(rs.getInt(4));
				c.setDd(rs.getString(5));
				c.setOid(rs.getString(6));
				c.setName(rs.getString(7));
				c.setBname(rs.getString(8));
				c.setAddress(rs.getString(9));
				list.add(c);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
}
