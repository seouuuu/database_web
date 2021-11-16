package com.sist.vo;
//��������� ���̸��� �Է¹޾� �� ���� ������ �����̸�,�󿵰���ȣ,��ȭ����,��¥,�¼���ȣ,������ ���

import java.util.Date;

public class ExamVO {
	private String theater;
	private int cinemanumber;
	private String title;
	private Date date;
	private int seatnumber;
	private int price;
	public ExamVO(String theater, int cinemanumber, String title, Date date, int seatnumber, int price) {
		super();
		this.theater = theater;
		this.cinemanumber = cinemanumber;
		this.title = title;
		this.date = date;
		this.seatnumber = seatnumber;
		this.price = price;
	}
	public ExamVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public int getCinemanumber() {
		return cinemanumber;
	}
	public void setCinemanumber(int cinemanumber) {
		this.cinemanumber = cinemanumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getSeatnumber() {
		return seatnumber;
	}
	public void setSeatnumber(int seatnumber) {
		this.seatnumber = seatnumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
