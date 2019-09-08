package com.project.itplanet.competition.model.vo;

import java.sql.Date;

public class Competiton {
	
	private int cId; // 글 번호
	private String cTitle; // 글제목
	private String cContent; // 글 내용
	private String cPhone; // 공모전 전화번호
	private String cAddress; // 공모전 주소
	private int cCount; // 공모전 조회수
	private Date cStartDate; // 공모전 시작일
	private Date cDueDate; // 공모전 마감일
	private Date cCreateDate; // 공모전 작성일
	private Date cModifyDate; // 공모전 수정일
	private String cStatus; // 공모전 삭제여부
	private String cWriter; // 공모전 작성자
	
	public Competiton() {}

	public Competiton(int cId, String cTitle, String cContent, String cPhone, String cAddress, int cCount,
			Date cStartDate, Date cDueDate, Date cCreateDate, Date cModifyDate, String cStatus, String cWriter) {
		super();
		this.cId = cId;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cPhone = cPhone;
		this.cAddress = cAddress;
		this.cCount = cCount;
		this.cStartDate = cStartDate;
		this.cDueDate = cDueDate;
		this.cCreateDate = cCreateDate;
		this.cModifyDate = cModifyDate;
		this.cStatus = cStatus;
		this.cWriter = cWriter;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getcPhone() {
		return cPhone;
	}

	public void setcPhone(String cPhone) {
		this.cPhone = cPhone;
	}

	public String getcAddress() {
		return cAddress;
	}

	public void setcAddress(String cAddress) {
		this.cAddress = cAddress;
	}

	public int getcCount() {
		return cCount;
	}

	public void setcCount(int cCount) {
		this.cCount = cCount;
	}

	public Date getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}

	public Date getcDueDate() {
		return cDueDate;
	}

	public void setcDueDate(Date cDueDate) {
		this.cDueDate = cDueDate;
	}

	public Date getcCreateDate() {
		return cCreateDate;
	}

	public void setcCreateDate(Date cCreateDate) {
		this.cCreateDate = cCreateDate;
	}

	public Date getcModifyDate() {
		return cModifyDate;
	}

	public void setcModifyDate(Date cModifyDate) {
		this.cModifyDate = cModifyDate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	@Override
	public String toString() {
		return "Competiton [cId=" + cId + ", cTitle=" + cTitle + ", cContent=" + cContent + ", cPhone=" + cPhone
				+ ", cAddress=" + cAddress + ", cCount=" + cCount + ", cStartDate=" + cStartDate + ", cDueDate="
				+ cDueDate + ", cCreateDate=" + cCreateDate + ", cModifyDate=" + cModifyDate + ", cStatus=" + cStatus
				+ ", cWriter=" + cWriter + "]";
	}
	
	
	
	
}
