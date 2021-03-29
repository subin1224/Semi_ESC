package com.proj.room.model;

public class RoomTotalVO {
	private int roomNo;
	private int brandNo;
	private String brandName;
	private int unitNo;
	private String unitName;
	private String location1Code;
	private int themeNo;
	private String themeName;
	private int difficulty;
	private String themeSrc;
	private int genreCode;
	private int genreCode2;
	private String originalFileName;
	private String themeContent;
	
	public RoomTotalVO() {
		super();
	}


	public RoomTotalVO(int roomNo, int brandNo, String brandName, int unitNo, String unitName, String location1Code,
			int themeNo, String themeName,String themeContent ,int difficulty, String themeSrc, int genreCode, int genreCode2, String originalFileName) {
		super();
		this.roomNo = roomNo;
		this.brandNo = brandNo;
		this.brandName = brandName;
		this.unitNo = unitNo;
		this.unitName = unitName;
		this.location1Code = location1Code;
		this.themeNo = themeNo;
		this.themeName = themeName;
		this.difficulty = difficulty;
		this.themeSrc = themeSrc;
		this.genreCode = genreCode;
		this.genreCode2 = genreCode2;
		this.originalFileName = originalFileName;
		this.themeContent = themeContent;
	}

	public RoomTotalVO(int roomNo, int brandNo, String brandName, int unitNo, String unitName, String location1Code,
			int themeNo, String themeName, int difficulty, String themeSrc, int genreCode, int genreCode2) {
		super();
		this.roomNo = roomNo;
		this.brandNo = brandNo;
		this.brandName = brandName;
		this.unitNo = unitNo;
		this.unitName = unitName;
		this.location1Code = location1Code;
		this.themeNo = themeNo;
		this.themeName = themeName;
		this.difficulty = difficulty;
		this.themeSrc = themeSrc;
		this.genreCode = genreCode;
		this.genreCode2 = genreCode2;
	}
	
	
	public String getThemeContent() {
		return themeContent;
	}


	public void setThemeContent(String themeContent) {
		this.themeContent = themeContent;
	}


	public String getOriginalFileName() {
		return originalFileName;
	}
	
	
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
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


	public String getBrandName() {
		return brandName;
	}


	public void setBrandName(String brandName) {
		this.brandName = brandName;
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

	

	public String getLocation1Code() {
		return location1Code;
	}


	public void setLocation1Code(String location1Code) {
		this.location1Code = location1Code;
	}


	public int getThemeNo() {
		return themeNo;
	}


	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}


	public String getThemeName() {
		return themeName;
	}


	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	

	public int getDifficulty() {
		return difficulty;
	}


	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}


	public String getThemeSrc() {
		return themeSrc;
	}


	public void setThemeSrc(String themeSrc) {
		this.themeSrc = themeSrc;
	}


	public int getGenreCode() {
		return genreCode;
	}


	public void setGenreCode(int genreCode) {
		this.genreCode = genreCode;
	}


	public int getGenreCode2() {
		return genreCode2;
	}


	public void setGenreCode2(int genreCode2) {
		this.genreCode2 = genreCode2;
	}


	@Override
	public String toString() {
		return "RoomTotalVO [roomNo=" + roomNo + ", brandNo=" + brandNo + ", brandName=" + brandName + ", unitNo="
				+ unitNo + ", unitName=" + unitName + ", location1Code=" + location1Code + ", themeNo=" + themeNo
				+ ", themeName=" + themeName + ", difficulty=" + difficulty + ", themeSrc=" + themeSrc + ", genreCode="
				+ genreCode + ", genreCode2=" + genreCode2 + ", originalFileName=" + originalFileName + "]";
	}


	
}
