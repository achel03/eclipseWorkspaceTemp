<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="add_ok.jsp" method="post">
<table>
<tr><td>ID:</td><td><input type="text" name="id"/></td></tr>
<tr><td>PASSWORD:</td><td><input type="text" name="pw"/></td></tr>
<tr><td>USERNAME:</td><td><input type="text" name="username"/></td></tr>
<tr><td>EMAIL:</td><td><input type="text" name="email"/></td></tr>
<tr><td>PHOTO:</td><td><input type="text" name="photo"/></td></tr>
<tr><td>SELFINTRODUCTION:</td><td><textarea cols="50" rows="5" name="detail"></textarea></td></tr>
<tr><td>BLOGURL:</td><td><input type="text" name="blogurl"/></td></tr>
<tr><td><a href="list.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
</table>
</form>

</body>
</html>