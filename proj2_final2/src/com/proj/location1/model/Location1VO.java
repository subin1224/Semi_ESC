package com.proj.location1.model;

public class Location1VO {
	private String location1Code;
	private String location1Name;
	private int location1Order;
	
	public Location1VO() {
		super();
	}

	public Location1VO(String location1Code, String location1Name, int location1Order) {
		super();
		this.location1Code = location1Code;
		this.location1Name = location1Name;
		this.location1Order = location1Order;
	}

	public Location1VO(String location1Code, String location1Name) {
		super();
		this.location1Code = location1Code;
		this.location1Name = location1Name;
	}	

	public String getLocation1Code() {
		return location1Code;
	}

	public void setLocation1Code(String location1Code) {
		this.location1Code = location1Code;
	}

	public String getLocation1Name() {
		return location1Name;
	}

	public void setLocation1Name(String location1Name) {
		this.location1Name = location1Name;
	}

	public int getLocation1Order() {
		return location1Order;
	}

	public void setLocation1Order(int location1Order) {
		this.location1Order = location1Order;
	}

	@Override
	public String toString() {
		return "Location1VO [location1Code=" + location1Code + ", location1Name=" + location1Name + ", location1Order="
				+ location1Order + "]";
	}

	

	
	
}

