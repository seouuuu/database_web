package com.sist.vo;
// 사원번호,사원명,입사일,연봉,주민번호,아이디 출력

import java.util.Date;

public class memberVO {
	private int eno;
	private String ename;
	private Date hirdate;
	private int salary;
	private String jumin;
	private String id;
	public memberVO(int eno, String ename, Date hirdate, int salary, String jumin, String id) {
		super();
		this.eno = eno;
		this.ename = ename;
		this.hirdate = hirdate;
		this.salary = salary;
		this.jumin = jumin;
		this.id = id;
	}
	public memberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public Date getHirdate() {
		return hirdate;
	}
	public void setHirdate(Date hirdate) {
		this.hirdate = hirdate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
