package com.proj.review.model;

import java.sql.Timestamp;

public class ReviewTotalVO {
	private int	reviewNo;//리뷰번호 프라이머리
	private int	userNo;//회원넘버 fk escmem(userno)
	private int	roomNo;//룸넘버 fk room(roomno)
	private String reTitle;//not null
	private	String reContent;//not null
	private	int	likeCount;//default 0
	private double rating;
	private	Timestamp reRegdate;//default sysdate
	private int	reHit;
	private String themeName;
	private String userId;
	private String brandName;

	public ReviewTotalVO() {
		super();
	}
	
	


	public ReviewTotalVO(int reviewNo, String reTitle, String reContent, double rating, Timestamp reRegdate,
			String themeName) {
		super();
		this.reviewNo = reviewNo;
		this.reTitle = reTitle;
		this.reContent = reContent;
		this.rating = rating;
		this.reRegdate = reRegdate;
		this.themeName = themeName;
	}

	public ReviewTotalVO(int reviewNo, int userNo, int roomNo, String reTitle, String reContent, int likeCount,
			double rating, Timestamp reRegdate, int reHit, String themeName, String userId, String brandName) {
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

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", userNo=" + userNo + ", roomNo=" + roomNo + ", reTitle=" + reTitle
				+ ", reContent=" + reContent + ", likeCount=" + likeCount + ", rating=" + rating + ", reRegdate="
				+ reRegdate + ", reHit=" + reHit + ", themeName=" + themeName + ", userId=" + userId + ", brandName="
				+ brandName + "]";
	}


}	