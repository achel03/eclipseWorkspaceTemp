<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest"%>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import ="java.io.File"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 파일 업로드 결과 </title>
</head>
<body>
<%
	String filename="";
	int sizeLimit=15*1024*1024;
	String realPath = request.getServletContext().getRealPath("upload");
	File dir = new File(realPath);
	if(!dir.exists())dir.mkdirs();
	
	MultipartRequest mulpar = null;
	mulpar = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	filename = mulpar.getFilesystemName("photo");
%>

파일명: <%=filename %><br/>
<img src="${pageContext.request.contextPath }/upload/<%=filename %>">
폼에서 전송된 원래 파일명: <%=mulpar.getOriginalFileName("photo") %><br/>
업로드한 파일 경로: $ {pageContext.request.contextPath}/upload/ <%=filename %><br/>
물리적 저장경로 : <%=realPath %><br/>
</body>
