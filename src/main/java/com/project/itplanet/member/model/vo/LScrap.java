package com.project.itplanet.member.model.vo;

public class LScrap {
	private String ls_id;
	private String user_id;
	private String l_Id;
	
	public LScrap() {}

	public LScrap(String ls_id, String user_id, String l_Id) {
		super();
		this.ls_id = ls_id;
		this.user_id = user_id;
		this.l_Id = l_Id;
	}

	public String getLs_id() {
		return ls_id;
	}

	public void setLs_id(String ls_id) {
		this.ls_id = ls_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getL_Id() {
		return l_Id;
	}

	public void setL_Id(String l_Id) {
		this.l_Id = l_Id;
	}

	@Override
	public String toString() {
		return "LScrap [ls_id=" + ls_id + ", user_id=" + user_id + ", l_Id=" + l_Id + "]";
	}

	
}
