<%@page import="com.BookStore.Dao.ProductDao"%>
<jsp:useBean id="u" class="com.BookStore.User.Products"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<%
ProductDao.delete(u);
response.sendRedirect("admin_view_product.jsp");
%>