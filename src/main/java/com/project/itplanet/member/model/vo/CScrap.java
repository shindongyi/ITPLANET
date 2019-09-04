package com.project.itplanet.member.model.vo;

public class CScrap {
	private String csId;
	private String userId;
	private String cId;
	
	public CScrap() {}

	public CScrap(String csId, String userId, String cId) {
		super();
		this.csId = csId;
		this.userId = userId;
		this.cId = cId;
	}

	public String getCsId() {
		return csId;
	}

	public void setCsId(String csId) {
		this.csId = csId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	@Override
	public String toString() {
		return "CScrap [csId=" + csId + ", userId=" + userId + ", cId=" + cId + "]";
	}
	
}
