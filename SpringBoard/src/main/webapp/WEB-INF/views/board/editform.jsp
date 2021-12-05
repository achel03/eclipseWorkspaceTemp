<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.per.myapple.board.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id=request.getParameter("id");	
	BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form:form commandName="boardVO" method="POST" action="../editok">
	<form:hidden path="seq"/>
	<table id="edit">
		<tr><td>카테고리 </td><td><form:input path="category"/></td></tr>
		<tr><td>제목 </td><td><form:input path="title"/></td></tr>
		<tr><td>글쓴이 </td><td><form:input path="writer"/></td></tr>
		<tr><td>내용 </td><td><form:textarea path="content"/></td></tr>
	</table>
<input type="submit">등록하기 </input>
<input type="button" onclick="history.back()">취소하기 </input>
	</form:form>

</body>
</html>