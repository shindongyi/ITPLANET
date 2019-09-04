package com.project.itplanet.study.model.vo;

import java.sql.Date;

public class Study {
	private int sId; //글번호
	private String sTitle; // 글제목
	private int sMember; // 멤버수
	private String sContent; // 글내용
	private int sCount; // 조회수
	private String sCategory; // 자격증 or 공모전
	private String sCaName; // 스터디 상세명
	private Date createDate; // 작성일
	private Date modifyDate; // 수정일
	private String status; // 삭제여부
	private String sWriter; // 글 작성자
	private String nickName;
	private int sLocation; // 모임장소 번호
	private String lName; // 모임장소 이름
	private String chatMember; // 채팅멤버현황
	
	public Study() {}

	public Study(int sId, String sTitle, int sMember, String sContent, int sCount, String sCategory, String sCaName,
			Date createDate, Date modifyDate, String status, String sWriter, int sLocation) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sMember = sMember;
		this.sContent = sContent;
		this.sCount = sCount;
		this.sCategory = sCategory;
		this.sCaName = sCaName;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.sWriter = sWriter;
		this.sLocation = sLocation;
	}
	

	public Study(int sId, String sTitle, int sMember, String sContent, int sCount, String sCategory, String sCaName,
			Date createDate, Date modifyDate, String status, String sWriter, String nickName, int sLocation,
			String lName) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sMember = sMember;
		this.sContent = sContent;
		this.sCount = sCount;
		this.sCategory = sCategory;
		this.sCaName = sCaName;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.sWriter = sWriter;
		this.nickName = nickName;
		this.sLocation = sLocation;
		this.lName = lName;
	}

	public Study(int sId, String sTitle, int sMember, String sContent, int sCount, String sCategory, String sCaName,
			Date createDate, Date modifyDate, String status, String nickName, String lName, String chatMember) {
		super();
		this.sId = sId;
		this.sTitle = sTitle;
		this.sMember = sMember;
		this.sContent = sContent;
		this.sCount = sCount;
		this.sCategory = sCategory;
		this.sCaName = sCaName;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.nickName = nickName;
		this.lName = lName;
		this.chatMember = chatMember;
	}
	
	
	

	public String getChatMember() {
		return chatMember;
	}

	public void setChatMember(String chatMember) {
		this.chatMember = chatMember;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getsCaName() {
		return sCaName;
	}

	public void setsCaName(String sCaName) {
		this.sCaName = sCaName;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public int getsMember() {
		return sMember;
	}

	public void setsMember(int sMember) {
		this.sMember = sMember;
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

	@Override
	public String toString() {
		return "Study [sId=" + sId + ", sTitle=" + sTitle + ", sMember=" + sMember + ", sContent=" + sContent
				+ ", sCount=" + sCount + ", sCategory=" + sCategory + ", sCaName=" + sCaName + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", sWriter=" + sWriter
				+ ", nickName=" + nickName + ", sLocation=" + sLocation + ", lName=" + lName + ", chatMember="
				+ chatMember + "]";
	}

}
