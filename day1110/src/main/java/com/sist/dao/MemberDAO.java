package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.MemberVO;

public class MemberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String pwd = "madang";
	
	public ArrayList<MemberVO> searchLoc(String dloc){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="select eno,ename,salary,comm,salary+comm,e.dno,dname "
        		+ "from emp e,dept d "
        		+ "where e.dno = d.dno and "
        		+ "dloc=? "
        		+ "order by dname,ename";
        try {
        	Class.forName(driver);
        	conn = DriverManager.getConnection(url,user,pwd);
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1,dloc);
        	rs = pstmt.executeQuery();
        	while(rs.next()) {
        		//MemberVO(int eno, String ename, int salary, int comm, int real, int dno, String dname)
        		list.add(new MemberVO(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getString(7)));
        	}
        }catch (Exception e) {
        	System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(rs != null) {
					rs.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
        return list;
	}
}
