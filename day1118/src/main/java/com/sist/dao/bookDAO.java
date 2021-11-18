package com.sist.dao;
//BOOKID BOOKNAME             PUBLISHER     PRICE

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.bookVO;

public class bookDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##madang";
	String pwd="madang";
	
	public ArrayList<bookVO> listbook(String name){
		ArrayList<bookVO> list = new ArrayList<bookVO>();
		String sql = "select * from book"
				+ " where bookid in("
				+ " select bookid from"
				+ " orders "
				+ " where custid =(select custid from ("
				+ " select custid, count(bookid)"
				+ " from ordersa"
				+ " where bookid in (select bookid from orders where custid = (select custid from customer where name =?))"
				+ " and custid !=(select custid from customer where name =?)"
				+ " group by custid"
				+ " order by count(bookid) desc) where rownum =1)"
				+ " union"
				+ " select bookid from("
				+ " select bookid,count(bookid)"
				+ " from orders"
				+ " group by bookid"
				+ " order by count(bookid) desc)"
				+ " where rownum <=3"
				+ " minus"
				+ " select bookid from orders where custid = (select custid from customer where name =?))";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, name);
			pstmt.setString(3, name);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new bookVO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4)));
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
				if ( rs!= null) {
					rs.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
