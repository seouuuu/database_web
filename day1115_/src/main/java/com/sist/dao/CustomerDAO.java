package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.sist.vo.CustomerVO;

public class CustomerDAO {
	//����ȣ,���̸�,�ּ�,��ȭ��ȣ�� �Է¹޾�
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd="madang";
	
	public int insertCustomer(CustomerVO c) {
		int re =-1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement("insert into customer values(?,?,?,?)");
			pstmt.setInt(1,c.getCustid());
			pstmt.setString (2,c.getName());
			pstmt.setString (3,c.getAddress());
			pstmt.setString (4,c.getPhone());
			re = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
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
