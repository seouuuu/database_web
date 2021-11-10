package com.sist.vo;
//사원번호,이름,급여,수당,실수령액,부서번호,부서명
public class MemberVO {
	private int eno;
	private String ename;
	private int salary;
	private int comm;
	private int real;
	private int dno;
	private String dname;
	public MemberVO(int eno, String ename, int salary, int comm, int real, int dno, String dname) {
		super();
		this.eno = eno;
		this.ename = ename;
		this.salary = salary;
		this.comm = comm;
		this.real = real;
		this.dno = dno;
		this.dname = dname;
	}
	public MemberVO() {
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
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getComm() {
		return comm;
	}
	public void setComm(int comm) {
		this.comm = comm;
	}
	public int getReal() {
		return real;
	}
	public void setReal(int real) {
		this.real = real;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
}
