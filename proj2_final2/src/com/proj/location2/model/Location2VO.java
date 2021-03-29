package com.proj.location2.model;

public class Location2VO {
	private int location2Code;
	private String location2Name;
	private String location1Code;
	
	public Location2VO() {
		super();
	}

	public Location2VO(int location2Code, String location2Name, String location1Code) {
		super();
		this.location2Code = location2Code;
		this.location2Name = location2Name;
		this.location1Code = location1Code;
	}

	public int getLocation2Code() {
		return location2Code;
	}

	public void setLocation2Code(int location2Code) {
		this.location2Code = location2Code;
	}

	public String getLocation2Name() {
		return location2Name;
	}

	public void setLocation2Name(String location2Name) {
		this.location2Name = location2Name;
	}

	public String getLocation1Code() {
		return location1Code;
	}

	public void setLocation1Code(String location1Code) {
		this.location1Code = location1Code;
	}

	@Override
	public String toString() {
		return "Location2VO [location2Code=" + location2Code + ", location2Name=" + location2Name + ", location1Code="
				+ location1Code + "]";
	}
	
	
	
}
