package com.project.itplanet.member.model.vo;

public class LScrap {
	private String lsId;
	private String userId;
	private String lId;
	
	public LScrap() {}

	public LScrap(String lsId, String userId, String lId) {
		super();
		this.lsId = lsId;
		this.userId = userId;
		this.lId = lId;
	}

	public String getLsId() {
		return lsId;
	}

	public void setLsId(String lsId) {
		this.lsId = lsId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getlId() {
		return lId;
	}

	public void setlId(String lId) {
		this.lId = lId;
	}

	@Override
	public String toString() {
		return "LScrap [lsId=" + lsId + ", userId=" + userId + ", lId=" + lId + "]";
	}
	
}
