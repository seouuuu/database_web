package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.ExamVO;

public class ExamDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##sist";
	String pwd="sist";
	
	public ArrayList<ExamVO> listCustomer(String name){
		ArrayList<ExamVO> list = new ArrayList<ExamVO>();
		String sql = "select 극장이름,예약.상영관번호,영화제목,날짜,좌석번호,가격"
				+ " from 상영관, 극장, 예약,고객"
				+ " where 극장.극장번호= 상영관.극장번호 and"
				+ " 상영관.극장번호= 예약.극장번호 and"
				+ " 상영관.상영관번호 = 예약.상영관번호 and"
				+ " 예약.고객번호 = 고객.고객번호 and"
				+ " 이름=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new ExamVO(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getInt(5),rs.getInt(6)));
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(conn!=null) {
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
