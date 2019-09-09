package com.project.itplanet.license.model.vo;

import java.sql.Date;

public class LAttachment {
	private int l_fid;
	private String origin_name;
	private String change_name;
	private String file_path;
	private Date update_date;
	private int l_id;
	
	public LAttachment() {}

	public LAttachment(int l_fid, String origin_name, String change_name, String file_path, Date update_date,
			int l_id) {
		super();
		this.l_fid = l_fid;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.file_path = file_path;
		this.update_date = update_date;
		this.l_id = l_id;
	}

	public int getL_fid() {
		return l_fid;
	}

	public void setL_fid(int l_fid) {
		this.l_fid = l_fid;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public int getL_id() {
		return l_id;
	}

	public void setL_id(int l_id) {
		this.l_id = l_id;
	}

	@Override
	public String toString() {
		return "Lattachment [l_fid=" + l_fid + ", origin_name=" + origin_name + ", change_name=" + change_name
				+ ", file_path=" + file_path + ", update_date=" + update_date + ", l_id=" + l_id + "]";
	}
	
}
