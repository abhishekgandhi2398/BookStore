<%@page import="com.BookStore.Dao.CartDao"%>
<jsp:useBean id="u" class="com.BookStore.User.Cart"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<%

String qt=request.getParameter("qty");
int uqt=Integer.parseInt(qt);

String ib=(String)session.getAttribute("updid");
int idb=Integer.parseInt(ib);

CartDao.update(uqt,idb);
response.sendRedirect("vc.jsp");
%>
