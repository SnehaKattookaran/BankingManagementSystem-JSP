<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>hr_report</title>
</head>
<body>

<%@page import="dao.UserDao,bean.UserBean,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Employee Details</h1>

<%
List<UserBean> list=UserDao.getAllEmpRecords();
request.setAttribute("list1",list);
%>

<table border="1" width="90%">
<tr><th>Id</th><th>Name</th><th>Place</th><th>Designation</th><th>Age</th><th>Qualification</th><th>Basic Pay</th><th>DA</th><th>HRA</th><th>Salary</th></tr>
<c:forEach items="${list1}" var="u">
<tr><td>${u.getEmp_id()}</td><td>${u.getEmp_name()}</td><td>${u.getEmp_place()}</td><td>${u.getEmp_designation()}</td><td>${u.getEmp_age()}</td><td>${u.getEmp_qualification()}</td><td>${u.getBasic_pay()}</td><td>${u.getDA()}</td><td>${u.getHRA()}</td><td>${u.getEmp_salary()}</td></tr>
</c:forEach>
</table><br/>
<input type="button" value="Back" onclick="history.back();">
</body>
</html>