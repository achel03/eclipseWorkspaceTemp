<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
   <%@page import="com.per.myapple.board.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자유게시판</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list">
<tr>
	<th>Id</th>
	<th>제목 </th>
	<th>글쓴이 </th>
	<th>내용 </th>
	<th>등록일 </th>
	<th>수정 </th>
	<th>삭제 </th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.seq}</td>
		<td>${u.title}</td>
		<td>${u.writer}</td>
		<td>${u.content}</td>
		<td>${u.regdate}</td>
		<td><a href="editform/${u.seq}">글 수정 </a></td>
		<td><a href="javascript:delete_ok('${u.seq}')">글 삭제 </a></td>
	</tr>
</c:forEach>
</table>
<br/><button type="button" onclick="location.href='add'">새 글 쓰기 </button>
</body>
<script>
function delete_ok(id){
	var a = confirm("정말 삭제하시겠습니까?");
	if (a) location.href='deleteok/'+id;
}	
</script>
</html>