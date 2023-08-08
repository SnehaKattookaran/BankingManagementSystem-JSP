<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR_account</title>
</head>
<h1>Welcome HR!</h1>
<body>
<%@page import="dao.UserDao,bean.UserBean"%>
<a href="EmpReg.html" onclick="return valid();" >Employee Registration</a><br/>
<a href="ViewEmployees.jsp" onclick="return valid();" >View all employee details</a><br/>
<br/><a href="logout.jsp"><button>Logout</button></a><br/>
</body>
</html>