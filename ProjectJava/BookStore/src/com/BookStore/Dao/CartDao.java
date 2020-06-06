package com.BookStore.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.BookStore.User.Cart;

public class CartDao {

	
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
	

	
	
	
	public static int save(long uid,int pid,int qty,int price)
	{
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into cart(usid,prodid,qty,price) values(?,?,?,?)");
			ps.setLong(1, uid);
			ps.setInt(2, pid);
			ps.setInt(3, qty);
			ps.setInt(4,price);
			status=ps.executeUpdate();
		    con.close();  
		}catch(Exception e){System.out.println(e);}
		return status;
	}
		
	
	
	public static List<Cart> getAllRecords(long mm){
		List<Cart> list=new ArrayList<Cart>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select cart.id,books.fcover,books.name,cart.price,cart.qty,cart.amt from books,cart where cart.usid=? and cart.prodid=books.idbooks");
			ps.setLong(1,mm);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				Cart c=new Cart();
				
				c.setId(rs.getInt(1));
				c.setBfc(rs.getString(2));
				c.setBname(rs.getString(3));
				c.setQty(rs.getInt("qty"));
				c.setPrice(rs.getInt("price"));
				c.setAmt(rs.getInt("amt"));
				list.add(c);
			}
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	
	
	public static int delete(Cart u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from cart where id=?");
			ps.setLong(1,u.getId());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	} 

	
	public static int deleteall(long id){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from cart where usid=?");
			ps.setLong(1,id);
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	} 
	
	  public static int update(int qty,int id){
			int status=0;
			try{
				Connection con=getConnection();
				PreparedStatement ps=con.prepareStatement("update cart set qty=? where id=?");
				ps.setInt(1, qty);
				ps.setInt(2, id);
				status=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return status;
		}
	  
	  
			
	  
	  public static Cart getRecordById(int id){
			Cart c=null;
			try{
				Connection con=getConnection();
				PreparedStatement ps=con.prepareStatement("select * from cart where id=?");
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					c=new Cart();
					c.setId(rs.getInt(1));
					c.setBfc(rs.getString(2));
					c.setBname(rs.getString(3));
					c.setQty(rs.getInt("qty"));
					c.setPrice(rs.getInt("price"));
					c.setAmt(rs.getInt("amt"));
				}
			}catch(Exception e){System.out.println(e);}
			return c;
		}
	
	  public static Cart gettotalamt(long mm)
	  {
		  Cart c=null;
		  try {
			  Connection con=getConnection();
			  PreparedStatement ps=con.prepareStatement("select sum(amt) from cart where usid=?");
			  ps.setLong(1,mm);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next()){c=new Cart();
			  c.setGt(rs.getInt(1));
			  }
			  
			}catch(Exception e){System.out.println(e);}
			return c;
		  
	  }
	  
	
}
