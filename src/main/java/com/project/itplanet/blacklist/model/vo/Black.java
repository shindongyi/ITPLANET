package com.project.itplanet.blacklist.model.vo;

import java.sql.Date;

public class Black {
	private int blkId;
	private String blkTitle;
	private String blkContent;
	private String blkWriter;
	private String blkTargetId;
	private String blkType;
	private Date blkCreateDate;
	private Date blkModifyDate;
	private String blkstatus;
	
	public Black() {}

	public Black(int blkId, String blkTitle, String blkContent, String blkWriter, String blkTargetId, String blkType,
			Date blkCreateDate, Date blkModifyDate, String blkstatus) {
		super();
		this.blkId = blkId;
		this.blkTitle = blkTitle;
		this.blkContent = blkContent;
		this.blkWriter = blkWriter;
		this.blkTargetId = blkTargetId;
		this.blkType = blkType;
		this.blkCreateDate = blkCreateDate;
		this.blkModifyDate = blkModifyDate;
		this.blkstatus = blkstatus;
	}

	public int getBlkId() {
		return blkId;
	}

	public void setBlkId(int blkId) {
		this.blkId = blkId;
	}

	public String getBlkTitle() {
		return blkTitle;
	}

	public void setBlkTitle(String blkTitle) {
		this.blkTitle = blkTitle;
	}

	public String getBlkContent() {
		return blkContent;
	}

	public void setBlkContent(String blkContent) {
		this.blkContent = blkContent;
	}

	public String getBlkWriter() {
		return blkWriter;
	}

	public void setBlkWriter(String blkWriter) {
		this.blkWriter = blkWriter;
	}

	public String getBlkTargetId() {
		return blkTargetId;
	}

	public void setBlkTargetId(String blkTargetId) {
		this.blkTargetId = blkTargetId;
	}

	public String getBlkType() {
		return blkType;
	}

	public void setBlkType(String blkType) {
		this.blkType = blkType;
	}

	public Date getBlkCreateDate() {
		return blkCreateDate;
	}

	public void setBlkCreateDate(Date blkCreateDate) {
		this.blkCreateDate = blkCreateDate;
	}

	public Date getBlkModifyDate() {
		return blkModifyDate;
	}

	public void setBlkModifyDate(Date blkModifyDate) {
		this.blkModifyDate = blkModifyDate;
	}

	public String getBlkstatus() {
		return blkstatus;
	}

	public void setBlkstatus(String blkstatus) {
		this.blkstatus = blkstatus;
	}

	@Override
	public String toString() {
		return "Black [blkId=" + blkId + ", blkTitle=" + blkTitle + ", blkContent=" + blkContent + ", blkWriter="
				+ blkWriter + ", blkTargetId=" + blkTargetId + ", blkType=" + blkType + ", blkCreateDate="
				+ blkCreateDate + ", blkModifyDate=" + blkModifyDate + ", blkstatus=" + blkstatus + "]";
	}
	
	
	
}
