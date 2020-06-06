<%@ page import="com.BookStore.Dao.UserDao" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="u" class="com.BookStore.User.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%

String mob=request.getParameter("mobile");
out.write(mob);
session.setAttribute("mobno",mob);

%>

<%

boolean a=false;
a=UserDao.singinvals(u);

if(a==true)
{
	response.sendRedirect("1.jsp");
}
else
{
	out.write("Not Done");
	response.sendRedirect("ilogin.jsp");
}

%>

</body>
</html>