package com.proj.room.model;

public class RoomVO {
	private int roomNo;
	private int brandNo;
	private int unitNo;
	private int themeNo;
	private int roomRate;
	
	public RoomVO() {
		super();
	}

	public RoomVO(int roomNo, int brandNo, int unitNo, int themeNo, int roomRate) {
		super();
		this.roomNo = roomNo;
		this.brandNo = brandNo;
		this.unitNo = unitNo;
		this.themeNo = themeNo;
		this.roomRate = roomRate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public int getUnitNo() {
		return unitNo;
	}

	public void setUnitNo(int unitNo) {
		this.unitNo = unitNo;
	}

	public int getThemeNo() {
		return themeNo;
	}

	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}

	public int getRoomRate() {
		return roomRate;
	}

	public void setRoomRate(int roomRate) {
		this.roomRate = roomRate;
	}

	@Override
	public String toString() {
		return "RoomVO [roomNo=" + roomNo + ", brandNo=" + brandNo + ", unitNo=" + unitNo + ", themeNo=" + themeNo
				+ ", roomRate=" + roomRate + "]";
	}
	
	
	
}
