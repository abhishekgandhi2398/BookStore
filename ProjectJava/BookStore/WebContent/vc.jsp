<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
import="com.BookStore.Dao.*,com.BookStore.User.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FF4948">
  <img src="img/logo.png" class="navbar-brand">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="1.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="User_Products.jsp">Books</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About us</a>
      </li>
    </ul>

    <form class="form-inline my-2 my-lg-0">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
     
     <%
String q=(String)session.getAttribute("mobno");

if(q==null)
{
     %>
       <li class="nav-item">
        <a class="nav-link" href="ulogin.jsp">Login</a>
      </li>
<%}
else
{ %>
      <li class="nav-item">
        <a class="nav-link" href="vc.jsp">View Cart</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="vieworderuser.jsp">View Orders</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="ulogout.jsp">Logout</a>
      </li>
  
  <%      }
	
	
%>
      </ul>

    
    </form>
  </div>
</nav>


<%

String m=(String)session.getAttribute("mobno");
long mm=Long.parseLong(m);

List<Cart> list=CartDao.getAllRecords(mm);
request.setAttribute("list",list);

Cart d=CartDao.gettotalamt(mm);






%>



<form action="placeorder.jsp">

<div class="container">
	
	
<div class="jumbotron text-center">
	
<%int a=0;
a=d.getGt();
session.setAttribute("grandtotal", a);

if(a==0)
{
	%>
	
	<div style="background-color: #FF4948; height: 250px; width: 100%;" class="d-flex justify-content-center  align-items-center">
		<br>	<br>	<br>	<br>
		<b style="font-family: sans-serif; font-size: 50pt;">Oh Snap! Your cart is empty</b>
		<br>
</div>
	
	<%
}
else
{

	
	%>
	
	

<div class="row">

<div class="col-sm-4">
Book
</div>

<div class="col-sm-2">
Book Name
</div>

<div class="col-sm-1">
Quantity
</div>

<div class="col-sm-1">
Price
</div>

<div class="col-sm-1">
Amount
</div>

<div class="col-sm-1">

</div>

<div class="col-sm-1">

</div>

</div>


<c:forEach items="${list}" var="u">


<div class="row">

<div class="col-sm-4"><img src="img/${u.getBfc()}"></div>
<div class="col-sm-2"><br><br><br><b>${u.getBname()}</b></div>
<div class="col-sm-1"><br><br><br><b>${u.getQty()}</b></div>
<div class="col-sm-1"><br><br><br><b>${u.getPrice()}</b></div>
<div class="col-sm-1"><br><br><br><b>${u.getAmt()}</b></div>
<div class="col-sm-1"><br><br><br><b><a href="deletecp.jsp?id=${u.getId()}" class="btn btn-dark">Remove</a></b></div>
<div class="col-sm-1"><br><br><br><b><a href="updatecp.jsp?id=${u.getId()}" class="btn btn-dark">Update Quantity</a></b></div>

</div>
</c:forEach>

<br>
<br>
<br>

	
	
<p align="right" style="font-size: 25px; font-family: sans-serif;"><%


out.print("Grand Total is "+d.getGt());
%></p>

<br>


<input type="submit" value="Place Order" class="btn btn-dark" width='250px'>
<br>

<p align="center" style="font-size: 25px; font-family: sans-serif;">
<%
out.print("<a href='clearcart.jsp' class='btn btn-dark' width='250px'>Clear Cart</a> ");

}
%></p>

<a href="User_Products.jsp" class="btn btn-dark" style="height: 80x; width: 350px;"><b>Buy More Books !!!</b></a>















</div>
</div>

</form>

</body>
</html>