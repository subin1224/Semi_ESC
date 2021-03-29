package com.proj.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userTel;
	private Timestamp userRegdate;
	private int mileage;
	private Timestamp outdate;
	
	public MemberVO() {
		super();
	}

	public MemberVO(int userNo, String userId, String userPwd, String userName, String userTel, Timestamp userRegdate,
			int mileage, Timestamp outdate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userTel = userTel;
		this.userRegdate = userRegdate;
		this.mileage = mileage;
		this.outdate = outdate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public Timestamp getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Timestamp userRegdate) {
		this.userRegdate = userRegdate;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public Timestamp getOutdate() {
		return outdate;
	}

	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}

	@Override
	public String toString() {
		return "MemberVO [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userTel=" + userTel + ", userRegdate=" + userRegdate + ", mileage=" + mileage + ", outdate="
				+ outdate + "]";
	}
	
	
}
