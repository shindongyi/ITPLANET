package com.project.itplanet.coding.model.vo;

public class Coding {
	private int qNum;
	private String qTitle;
	private String qContent;
	private String qLimitation;
	private String qLimitationTwo;
	private String qLimitationThree;
	private String qLimitationFour;
	private String qLimitationFive;
	private String qExData;
	private String qExResult;
	private String qExDataTwo;
	private String qExResultTwo;
	private String qExDataThree;
	private String qExResultThree;
	private String userId;
	
	public Coding() {}
	
	public Coding(int qNum, String qTitle, String qContent, String qLimitation, String qLimitationTwo,
			String qLimitationThree, String qLimitationFour, String qLimitationFive, String qExData, String qExResult,
			String qExDataTwo, String qExResultTwo, String qExDataThree, String qExResultThree, String userId) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qLimitation = qLimitation;
		this.qLimitationTwo = qLimitationTwo;
		this.qLimitationThree = qLimitationThree;
		this.qLimitationFour = qLimitationFour;
		this.qLimitationFive = qLimitationFive;
		this.qExData = qExData;
		this.qExResult = qExResult;
		this.qExDataTwo = qExDataTwo;
		this.qExResultTwo = qExResultTwo;
		this.qExDataThree = qExDataThree;
		this.qExResultThree = qExResultThree;
		this.userId = userId;
	}


	public int getqNum() {
		return qNum;
	}


	public void setqNum(int qNum) {
		this.qNum = qNum;
	}


	public String getqTitle() {
		return qTitle;
	}


	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}


	public String getqContent() {
		return qContent;
	}


	public void setqContent(String qContent) {
		this.qContent = qContent;
	}


	public String getqLimitation() {
		return qLimitation;
	}


	public void setqLimitation(String qLimitation) {
		this.qLimitation = qLimitation;
	}


	public String getqLimitationTwo() {
		return qLimitationTwo;
	}


	public void setqLimitationTwo(String qLimitationTwo) {
		this.qLimitationTwo = qLimitationTwo;
	}


	public String getqLimitationThree() {
		return qLimitationThree;
	}


	public void setqLimitationThree(String qLimitationThree) {
		this.qLimitationThree = qLimitationThree;
	}


	public String getqLimitationFour() {
		return qLimitationFour;
	}


	public void setqLimitationFour(String qLimitationFour) {
		this.qLimitationFour = qLimitationFour;
	}


	public String getqLimitationFive() {
		return qLimitationFive;
	}


	public void setqLimitationFive(String qLimitationFive) {
		this.qLimitationFive = qLimitationFive;
	}


	public String getqExData() {
		return qExData;
	}


	public void setqExData(String qExData) {
		this.qExData = qExData;
	}


	public String getqExResult() {
		return qExResult;
	}


	public void setqExResult(String qExResult) {
		this.qExResult = qExResult;
	}


	public String getqExDataTwo() {
		return qExDataTwo;
	}


	public void setqExDataTwo(String qExDataTwo) {
		this.qExDataTwo = qExDataTwo;
	}


	public String getqExResultTwo() {
		return qExResultTwo;
	}


	public void setqExResultTwo(String qExResultTwo) {
		this.qExResultTwo = qExResultTwo;
	}


	public String getqExDataThree() {
		return qExDataThree;
	}


	public void setqExDataThree(String qExDataThree) {
		this.qExDataThree = qExDataThree;
	}


	public String getqExResultThree() {
		return qExResultThree;
	}


	public void setqExResultThree(String qExResultThree) {
		this.qExResultThree = qExResultThree;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "Coding [qNum=" + qNum + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qLimitation=" + qLimitation
				+ ", qLimitationTwo=" + qLimitationTwo + ", qLimitationThree=" + qLimitationThree + ", qLimitationFour="
				+ qLimitationFour + ", qLimitationFive=" + qLimitationFive + ", qExData=" + qExData + ", qExResult="
				+ qExResult + ", qExDataTwo=" + qExDataTwo + ", qExResultTwo=" + qExResultTwo + ", qExDataThree="
				+ qExDataThree + ", qExResultThree=" + qExResultThree + ", userId=" + userId + "]";
	}
	
}
