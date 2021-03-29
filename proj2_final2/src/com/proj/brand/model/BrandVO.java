package com.proj.brand.model;

public class BrandVO {
	private int brandNo;
	private String brandName;
	private String adId;
	private String adPwd;
	private String adTel;
	private String adFlag;
	
	public BrandVO() {
		super();
	}

	public BrandVO(int brandNo, String brandName, String adId, String adPwd, String adTel, String adFlag) {
		super();
		this.brandNo = brandNo;
		this.brandName = brandName;
		this.adId = adId;
		this.adPwd = adPwd;
		this.adTel = adTel;
		this.adFlag = adFlag;
	}
	
	public BrandVO(String brandName, String adId, String adPwd, String adTel) {
		super();
		this.brandName = brandName;
		this.adId = adId;
		this.adPwd = adPwd;
		this.adTel = adTel;
	}	

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
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

	public String getAdTel() {
		return adTel;
	}

	public void setAdTel(String adTel) {
		this.adTel = adTel;
	}

	public String getAdFlag() {
		return adFlag;
	}

	public void setAdFlag(String adFlag) {
		this.adFlag = adFlag;
	}

	@Override
	public String toString() {
		return "BrandVO [brandNo=" + brandNo + ", brandName=" + brandName + ", adId=" + adId + ", adPwd=" + adPwd
				+ ", adTel=" + adTel + ", adFlag=" + adFlag + "]";
	}

}
