package com.proj.theme.model;

public class ThemeVO {
	private int themeNo;
	private String themeName;
	private String themeContent;
	private int difficulty;
	private int playTime;
	private int playerMin;
	private int playerMax;
	private int brandNo;
	private int genreCode;
	private int genreCode2;
	private int themePrice;
	
	private String originalFileName;


	public ThemeVO() {
		super();
	}

	
	
	public ThemeVO(int themeNo, String themeName, String themeContent, int difficulty, int playTime, int playerMin,
			int playerMax, int brandNo, int genreCode, int genreCode2, int themePrice, String originalFileName) {
		super();
		this.themeNo = themeNo;
		this.themeName = themeName;
		this.themeContent = themeContent;
		this.difficulty = difficulty;
		this.playTime = playTime;
		this.playerMin = playerMin;
		this.playerMax = playerMax;
		this.brandNo = brandNo;
		this.genreCode = genreCode;
		this.genreCode2 = genreCode2;
		this.themePrice = themePrice;
		this.originalFileName = originalFileName;
	}



	public ThemeVO(int themeNo, String themeName, String themeContent, int difficulty, int playTime, int playerMin,
			int playerMax, int brandNo, int genreCode, int genreCode2, int themePrice) {
		super();
		this.themeNo = themeNo;
		this.themeName = themeName;
		this.themeContent = themeContent;
		this.difficulty = difficulty;
		this.playTime = playTime;
		this.playerMin = playerMin;
		this.playerMax = playerMax;
		this.brandNo = brandNo;
		this.genreCode = genreCode;
		this.genreCode2 = genreCode2;
		this.themePrice = themePrice;
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

	public String getThemeContent() {
		return themeContent;
	}

	public void setThemeContent(String themeContent) {
		this.themeContent = themeContent;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public int getPlayTime() {
		return playTime;
	}

	public void setPlayTime(int playTime) {
		this.playTime = playTime;
	}

	public int getPlayerMin() {
		return playerMin;
	}

	public void setPlayerMin(int playerMin) {
		this.playerMin = playerMin;
	}

	public int getPlayerMax() {
		return playerMax;
	}

	public void setPlayerMax(int playerMax) {
		this.playerMax = playerMax;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
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

	public int getThemePrice() {
		return themePrice;
	}

	public void setThemePrice(int themePrice) {
		this.themePrice = themePrice;
	}
	

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	@Override
	public String toString() {
		return "ThemeVO [themeNo=" + themeNo + ", themeName=" + themeName + ", themeContent=" + themeContent
				+ ", difficulty=" + difficulty + ", playTime=" + playTime + ", playerMin=" + playerMin + ", playerMax="
				+ playerMax + ", brandNo=" + brandNo + ", genreCode=" + genreCode + ", genreCode2=" + genreCode2
				+ ", themePrice=" + themePrice + ", originalFileName=" + originalFileName + "]";
	}

	

	
}
