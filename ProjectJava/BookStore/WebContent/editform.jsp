<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BookStore.Dao.UserDao,com.BookStore.User.*,java.util.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/js/bootstrap.min.js" ></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color: #B7CEEC;">



<%

String mob=request.getParameter("mobile");
User u=UserDao.getRecordById(Long.parseLong(mob));

%>


<div style="background-color: #B7CEEC; height: 100px; width: 100%;" class="d-flex justify-content-center  align-items-center">





<a href="add_product.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">Add Products</a><br>

<a href="admin_view_product.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">View Products</a>
<br>

<a href="vieworderadmin.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">View Order</a>
<br>

<a href="admin_view_users.jsp" class="btn btn-dark" style="height: 80px; width: 250px;">View Users</a>

</div>





<form action="edituser.jsp" onsubmit="return validate()">
      <div class="container">
             <h2>Registration</h2>
       <div class="form-group" >
             <label for="mobile">Mobile-Number *</label>
             <input type="hidden" class="form-control" id="mobile" placeholder="Number" onblur="ch_number()"name="mobile" value="<%=u.getMobile()%>">
        <div id="pnumber"></div>
        </div>
        
        
        
       <div class="form-group" >
             <label for="mobile">Name *</label>
             <input type="text" class="form-control" id="name" placeholder="Number" onblur="ch_number()" name="name">
        <div id="pnumber"></div>
        </div>
        
        
        <div class="form-group" >
               <label for="Pwd">Password *</label>
               <input type="text" class="form-control" id="password" placeholder="Enter password"  onblur="ch_pass()" name="password" value="<%=u.getPassword()%>">
       <div id="passerr"></div>
       </div>
       <div class="form-group">
               <label for="email">Email *</label>
               <input type="email" class="form-control" id="email" placeholder="Enter email" onblur="ch_email()" name="email" value="<%=u.getEmail()%>">
         <div id="ch_email"></div>
         </div>      
        <div class="form-group">
             <label for="address">Address Line 1 *</label>
             <input type="text" class="form-control" id="address" placeholder="Enter the full address" name="address" onblur="ch_address()" value="<%=u.getAddress()%>">
             <div id="errp"></div>
        </div>
        <div class="form-group">
             <label for="address">Address Line 2(optional)</label>
             <input type="text" class="form-control" id="address1" placeholder="Enter the full address" name="address1" onblur="ch_address()" value="<%=u.getAddress1()%>">
             <div id="errp"></div>
        </div>
        <div class="form-group">
             <label for="city">City *</label>
             <input type="text" class="form-control" id="city" placeholder="Enter city" name="city" required value="<%=u.getCity()%>">
        </div>
        <div class="form-group">
             <label for="pincode">Pincode *</label>
             <input type="number" class="form-control" id="pincode" placeholder="Enter pincode" name="pincode" onblur="ch_pincode()" value="<%=u.getPincode()%>">
             <div id="pinmess"></div>
        </div>
        
        <input type="submit" value="submit" class="btn btn-dark form-control" onclick="validate()">
       <br>
        <div id="sub"></div>
       
       </div>
       
       <br><br><br><br><br>
       
</form>











































</body>
</html>