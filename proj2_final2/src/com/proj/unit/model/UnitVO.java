package com.proj.unit.model;

import java.sql.Timestamp;

public class UnitVO {
	private int unitNo;
	private String unitName;
	private int brandNo;
	private String unitAddress;
	private String unitTel;
	private double latitude;
	private double longitude;
	private Timestamp unitRegdate;
	private String location1Code;
	private int location2Code;
	private String unitUrl;
	private String unitImg;
	
	public UnitVO() {
		super();
	}

	public UnitVO(int unitNo, String unitName, int brandNo, String unitAddress, String unitTel, double latitude,
			double longitude, Timestamp unitRegdate, String location1Code, int location2Code, String unitUrl,
			String unitImg) {
		super();
		this.unitNo = unitNo;
		this.unitName = unitName;
		this.brandNo = brandNo;
		this.unitAddress = unitAddress;
		this.unitTel = unitTel;
		this.latitude = latitude;
		this.longitude = longitude;
		this.unitRegdate = unitRegdate;
		this.location1Code = location1Code;
		this.location2Code = location2Code;
		this.unitUrl = unitUrl;
		this.unitImg = unitImg;
	}

	public int getUnitNo() {
		return unitNo;
	}

	public void setUnitNo(int unitNo) {
		this.unitNo = unitNo;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public String getUnitAddress() {
		return unitAddress;
	}

	public void setUnitAddress(String unitAddress) {
		this.unitAddress = unitAddress;
	}

	public String getUnitTel() {
		return unitTel;
	}

	public void setUnitTel(String unitTel) {
		this.unitTel = unitTel;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public Timestamp getUnitRegdate() {
		return unitRegdate;
	}

	public void setUnitRegdate(Timestamp unitRegdate) {
		this.unitRegdate = unitRegdate;
	}

	public String getLocation1Code() {
		return location1Code;
	}

	public void setLocation1Code(String location1Code) {
		this.location1Code = location1Code;
	}

	public int getLocation2Code() {
		return location2Code;
	}

	public void setLocation2Code(int location2Code) {
		this.location2Code = location2Code;
	}

	public String getUnitUrl() {
		return unitUrl;
	}

	public void setUnitUrl(String unitUrl) {
		this.unitUrl = unitUrl;
	}

	public String getUnitImg() {
		return unitImg;
	}

	public void setUnitImg(String unitImg) {
		this.unitImg = unitImg;
	}

	@Override
	public String toString() {
		return "UnitVO [unitNo=" + unitNo + ", unitName=" + unitName + ", brandNo=" + brandNo + ", unitAddress="
				+ unitAddress + ", unitTel=" + unitTel + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", unitRegdate=" + unitRegdate + ", location1Code=" + location1Code + ", location2Code="
				+ location2Code + ", unitUrl=" + unitUrl + ", unitImg=" + unitImg + "]";
	}
	
	
}
