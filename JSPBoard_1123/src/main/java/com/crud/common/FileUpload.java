package com.crud.common;
import com.crud.bean.*;
import com.crud.dao.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

public class FileUpload {
	public MemberVO uploadPhoto(HttpServletRequest request) {
		
		String filename="";
		int sizeLimit=15*1024*1024;
		
		String realPath = request.getServletContext().getRealPath("upload");
		
		File dir = new File(realPath);
		if(!dir.exists())dir.mkdirs();
		
		MemberVO one = null;
		MultipartRequest mulpar = null;
		try {
			mulpar = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			filename = mulpar.getFilesystemName("photo");
			one = new MemberVO();
			
			String sid = mulpar.getParameter("sid");
			if(sid!=null&&sid.equals(""))one.setSid(Integer.parseInt(sid));
			one.setUserid(mulpar.getParameter("userid"));
			one.setUsername(mulpar.getParameter("username"));
			one.setEmail(mulpar.getParameter("email"));
			one.setPhoto(mulpar.getParameter("photo"));
			one.setDetail(mulpar.getParameter("detail"));
			
			if(sid!=null&&sid.equals("")) {
				MemberDAO dao = new MemberDAO ();
				String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
				if(filename!=null&&oldfilename!=null)
					FileUpload.deleteFile(request,oldfilename);
				else if(filename==null&&oldfilename!=null)
					filename=oldfilename;
			}
			one.setPhoto(filename);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return one;
	}
	
	public static void deleteFile(HttpServletRequest request, String filename) {
		String filePath = request.getServletContext().getRealPath("upload");
		File f = new File(filePath+"/"+filename);
		if(f.exists()) f.delete();	
	}

}
