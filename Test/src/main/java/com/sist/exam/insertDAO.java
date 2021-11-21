package com.sist.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class insertDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String password="madang";
	
	public  int insertProduct(insertVO i){
		int re = -1;
		String sql = "insert into exam values(?,?,?)";
		Connection conn = null;
		PreparedStatement st = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			st = conn.prepareStatement(sql);
			st.setInt(1,i.getNo());
			st.setString(2, i.getName());
			st.setInt(3, i.getPrice());
			re = st.executeUpdate();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(st!=null) {
					st.close();
				}
				
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return re;
	}
	
}
