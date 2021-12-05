<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Calculator</title>
<jsp:useBean id= "calculator" class= "com.mycom.test.Calculator" />
<%
	out.println("10+20"+calculator.puls(10,20));
%>
<body>

</body>
</html>