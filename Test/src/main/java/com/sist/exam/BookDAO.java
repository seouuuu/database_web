package com.sist.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String pwd = "madang";

	public ArrayList<BookVO> searchBook(String publisher){
		String sql = "select * from book where publisher =? order by price desc";
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, publisher);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BookVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
			}catch (Exception e) {
			}
		}
		return list;
	}
}
