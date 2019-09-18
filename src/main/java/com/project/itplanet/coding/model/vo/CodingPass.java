package com.project.itplanet.coding.model.vo;

public class CodingPass {
	
	private int qsNum; //결과 번호
	private String qPass; // 코딩테스트 통과여부
	private int qNum; // 문제 번호
	private String userId; // 문제 도전자
	
	public CodingPass() {}

	public CodingPass(int qsNum, String qPass, int qNum, String userId) {
		super();
		this.qsNum = qsNum;
		this.qPass = qPass;
		this.qNum = qNum;
		this.userId = userId;
	}

	public int getQsNum() {
		return qsNum;
	}

	public void setQsNum(int qsNum) {
		this.qsNum = qsNum;
	}

	public String getqPass() {
		return qPass;
	}

	public void setqPass(String qPass) {
		this.qPass = qPass;
	}

	public int getqNum() {
		return qNum;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "CodingPass [qsNum=" + qsNum + ", qPass=" + qPass + ", qNum=" + qNum + ", userId=" + userId + "]";
	}

}
