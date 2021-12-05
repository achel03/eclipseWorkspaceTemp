<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO"%>
<%@page import="com.crud.common.FileUpload"%>
<%@page import="com.crud.bean.MemberVO"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberDAO memberDAO = new MemberDAO();
		String filename = memberDAO.getPhotoFilename(id);
		if(filename!=null){
			FileUpload.deleteFile(request,filename);
		}
		memberDAO.deleteMember(id);
	}
	response.sendRedirect("list.jsp");
%>