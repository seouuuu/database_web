package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String pwd = "madang";
	
	//���̸��� �Ű������� ���޹޾� �� ���� �ֹ����� �ʴ� �����̸����� ��ȯ�ϴ� �޼ҵ� ����
	public ArrayList<String> getNotPurchased(String name){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select bookname from book "
				+ "where bookid not in (select bookid from orders "
				+ "where custid = (select custid from customer where name = ?))";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		}catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn  != null) {
					conn.close();
				}
				
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
}
