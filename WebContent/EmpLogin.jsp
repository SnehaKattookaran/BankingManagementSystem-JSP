<%@page import="dao.UserDao"%>
<jsp:useBean id="ub" class="bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>

<%
int position=UserDao.emplogin(ub);
if (position == 1) 
	 response.sendRedirect("Admin.jsp");
else if (position == 2) 
	 response.sendRedirect("HR.jsp");
else
	 response.sendRedirect("EmpLoginfail.jsp");
%>
			