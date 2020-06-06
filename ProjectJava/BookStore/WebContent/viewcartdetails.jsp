<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BookStore.Dao.ProductDao,com.BookStore.User.*,java.util.*,java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Below is the cart list</h1>

<%
String m=(String)session.getAttribute("mobno");
long mm=Long.parseLong(m);

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","iloveyou3000");
PreparedStatement ps=con.prepareStatement("select cart.id,books.fcover,books.name,cart.price,cart.qty,cart.amt from books,cart where cart.usid=? and cart.prodid=books.idbooks");
ps.setLong(1,mm);
ResultSet rs=ps.executeQuery();
Cart c=null;

long gt=0;


%>

<table>

 <% while(rs.next()){  
	 Products u=new Products();
	 
	 %>
					         	
         	<TR>
           				<% u.setIdbooks(rs.getInt(1));%>
           	<TD> 		<%= rs.getInt(1)%></TD>
		 	<TD> 		<%= rs.getString(2)%></TD>
			<TD> 		<%= rs.getString(3)%></TD>
		 	<TD> 		<%= rs.getInt(4)%></TD>
			<TD> 		<%= rs.getInt(5)%></TD>
			<TD> 		<%= rs.getInt(6)%></TD>
         	    
            
            <% } 
            con.close();
            %>
            
            
            <TD> 		a</TD>
         	
            
            </TR>
            
            

</table>

<br>
<br>

<p>Grand Total : 

<%
int x=0;
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","iloveyou3000");

PreparedStatement ps1=con1.prepareStatement("select sum(amt) from cart where usid=?");
ps1.setLong(1,mm);
ResultSet rs1=ps1.executeQuery();


%>

<% while(rs1.next()){  
					%>
<%= rs1.getInt(1)%>
 <% } 
            con1.close();
            %>
</p>


</body>
</html>