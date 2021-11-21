package com.sist.exam;

public class insertVO {
	private int no;
	private String name;
	private int price;
	public insertVO(int no, String name, int price) {
		super();
		this.no = no;
		this.name = name;
		this.price = price;
	}
	public insertVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
