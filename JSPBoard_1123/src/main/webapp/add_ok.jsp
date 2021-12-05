<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO"%>
<%@page import="com.crud.bean.MemberVO"%>
<%@page import="com.crud.common.FileUpload"%>

<% request.setCharacterEncoding("utf-8"); %>

<%-- <jsp:useBean id="u" class="com.crud.bean.MemberVO" /> --%>
<jsp:setProperty property="*" name="u"/>

<%
	MemberDAO memberDAO = new MemberDAO();
	FileUpload up = new FileUpload();
	MemberVO u = up.uploadPhoto(request);
	int i = memberDAO.insertMember(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='list.jsp';
</script>