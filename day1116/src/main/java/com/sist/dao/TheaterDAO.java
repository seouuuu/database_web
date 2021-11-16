package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.TheaterVO;

public class TheaterDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user="c##sist";
	String pwd="sist";
	
	//�����̸��� �Ű������� ���޹޾� �ش������ ���ó�¥�� �� ������ ��ȯ�ϴ� �޼ҵ� ����
	public int getTotalByCinemaName(String cinemaName) {
		int total =0;
		String sql="select sum(count(*)*"
				+ "(select ���� from �󿵰� where ����.�����ȣ=�󿵰�.�����ȣ and ����.�󿵰���ȣ=�󿵰�.�󿵰���ȣ)) total"
				+ " from ���� "
				+ " where to_char(��¥,'yyyy/mm/dd')=to_char(sysdate,'yyyy/mm/dd') and "
				+ " �����ȣ=(select �����ȣ from ���� where �����̸�=?)"
				+ " group by �����ȣ,�󿵰���ȣ"
				+ " order by �����ȣ,�󿵰���ȣ";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs = pstmt.executeQuery();
			//�ϳ��� ��,�� �̱� ������ Ŀ���� �ű���� while�� �ƴ� if ���
			if(rs.next()) {
				total = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
		}finally {
			try {
				if(conn!= null) {
					conn.close();
				}
				if(rs != null) {
					rs.close();
				}
				if(pstmt!= null) {
					pstmt.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return total;
	}
	
	
	//�����̸��� �Ű������� ���޹޾� �� ���忡�� ���� ��¥�� ���ϴ� �󿵰��������� ArrayList�� ��� ��ȯ�ϴ� �޼ҵ� ����
	public ArrayList<TheaterVO> listTheater(String cinemaName){
		ArrayList<TheaterVO> list = new ArrayList<TheaterVO>();
		String sql="select �󿵰�.�����ȣ,�󿵰�.�󿵰���ȣ,��ȭ����,����,�¼��� from �󿵰�,���� where (�󿵰�.�����ȣ,�󿵰���ȣ) in"
				+ "(select distinct �����ȣ,�󿵰���ȣ from ���� where to_char(��¥,'yyyy/mm/dd')=to_char(sysdate,'yyyy/mm/dd')) and"
				+ " �󿵰�.�����ȣ = ����.�����ȣ and"
				+ " �����̸�=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(new TheaterVO(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getInt(4),rs.getInt(5)));
			}
		}catch (Exception e) {
			System.out.println("���ܹ߻�:"+e.getMessage());
		}finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(rs!=null) {
					rs.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
}
