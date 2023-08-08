<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin_account</title>
</head>
<h1>Welcome Admin!</h1>
<body>
<%@page import="dao.UserDao,bean.UserBean"%>
<a href="ViewEmployees.jsp" onclick="return valid();" >HR Report</a><br/>
<a href="ViewCustomers.jsp" onclick="return valid();" >Customer Report</a><br/>
<br/><a href="logout.jsp"><button>Logout</button></a><br/>
</body>
</html>