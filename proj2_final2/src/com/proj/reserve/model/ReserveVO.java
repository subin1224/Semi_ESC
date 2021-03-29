package com.proj.reserve.model;

import java.sql.Timestamp;

public class ReserveVO {	
	private int reserveNo;
	private int redateCode;
	private String themeName;
	private String reserveDay;
	private String reserveTime;
	private String userId;
	private Timestamp reserveReg;
	private String reserveFlag;
	private int brandNo;
	private int roomNo;
	private int playerNum;
	private int reserveCode;
	private int payment;
	private int userNo;
	
	//userno
	private String brandName;



	/*
	--예약번호, 예약날짜코드, 테마명, 예약날짜, 예약시간, 예약한 회원 아이디, 예약등록일, 예약플래그, 브랜드번호, 룸 번호, 플레이어수, 총 가격, userNo
	select a.reserveno, b.redatecode, d.themename, b.reserveday, b.reservetime, e.userid, a.reservereg, b.reserveflag, c.brandno, c.roomno, a.playernum, a.payment, a.userno
	from reserve a 
	join reservedate b on a.reservecode = b.redatecode
	join room c on c.roomno = a.roomno
	join theme d on d.THEMENO = c.THEMENO
	join escmem e on e.userno = a.userno;
	 */

	public ReserveVO() {
		super();
	}

	//reserve테이블 생성자
	public ReserveVO(int reserveNo, int userNo, int roomNo, int playerNum, int payment, int reserveCode,
			Timestamp reserveReg) {
		super();
		this.reserveNo = reserveNo;
		this.userNo = userNo;
		this.roomNo = roomNo;
		this.playerNum = playerNum;
		this.payment = payment;
		this.reserveCode = reserveCode;
		this.reserveReg = reserveReg;
	}
	
	//숩 userno
	public ReserveVO(int reserveNo, String themeName, String reserveDay, String reserveTime, String reserveFlag,
			String brandName) {
		super();
		this.reserveNo = reserveNo;
		this.themeName = themeName;
		this.reserveDay = reserveDay;
		this.reserveTime = reserveTime;
		this.reserveFlag = reserveFlag;
		this.brandName = brandName;
	}

	//reserveDate 생성자
	public ReserveVO(int redateCode, String reserveDay, String reserveTime, String reserveFlag) {
		super();
		this.redateCode = redateCode;
		this.reserveDay = reserveDay;
		this.reserveTime = reserveTime;
		this.reserveFlag = reserveFlag;
	}   

	public ReserveVO(int reserveNo, int redateCode, String themeName, String reserveDay, String reserveTime, String userId,
			Timestamp reserveReg, String reserveFlag, int brandNo, int roomNo, int playerNum, int payment, int userNo) {
		super();
		this.reserveNo = reserveNo;
		this.redateCode = redateCode;
		this.themeName = themeName;
		this.reserveDay = reserveDay;
		this.reserveTime = reserveTime;
		this.userId = userId;
		this.reserveReg = reserveReg;
		this.reserveFlag = reserveFlag;
		this.brandNo = brandNo;
		this.roomNo = roomNo;
		this.playerNum = playerNum;
		this.payment = payment;
		this.userNo = userNo;
	}

	public int getReserveNo() {
		return reserveNo;
	}


	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}


	public int getRedateCode() {
		return redateCode;
	}


	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public void setRedateCode(int redateCode) {
		this.redateCode = redateCode;
	}


	public String getThemeName() {
		return themeName;
	}


	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}


	public String getReserveDay() {
		return reserveDay;
	}


	public void setReserveDay(String reserveDay) {
		this.reserveDay = reserveDay;
	}


	public String getReserveTime() {
		return reserveTime;
	}


	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Timestamp getReserveReg() {
		return reserveReg;
	}


	public void setReserveReg(Timestamp reserveReg) {
		this.reserveReg = reserveReg;
	}


	public String getReserveFlag() {
		return reserveFlag;
	}


	public void setReserveFlag(String reserveFlag) {
		this.reserveFlag = reserveFlag;
	}


	public int getBrandNo() {
		return brandNo;
	}


	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public int getPlayerNum() {
		return playerNum;
	}


	public void setPlayerNum(int playerNum) {
		this.playerNum = playerNum;
	}


	public int getPayment() {
		return payment;
	}


	public void setPayment(int payment) {
		this.payment = payment;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getReserveCode() {
		return reserveCode;
	}

	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}

	@Override
	public String toString() {
		return "ReserveVO [reserveNo=" + reserveNo + ", redateCode=" + redateCode + ", themeName=" + themeName
				+ ", reserveDay=" + reserveDay + ", reserveTime=" + reserveTime + ", userId=" + userId + ", reserveReg="
				+ reserveReg + ", reserveFlag=" + reserveFlag + ", brandNo=" + brandNo + ", roomNo=" + roomNo
				+ ", playerNum=" + playerNum + ", reserveCode=" + reserveCode + ", payment=" + payment + ", userNo="
				+ userNo + ", brandName=" + brandName + "]";
	}



}
