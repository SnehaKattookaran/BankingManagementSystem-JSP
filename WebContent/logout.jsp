<%@page import="dao.UserDao"%>
<jsp:useBean id="ub" class="bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>

<%
response.sendRedirect("Index.html");
%>			