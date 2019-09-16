package com.project.itplanet.competition.model.vo;

import java.sql.Date;

public class CompetitionReply {
	
	private String crId; // 댓글번호
	private String crContent; // 댓글 내용
	private Date crCreateDate; // 작성일자
	private Date crModifyDate; // 수정일자
	private String crStatus; // 삭제여부
	private String userId; // 작성자
	private int cId; // 글번호
	
	public CompetitionReply() {}
	
	
	public CompetitionReply(String crId, String crContent, Date crCreateDate, Date crModifyDate, String crStatus,
			String userId, int cId) {
		super();
		this.crId = crId;
		this.crContent = crContent;
		this.crCreateDate = crCreateDate;
		this.crModifyDate = crModifyDate;
		this.crStatus = crStatus;
		this.userId = userId;
		this.cId = cId;
	}


	public String getCrId() {
		return crId;
	}
	public void setCrId(String crId) {
		this.crId = crId;
	}
	public String getCrContent() {
		return crContent;
	}
	public void setCrContent(String crContent) {
		this.crContent = crContent;
	}
	public Date getCrCreateDate() {
		return crCreateDate;
	}
	public void setCrCreateDate(Date crCreateDate) {
		this.crCreateDate = crCreateDate;
	}
	public Date getCrModifyDate() {
		return crModifyDate;
	}
	public void setCrModifyDate(Date crModifyDate) {
		this.crModifyDate = crModifyDate;
	}
	public String getCrStatus() {
		return crStatus;
	}
	public void setCrStatus(String crStatus) {
		this.crStatus = crStatus;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	
	
	

}
