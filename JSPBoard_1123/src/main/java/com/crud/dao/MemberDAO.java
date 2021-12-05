package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.crud.bean.MemberVO;
import com.crud.common.JDBCUtil;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String MEMBER_INSERT = "insert into MEMBER (userid, password, username, email, photo, detail, blogurl) values (?,sha1(?),?,?,?,?)";
	private final String MEMBER_UPDATE = "update MEMBER set userid=?, password=?, username=?  email=? photo=? detail=? blogurl=? where sid=?";
	private final String MEMBER_DELETE = "delete from MEMBER  where sid=?";
	private final String MEMBER_GET = "select * from MEMBER  where sid=?";
	private final String MEMBER_LIST = "select * from MEMBER order by sid desc";

	public int insertMember(MemberVO vo) {
		int result = 0;
		System.out.println("===> JDBC로 insertMEMBER() 기능 처리");
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(MEMBER_INSERT);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getUsername());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getPhoto());
			stmt.setString(6, vo.getDetail());
			stmt.setString(7, vo.getBlogurl());
			result=stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 글 삭제
	public void deleteMember(MemberVO vo) {
		System.out.println("===> JDBC로 deleteMEMBER() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateMember(MemberVO vo) {
		System.out.println("===> JDBC로 updateMEMBER() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			stmt.setString(1, vo.getUserid());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getUsername());
			stmt.setString(4, vo.getEmail());
			stmt.setString(5, vo.getPhoto());
			stmt.setString(6, vo.getDetail());
			stmt.setString(7, vo.getBlogurl());
			
			System.out.println(vo.getUserid() + "-" + vo.getUsername() + "-" + vo.getEmail());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public MemberVO getOne(int sid) {
		MemberVO one = new MemberVO();
		System.out.println("===> JDBC로 getMEMBER() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setPhoto(rs.getString("photo"));
				one.setDetail(rs.getString("detail"));
				one.setBlogurl(rs.getString("blogurl"));
				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public ArrayList<MemberVO> getList(){
		ArrayList<MemberVO> list = null;
		conn = JDBCUtil.getConnection();
		System.out.println("===> JDBC로 getList() 기능 처리");
		try {
			stmt = conn.prepareStatement(MEMBER_LIST);
			rs = stmt.executeQuery();
			list = new ArrayList<MemberVO>();
			MemberVO one = new MemberVO();
			while(rs.next()) {
				one = new MemberVO();
				one.setSid(rs.getInt("sid"));
				one.setUserid(rs.getString("userid"));
				one.setUsername(rs.getString("username"));
				one.setEmail(rs.getString("email"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	public String getPhotoFilename(int sid) {
		String filename  = null;
		conn = JDBCUtil.getConnection();
		try {
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filename;
	}
}
