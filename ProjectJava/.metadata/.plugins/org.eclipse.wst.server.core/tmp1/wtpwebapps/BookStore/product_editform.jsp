<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BookStore.Dao.ProductDao,com.BookStore.User.Products,java.util.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>




</head>
<body>

<%
String id=request.getParameter("idbooks");
Products u=ProductDao.getRecordById(Integer.parseInt(id));

%>











<form method="post" action="product_edit.jsp" onsubmit="return validate()">

      <div class="container">
             <h2>Book Entry</h2>
             

        <div class="form-group">
               <label for="bname">Book Name</label>
               <input type="text" class="form-control" id="name" placeholder="Enter Book Name" name="name" onblur="bk_name()" value="<%=u.getName()%>">
               <div id="bnamemsg"></div>
       </div>
       <div class="form-group">
              <label for="author">Author</label>
              <input type="text" class="form-control" id="author" placeholder="Author name" name="author" onblur="bk_auther()" value="<%=u.getAuthor()%>">
              <div id="bauthmsg"></div>
        </div>
        <div class="form-group">
                <label for="description">
                    Comments:</label>
                <textarea class="form-control" type="textarea" name="comments" id="comments" placeholder="Description for Book" maxlength="6000" rows="7" onblur="bk_comm()" value="<%=u.getComments()%>"></textarea>
              
                <div id="bcomm"></div>

            </div>

            <div class="form-group">
                    <label for="price">Original Price</label>
                    <input type="number" class="form-control" id="oprice" placeholder="Book price" name="oprice" onblur="bk_price()" value="<%=u.getOprice()%>">
                    <div id="bpr"></div>

              </div>
              <div class="form-group">
                    <label for="Discount price">Discounted Price</label>
                    <input type="number" class="form-control" id="dprice" placeholder="Discount Price" name="dprice" onblur="bk_price_dis()" value="<%=u.getDprice()%>">
                    <div id="bpr_dis"></div>

              </div>
              <div class="form-group">
                  <label for="frontcover">Front Cover of Book</label><br>
              <input type="file" name="fcover" id="fcover" accept="image/*" required="required" value="<%=u.getFcover()%>">
            </div>

            <div class="form-group">
                    <label for="backcover">Back Cover of Book</label><br>
                <input type="file" name="bcover" id="bcover" accept="image/*" required="required" value="<%=u.getBcover()%>">
              </div>
            
        <input type="submit" value="Register" class="btn btn-dark form-control" onclick="validate()">
        <br>
        <div id="sub"></div>

        <br>
        <br>
        <br>
        <br>
        
       </div>
       
    </div>

</form>



















</body>
</html>