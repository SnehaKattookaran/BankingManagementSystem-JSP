<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>account_details</title>
</head>
<body>
<%@page import="dao.UserDao,bean.UserBean"%>

<%
long acctno=(long)session.getAttribute("acctno");
UserBean ub=UserDao.getCustRecordByNumber(acctno);
%>

<h1>My Account Details</h1>
<table>
<tr><td>Name:</td><td><input type="text" name="cust_name" value="<%=ub.getCust_name() %>"/></td></tr>
<tr><td>Place:</td><td><input type="text" name="cust_place" value="<%= ub.getCust_place()%>"/></td></tr>
<tr><td>Mobile Number:</td><td><input type="text" name="cust_mobileno" value="<%= ub.getCust_mobileno()%>"/></td></tr>
<tr><td>Account Type:</td><td><input type="text" name="acc_type" value="<%= ub.getAcc_type()%>"/></td></tr>
<tr><td>Email:</td><td><input type="email" name="email" value="<%= ub.getEmail()%>"/></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" value="<%= ub.getPassword()%>"/> </td></tr>
<tr><td>Balance Amount:</td><td><input type="text" name="bal_amnt" value="<%= ub.getBal_amnt()%>"/> </td></tr>
<tr><td>Account Number:</td><td><input type="text" name="acc_no" value="<%= ub.getAcc_no()%>"/> </td></tr>
<tr><td><input type="button" value="Back" onclick="history.back()"></td></tr>
</table>
</body>
</html>