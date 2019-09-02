package com.project.itplanet.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private Date birthDay;
	private String gender;
	private String email;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private int black;
	private int grade;
	
	public Member() {}

	public Member(String userId, String userPwd, String userName, String nickName, Date birthDay, String gender,
			String email, Date enrollDate, Date modifyDate, String status, int black, int grade) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.nickName = nickName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.email = email;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.black = black;
		this.grade = grade;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
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

	public int getBlack() {
		return black;
	}

	public void setBlack(int black) {
		this.black = black;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", nickName=" + nickName
				+ ", birthDay=" + birthDay + ", gender=" + gender + ", email=" + email + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", black=" + black + ", grade=" + grade + "]";
	}
	
}
