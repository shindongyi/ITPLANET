package com.project.itplanet.competition.model.vo;

import java.sql.Date;

public class Cattachment {
	private int cpId; // 이미지 코드
	private String originName; // 이미지명
	private String changeName; // 변경이미지명
	private String filePath; // 이미지경로
	private Date updateDate; // 이미지등록일
	private int cId; // 공모전 번호
	
	public Cattachment() {}

	public Cattachment(int cpId, String originName, String changeName, String filePath, Date updateDate, int cId) {
		super();
		this.cpId = cpId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.updateDate = updateDate;
		this.cId = cId;
	}

	public int getCpId() {
		return cpId;
	}

	public void setCpId(int cpId) {
		this.cpId = cpId;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	@Override
	public String toString() {
		return "Cattachment [cpId=" + cpId + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", updateDate=" + updateDate + ", cId=" + cId + "]";
	}

}