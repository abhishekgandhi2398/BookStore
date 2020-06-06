<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.BookStore.Dao.ProductDao"%>
<!DOCTYPE html>


<jsp:useBean id="u" class="com.BookStore.User.Products"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int i=ProductDao.save(u);
if(i>0)
{
	response.sendRedirect("2.jsp");
}
else
{
	out.write("Not Done");
}

%>



</body>
</html>