package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.memberVO;

public class memberDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd="madang";
	
	public ArrayList<memberVO> listmember(String name,int month){
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		String sql = "select e.eno,e.ename,e.hirdate,(e.salary+e.comm)*12,rpad(substr(e.jumin,1,8),14,'*') jumin,substr(e.email,1,instr(e.email,'@')-1) id"
				+ " from emp e, emp m"
				+ " where e.mgr = m.eno and"
				+ " m.ename=?and"
				+ " months_between(sysdate,e.hirdate)>=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2,month);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new memberVO(rs.getInt(1),rs.getString(2),rs.getDate(3),rs.getInt(4),rs.getString(5),rs.getString(6)));
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(conn!= null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(rs != null) {
					rs.close();
				}
			}catch (Exception e) {
			}
		}
		return list;
	}
}
