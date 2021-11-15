package com.sist.vo;

public class BookVO {
	private int bookid;
	private String bookname;
	private String publiser;
	private int price;
	public BookVO(int bookid, String bookname, String publiser, int price) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.publiser = publiser;
		this.price = price;
	}
	public BookVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getPubliser() {
		return publiser;
	}
	public void setPubliser(String publiser) {
		this.publiser = publiser;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
