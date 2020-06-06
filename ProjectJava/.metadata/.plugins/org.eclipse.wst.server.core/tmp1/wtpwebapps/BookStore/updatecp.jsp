<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BookStore.Dao.CartDao,com.BookStore.User.Cart,java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


</head>
<body style="background-color: #FF4948;">


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

String mob=request.getParameter("id");
session.setAttribute("updid", mob);
Cart u=CartDao.getRecordById(Integer.parseInt(mob));

%>






<form action="editct.jsp?id<%= u.getId()%>" method="get">



<div class="container">
	
	
<div class="jumbotron text-center">

<div class="row">

<div class="col-sm-2">
Enter Book Quantity
</div>
<div class="col-sm-8">
<input type="number" value='<%=u.getQty()%>' name=qty class="form-control">
</div>
</div>


<div class="row">



<input type="submit" value="Submit" class="btn btn-dark">

</div>






</div>

</div>


</form>



</body>
</html>