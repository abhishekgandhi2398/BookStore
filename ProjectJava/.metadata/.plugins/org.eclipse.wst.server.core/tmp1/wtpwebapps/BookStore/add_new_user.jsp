
<%@ page import="com.BookStore.Dao.UserDao" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:useBean id="u" class="com.BookStore.User.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int i=UserDao.save(u);
if(i>0)
{
	response.sendRedirect("1.jsp");
}
else
{
	response.sendRedirect("ulonin.jsp");
}

%>

</body>
</html>