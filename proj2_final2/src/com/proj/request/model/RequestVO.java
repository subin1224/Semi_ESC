package com.proj.request.model;

public class RequestVO {
	private int requestNo;
	private String adId;
	private String adPwd;
	private String brandName;
	private String unitName;
	private String loc1;
	private String loc2;
	private String address;
	private String unitTel;
	private String requestFlag;
	
	public RequestVO() {
		super();
	}

	public RequestVO(int requestNo, String adId, String adPwd, String brandName, String unitName, String loc1,
			String loc2, String address, String unitTel, String requestFlag) {
		super();
		this.requestNo = requestNo;
		this.adId = adId;
		this.adPwd = adPwd;
		this.brandName = brandName;
		this.unitName = unitName;
		this.loc1 = loc1;
		this.loc2 = loc2;
		this.address = address;
		this.unitTel = unitTel;
		this.requestFlag = requestFlag;
	}

	public int getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(int requestNo) {
		this.requestNo = requestNo;
	}

	public String getAdId() {
		return adId;
	}

	public void setAdId(String adId) {
		this.adId = adId;
	}

	public String getAdPwd() {
		return adPwd;
	}

	public void setAdPwd(String adPwd) {
		this.adPwd = adPwd;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getLoc1() {
		return loc1;
	}

	public void setLoc1(String loc1) {
		this.loc1 = loc1;
	}

	public String getLoc2() {
		return loc2;
	}

	public void setLoc2(String loc2) {
		this.loc2 = loc2;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUnitTel() {
		return unitTel;
	}

	public void setUnitTel(String unitTel) {
		this.unitTel = unitTel;
	}

	public String getRequestFlag() {
		return requestFlag;
	}

	public void setRequestFlag(String requestFlag) {
		this.requestFlag = requestFlag;
	}

	@Override
	public String toString() {
		return "RequestVO [requestNo=" + requestNo + ", adId=" + adId + ", adPwd=" + adPwd + ", brandName=" + brandName
				+ ", unitName=" + unitName + ", loc1=" + loc1 + ", loc2=" + loc2 + ", address=" + address + ", unitTel="
				+ unitTel + ", requestFlag=" + requestFlag + "]";
	}
	

}
