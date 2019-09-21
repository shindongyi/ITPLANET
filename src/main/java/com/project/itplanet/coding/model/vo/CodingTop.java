package com.project.itplanet.coding.model.vo;

public class CodingTop {
	private int qNum;
	private String qTtitle;
	private int correctNum;
	private int submitNum;
	private int correctPer;
	
	public CodingTop(int qNum, String qTtitle, int correctNum, int submitNum, int correctPer) {
		super();
		this.qNum = qNum;
		this.qTtitle = qTtitle;
		this.correctNum = correctNum;
		this.submitNum = submitNum;
		this.correctPer = correctPer;
	}

	public int getqNum() {
		return qNum;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public String getqTtitle() {
		return qTtitle;
	}

	public void setqTtitle(String qTtitle) {
		this.qTtitle = qTtitle;
	}

	public int getCorrectNum() {
		return correctNum;
	}

	public void setCorrectNum(int correctNum) {
		this.correctNum = correctNum;
	}

	public int getSubmitNum() {
		return submitNum;
	}

	public void setSubmitNum(int submitNum) {
		this.submitNum = submitNum;
	}

	public int getCorrectPer() {
		return correctPer;
	}

	public void setCorrectPer(int correctPer) {
		this.correctPer = correctPer;
	}
	
	
	
	
	
	
}
