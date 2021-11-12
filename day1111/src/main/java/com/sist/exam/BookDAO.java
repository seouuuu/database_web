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
	public ArrayList<BookVO> searchBook(String name){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="select bookname from book where bookid not in(select bookid from orders where custid=(select custid from customer where name=?))";
        try {
        	Class.forName(driver);
        	conn = DriverManager.getConnection(url,user,pwd);
        	pstmt = conn.prepareStatement(sql);
        	pstmt.setString(1,name);
        	rs = pstmt.executeQuery();
        	while(rs.next()) {
        		list.add(new BookVO(rs.getString(1)));
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
