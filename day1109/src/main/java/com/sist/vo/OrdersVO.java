package com.sist.vo;

import java.util.Date;

public class OrdersVO {
	private int orderid;
	private int custid;
	private int bookid;
	private int saleprice;
	private Date orderdate;
	
	public OrdersVO(int orderid,int custid,int bookid,int saleprice,Date orderdate){
		//OrdersVO o = new OrderdsVO(1,1,1,8000,'2021/11/09'); 이런식으로 객체 생성 가능
		//이것만 만들면 OrdersVO o = new OrdersVO(); 불가능
		this.orderid = orderid;
		this.custid = custid;
		this.bookid = bookid;
		this.saleprice = saleprice;
		this.orderdate = orderdate;
	}
	
	//기본생성자(매개변수를 하나도 가지지 않는 생성자)
	//사용자가 생성자를 하나라도 만들기 시작하면 자바는 더이상 기본생성자를 제공하지 않으므로 필요하다면 만들어야함
	public OrdersVO() {
		super();
		
	}
	
	public void setOrderid(int orderid) {
		this.orderid = orderid;
		
	}
	
	public int getOrderid() {
		return orderid;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		return "OrdersVO [orderid=" + orderid + ", custid=" + custid + ", bookid=" + bookid + ", saleprice=" + saleprice
				+ ", orderdate=" + orderdate + "]";
	}
	
}
