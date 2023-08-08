<%@page import="dao.UserDao"%>
<jsp:useBean id="ub" class="bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>

<%
int i=UserDao.custsave(ub);
if(i>0){
response.sendRedirect("CustLogin.html");
}
%>