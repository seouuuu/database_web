package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.sist.vo.OrdersVO;

public class OrdersDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd="madang";
	String sql="insert into orders values(?,?,?,?,sysdate)";
	
	public int insertOrders(OrdersVO v) {
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,v.getOrderid());
			pstmt.setInt(2,v.getCustid());
			pstmt.setInt(3,v.getBookid());
			pstmt.setInt(4,v.getSaleprice());
			re = pstmt.executeUpdate();
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
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return re;
	}
}
