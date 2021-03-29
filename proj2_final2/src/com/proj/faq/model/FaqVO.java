package com.proj.faq.model;

public class FaqVO {
	private int faqNo;
	private String question;
	private String ask;
	
	public FaqVO() {
		super();
	}

	public FaqVO(int faqNo, String question, String ask) {
		super();
		this.faqNo = faqNo;
		this.question = question;
		this.ask = ask;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAsk() {
		return ask;
	}

	public void setAsk(String ask) {
		this.ask = ask;
	}

	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", question=" + question + ", ask=" + ask + "]";
	}
	
	
}
