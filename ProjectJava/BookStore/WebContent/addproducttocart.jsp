<%@page import="com.BookStore.Dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.BookStore.Dao.*,com.BookStore.User.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String id=(String)session.getAttribute("idbook");
int idb=Integer.parseInt(id);



String x=(String)session.getAttribute("mobno");
long aa=Long.parseLong(x);


String qt=(String)session.getAttribute("qt");
int intqt=Integer.parseInt(qt);

String dprice=(String)session.getAttribute("dprice");
int dp=Integer.parseInt(dprice);



int z=CartDao.save(aa, idb, intqt,dp);

if(z!=0)
{
	response.sendRedirect("addedtocart.jsp");
}

	

%>

</body>
</html>