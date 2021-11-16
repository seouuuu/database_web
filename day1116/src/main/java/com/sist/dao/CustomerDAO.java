package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.BookVO;
import com.sist.vo.CustomerVO;

public class CustomerDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd="madang";
	
	public ArrayList<CustomerVO> listCustomer(){
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		String sql = "select * from customer";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new CustomerVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(conn !=null) {
					conn.close();
				}
				if( pstmt != null) {
					pstmt.close();
				}
				if(rs != null) {}
				rs.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
