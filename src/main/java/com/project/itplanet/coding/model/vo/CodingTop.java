package com.project.itplanet.coding.model.vo;

public class CodingTop implements Comparable<CodingTop>{
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

	public CodingTop(int qNum, String qTtitle, int submitNum) {
		super();
		this.qNum = qNum;
		this.qTtitle = qTtitle;
		this.submitNum = submitNum;
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

	@Override
	public String toString() {
		return "CodingTop [qNum=" + qNum + ", qTtitle=" + qTtitle + ", correctNum=" + correctNum + ", submitNum="
				+ submitNum + ", correctPer=" + correctPer + "]";
	}

	@Override
	public int compareTo(CodingTop o) {
		
		int targetPer = o.getCorrectPer();
		if(correctPer == targetPer) return 0;
		else if(correctPer > targetPer) return 1;
		else return -1;
	}
	
	
}
