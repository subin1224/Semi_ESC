package com.proj.notice.model;

import java.sql.Timestamp;
import java.util.Date;

public class NoticeVO {
	private int noticeNo;
	private String noTitle;
	private String noContent;
	private Timestamp noRegdate;
	private int brandNo;
	private int noHit;

	public NoticeVO() {
		super();
	}

	public NoticeVO(int noticeNo, String noTitle, String noContent, Timestamp noRegdate, int brandNo, int noHit) {
		super();
		this.noticeNo = noticeNo;
		this.noTitle = noTitle;
		this.noContent = noContent;
		this.noRegdate = noRegdate;
		this.brandNo = brandNo;
		this.noHit = noHit;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoTitle() {
		return noTitle;
	}

	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}

	public String getNoContent() {
		return noContent;
	}

	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}

	public Timestamp getNoRegdate() {
		return noRegdate;
	}

	public void setNoRegdate(Timestamp noRegdate) {
		this.noRegdate = noRegdate;
	}

	public int getBrandNo() {
		return brandNo;
	}

	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}

	public int getNoHit() {
		return noHit;
	}

	public void setNoHit(int noHit) {
		this.noHit = noHit;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noTitle=" + noTitle + ", noContent=" + noContent + ", noRegdate="
				+ noRegdate + ", brandNo=" + brandNo + ", noHit=" + noHit + "]";
	}


}