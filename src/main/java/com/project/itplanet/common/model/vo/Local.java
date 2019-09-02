package com.project.itplanet.common.model.vo;

public class Local {
	private int lCode;
	private String lName;
	
	public Local() {}

	public Local(int lCode, String lName) {
		super();
		this.lCode = lCode;
		this.lName = lName;
	}

	public int getlCode() {
		return lCode;
	}

	public void setlCode(int lCode) {
		this.lCode = lCode;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}
	
	

}
