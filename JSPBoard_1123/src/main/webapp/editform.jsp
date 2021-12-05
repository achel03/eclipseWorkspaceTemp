<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<body>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id=request.getParameter("id");	
	MemberVO u=memberDAO.getOne(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="edit_ok.jsp" method="post">
<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
<table>
<tr><td>ID:</td><td><input type="text" name="id" value="<%=u.getUserid()%>"/></td></tr>
<tr><td>PASSWORD:</td><td><input type="text" name="pw" value="<%=u.getPassword()%>"/></td></tr>
<tr><td>USERNAME:</td><td><input type="text" name="username" value="<%=u.getUsername()%>"/></td></tr>
<tr><td>EMAIL:</td><td><input type="text" name="email" value="<%=u.getEmail()%>"/></td></tr>
<tr><td>PHOTO:</td>
<form method='post' action='fileload.jsp' enctype='multipart/form-data'>
<input type="file" name="photo" value="<%=u.getPhoto()%>">
<input type="submit" name="upload">
</form></tr>
<tr><td>SELFINTRODUCTION:</td><td><textarea cols="50" rows="5" name="detail"> value="<%=u.getDetail()%>"</textarea></td></tr>
<tr><td>BLOGURL:</td><td><input type="text" name="blogurl" value="<%=u.getBlogurl()%>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Post"/>
<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>