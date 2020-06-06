
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.BookStore.Dao.UserDao,com.BookStore.User.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" ></script>



<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>



<body style="background-color: #B7CEEC;">



<div style="background-color: #B7CEEC; height: 100px; width: 100%;" class="d-flex justify-content-center  align-items-center">





<a href="add_product.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">Add Products</a><br>

<a href="admin_view_product.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">View Products</a>
<br>

<a href="vieworderadmin.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">View Order</a>
<br>

<a href="admin_view_users.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">View Users</a>

</div>










<h1>Below is the users list</h1>




<%
List<User> list=UserDao.getAllRecords();
request.setAttribute("list",list);
%>



<table class="table table-striped">

<tr>

<td>Mobile</td>
<td>Name</td>
<td>password</td>
<td>email</td>
<td>address</td>
<td>address1</td>
<td>city</td>
<td>pincode</td>
<td>Edit</td>
<td>Delete</td>
</tr>

<c:forEach items="${list}" var="u">


<tr>

<td>${u.getMobile()}</td>
<td>${u.getName()}</td>
<td>${u.getPassword()}</td>
<td>${u.getEmail()}</td>
<td>${u.getAddress()}</td>
<td>${u.getAddress1()}</td>
<td>${u.getCity()}</td>
<td>${u.getPincode()}</td>
<td><a href="editform.jsp?mobile=${u.getMobile()}">Edit</a></td>
<td><a href="deleteuser.jsp?mobile=${u.getMobile()}">Delete</a></td>

</tr>

</c:forEach>
</table>

</body>
</html>