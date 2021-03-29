package com.proj.themeImg.model;

public class ThemeImgVO {
	private int themeNo;
	private String themeUrl;
	private String themeSrc;
	private String fileName;
	private String originalFileName;
	private int fileSize;
	

	public ThemeImgVO() {
		super();
	}

	public ThemeImgVO(int themeNo, String themeUrl, String themeSrc, String fileName, String originalFileName,
			int fileSize) {
		super();
		this.themeNo = themeNo;
		this.themeUrl = themeUrl;
		this.themeSrc = themeSrc;
		this.fileName = fileName;
		this.originalFileName = originalFileName;
		this.fileSize = fileSize;
	}

	public int getThemeNo() {
		return themeNo;
	}

	public void setThemeNo(int themeNo) {
		this.themeNo = themeNo;
	}

	public String getThemeUrl() {
		return themeUrl;
	}

	public void setThemeUrl(String themeUrl) {
		this.themeUrl = themeUrl;
	}

	public String getThemeSrc() {
		return themeSrc;
	}

	public void setThemeSrc(String themeImgSrc) {
		this.themeSrc = themeImgSrc;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "themeImgSrcVO [themeNo=" + themeNo + ", themeUrl=" + themeUrl + ", themeSrc=" + themeSrc + ", fileName="
				+ fileName + ", originalFileName=" + originalFileName + ", fileSize=" + fileSize + "]";
	}
	
	
	
}
