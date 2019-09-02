package com.project.itplanet.study.model.vo;

import java.sql.Date;

public class StudyReply {
	private int srId; // 댓글번호
	private String srContent; // 댓글내용
	private Date srCreateDate; // 작성일
	private Date srModifyDate; // 수정일
	private String status; // 삭제여부
	private int sId; // 글번호
	private String srWriter; // 댓글작성자
	
	public StudyReply() {}

	public StudyReply(int srId, String srContent, Date srCreateDate, Date srModifyDate, String status, int sId,
			String srWriter) {
		super();
		this.srId = srId;
		this.srContent = srContent;
		this.srCreateDate = srCreateDate;
		this.srModifyDate = srModifyDate;
		this.status = status;
		this.sId = sId;
		this.srWriter = srWriter;
	}

	public int getSrId() {
		return srId;
	}

	public void setSrId(int srId) {
		this.srId = srId;
	}

	public String getSrContent() {
		return srContent;
	}

	public void setSrContent(String srContent) {
		this.srContent = srContent;
	}

	public Date getSrCreateDate() {
		return srCreateDate;
	}

	public void setSrCreateDate(Date srCreateDate) {
		this.srCreateDate = srCreateDate;
	}

	public Date getSrModifyDate() {
		return srModifyDate;
	}

	public void setSrModifyDate(Date srModifyDate) {
		this.srModifyDate = srModifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getSrWriter() {
		return srWriter;
	}

	public void setSrWriter(String srWriter) {
		this.srWriter = srWriter;
	}
	

}
