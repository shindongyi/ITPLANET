package com.project.itplanet.license.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class License {
	
	private int l_id;
	private String l_name;
	private int l_round;
	private Date start_date;
	private Date end_date;
	private Date results;
	private String l_address;
	private int l_count;
	private Date reg_date;
	private Date modify_date;
	private String status;
	private String user_Id;
	private ArrayList<LAttachment> latList;
	
	public License() {}

	public License(int l_id, String l_name, int l_round, Date start_date, Date end_date, Date results, String l_address,
			int l_count, Date reg_date, Date modify_date, String status, String user_Id,
			ArrayList<LAttachment> latList) {
		super();
		this.l_id = l_id;
		this.l_name = l_name;
		this.l_round = l_round;
		this.start_date = start_date;
		this.end_date = end_date;
		this.results = results;
		this.l_address = l_address;
		this.l_count = l_count;
		this.reg_date = reg_date;
		this.modify_date = modify_date;
		this.status = status;
		this.user_Id = user_Id;
		this.latList = latList;
	}

	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public int getL_round() {
		return l_round;
	}

	public void setL_round(int l_round) {
		this.l_round = l_round;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getResults() {
		return results;
	}

	public void setResults(Date results) {
		this.results = results;
	}

	public String getL_address() {
		return l_address;
	}

	public void setL_address(String l_address) {
		this.l_address = l_address;
	}

	public int getL_count() {
		return l_count;
	}

	public void setL_count(int l_count) {
		this.l_count = l_count;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}

	public ArrayList<LAttachment> getLatList() {
		return latList;
	}

	public void setLatList(ArrayList<LAttachment> latList) {
		this.latList = latList;
	}

	@Override
	public String toString() {
		return "License [l_id=" + l_id + ", l_name=" + l_name + ", l_round=" + l_round + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", results=" + results + ", l_address=" + l_address + ", l_count="
				+ l_count + ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", status=" + status
				+ ", user_Id=" + user_Id + ", latList=" + latList + "]";
	}
	
}
