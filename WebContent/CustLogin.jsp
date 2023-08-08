<%@page import="dao.UserDao"%>
<jsp:useBean id="ub" class="bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>

<%
long acctno=UserDao.custlogin(ub);
if(acctno>0){
	session.setAttribute("acctno",acctno);
	response.sendRedirect("Customer.jsp");
}
else {
	response.sendRedirect("CustLoginfail.jsp");
}
%>
			