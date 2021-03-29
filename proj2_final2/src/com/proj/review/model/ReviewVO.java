package com.proj.review.model;

import java.sql.Timestamp;

public class ReviewVO {
	private int	reviewNo;
	private int	userNo;
	private int	roomNo;
	private String reTitle;
	private	String reContent;
	private	int likeCount;
	private double rating;
	private	Timestamp reRegdate;
	private int reHit;
	private String themeName;
	private String userId;
	private String brandName;
	private String unitName;
	private int reserveno;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int reviewNo, int userNo, int roomNo, String reTitle, String reContent, int likeCount,
			double rating, Timestamp reRegdate, int reHit, String themeName, String userId, String brandName,
			String unitName, int reserveno) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.roomNo = roomNo;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.likeCount = likeCount;
		this.rating = rating;
		this.reRegdate = reRegdate;
		this.reHit = reHit;
		this.themeName = themeName;
		this.userId = userId;
		this.brandName = brandName;
		this.unitName = unitName;
		this.reserveno = reserveno;
	}



	public ReviewVO(int reviewNo, String reTitle, double rating, Timestamp reRegdate, String themeName, String userId) {
		super();
		this.reviewNo = reviewNo;
		this.reTitle = reTitle;
		this.rating = rating;
		this.reRegdate = reRegdate;
		this.themeName = themeName;
		this.userId = userId;
	}



	public ReviewVO(int reviewNo, int userNo, int roomNo, String reTitle, String reContent, int likeCount,
			double rating, Timestamp reRegdate, int reHit, String themeName, String userId, String brandName,
			String unitName) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.roomNo = roomNo;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.likeCount = likeCount;
		this.rating = rating;
		this.reRegdate = reRegdate;
		this.reHit = reHit;
		this.themeName = themeName;
		this.userId = userId;
		this.brandName = brandName;
		this.unitName = unitName;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getReTitle() {
		return reTitle;
	}

	public void setReTitle(String reTitle) {
		this.reTitle = reTitle;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public Timestamp getReRegdate() {
		return reRegdate;
	}

	public void setReRegdate(Timestamp reRegdate) {
		this.reRegdate = reRegdate;
	}

	public int getReHit() {
		return reHit;
	}

	public void setReHit(int reHit) {
		this.reHit = reHit;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	
	public int getReserveno() {
		return reserveno;
	}

	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}



	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", userNo=" + userNo + ", roomNo=" + roomNo + ", reTitle=" + reTitle
				+ ", reContent=" + reContent + ", likeCount=" + likeCount + ", rating=" + rating + ", reRegdate="
				+ reRegdate + ", reHit=" + reHit + ", themeName=" + themeName + ", userId=" + userId + ", brandName="
				+ brandName + ", unitName=" + unitName + "]";
	}	
}
