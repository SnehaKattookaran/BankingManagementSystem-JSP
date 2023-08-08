<%@page import="dao.UserDao"%>
<jsp:useBean id="ub" class="bean.UserBean"></jsp:useBean>
<jsp:setProperty property="*" name="ub"/>

<%
long acctno=(long)session.getAttribute("acctno");
int status=UserDao.cashtrans(ub,acctno);
if (status == 1) 
	 response.sendRedirect("DepositSuccess.jsp");
else if (status == 2) 
	 response.sendRedirect("WithdrawalSuccess.jsp");
else if (status == 3) 
	 response.sendRedirect("WithdrawalFailure.jsp");
%>
