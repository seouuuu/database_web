package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.sist.vo.BookVO;

public class BookDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String pwd = "madang";
	
//추가할 도서의 정보를 BookVO의 매개변수로 전달받아 데이터베이스 테이블 book에 insert를 수행하는 메소드 정의
	public int insertBook(BookVO b) {
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt=conn.prepareStatement("insert into book values(?,?,?,?)");
			pstmt.setInt(1, b.getBookid());
			pstmt.setString(2, b.getBookname());
			pstmt.setString(3, b.getPubliser());
			pstmt.setInt(4, b.getPrice());
			re = pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}if(conn != null) {
					conn.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return re;
	}
}
