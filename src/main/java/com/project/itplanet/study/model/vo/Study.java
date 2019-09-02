package com.project.itplanet.study.model.vo;

import java.sql.Date;

public class Study {
	private int sId; //글번호
	private String sTitle; // 글제목
	private String sContent; // 글내용
	private int sCount; // 조회수
	private Date createDate; // 작성일
	private Date modifyDate; // 수정일
	private String status; // 삭제여부
	private String sWriter; // 글 작성자
	private int sLocation; // 모임장소 번호
	
	public Study() {}

	public Study(int sId, String sTitle, String sContent, int sCount, Date createDate, Date modifyDate, String status,
			String sWriter, int sLocation) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sCount = sCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.sWriter = sWriter;
		this.sLocation = sLocation;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public int getsCount() {
		return sCount;
	}

	public void setsCount(int sCount) {
		this.sCount = sCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getsWriter() {
		return sWriter;
	}

	public void setsWriter(String sWriter) {
		this.sWriter = sWriter;
	}

	public int getsLocation() {
		return sLocation;
	}

	public void setsLocation(int sLocation) {
		this.sLocation = sLocation;
	}
	

}
