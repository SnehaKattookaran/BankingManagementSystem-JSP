<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>customer_details</title>
</head>
<body>

<%@page import="dao.UserDao,bean.UserBean,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Customers Details</h1>

<%
List<UserBean> list=UserDao.getAllCustRecords();
request.setAttribute("list2",list);
%>

<table border="1" width="90%">
<tr><th>Account Number</th><th>Name</th><th>Place</th><th>Mobile Number</th><th>Account Type</th><th>Email</th><th>Password</th><th>Balance Amount</th></tr>
<c:forEach items="${list2}" var="u">
<tr><td>${u.getAcc_no()}</td><td>${u.getCust_name()}</td><td>${u.getCust_place()}</td><td>${u.getCust_mobileno()}</td><td>${u.getAcc_type()}</td><td>${u.getEmail()}</td><td>${u.getPassword()}</td><td>${u.getBal_amnt()}</td></tr>
</c:forEach>
</table><br/>
<input type="button" value="Back" onclick="history.back();">
</body>
</html>