<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>customer_account</title>
</head>
<h1>Welcome!</h1>
<body>
<a href="AcctDetails.jsp" onclick="return valid()" ><button>View My Account Details</button></a><br/><br/>
<form action="CashTrans.jsp" method="post">
<table> 
<tr></tr>
<tr><td>Enter Deposit Amount:</td><td><input type="text" name="deposit"/></td><td><input type="submit" value="DEPOSIT" name="deposit"/></td></tr>  
<tr></tr>
<tr><td>Enter Withdraw Amount:</td><td><input type="text" name="withdrawal"/></td><td><input type="submit" value="WITHDRAW" name="withdrawal"/></td></tr>
</table>
</form>
<br/><a href="logout.jsp"><button>Logout</button></a><br/>
</body>
</html>