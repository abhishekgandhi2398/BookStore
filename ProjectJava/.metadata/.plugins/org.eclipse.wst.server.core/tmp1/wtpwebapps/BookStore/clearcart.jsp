<%@page import="com.BookStore.Dao.CartDao"%>

<%
String m=(String)session.getAttribute("mobno");
long mo=Long.parseLong(m);
CartDao.deleteall(mo);
response.sendRedirect("vc.jsp");
%>