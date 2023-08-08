<%@page import="dao.UserDao"%>
<jsp:useBean id="ub" class="bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>

<%
int i=UserDao.empsave(ub);
if(i>0){
    response.sendRedirect("ViewEmployees.jsp");
}
%>