package com.proj.coupon.model;

import java.util.Date;

public class CouponVO {
	private int couponNo;
	private String couponCode;
	private int discount;
	private Date startDate;
	private Date endDate;
	private String couponName;
	
	public CouponVO() {
		super();
	}
	public CouponVO(int couponNo, String couponCode, int discount, Date startDate, Date endDate, String couponName) {
		super();
		this.couponNo = couponNo;
		this.couponCode = couponCode;
		this.discount = discount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.couponName = couponName;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	@Override
	public String toString() {
		return "CouponVO [couponNo=" + couponNo + ", couponCode=" + couponCode + ", discount=" + discount
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", couponName=" + couponName + "]";
	}

}
