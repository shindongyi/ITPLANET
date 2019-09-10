package com.project.itplanet.study.model.vo;

public class StudyChat {
	private int sId; // 스터디 글번호
	private String chatRoom; // 채팅방
	private String chatMember; // 채팅멤버
	private String sTitle; // 글제목
	private String sCategory; // 글 카테고리
	private String sCaname; // 카테고리 상세

	public StudyChat() {}

	public StudyChat(int sId, String chatRoom, String chatMember) {
		super();
		this.sId = sId;
		this.chatRoom = chatRoom;
		this.chatMember = chatMember;
	}

	public StudyChat(int sId, String chatRoom, String chatMember, String sCategory, String sCaname) {
		super();
		this.sId = sId;
		this.chatRoom = chatRoom;
		this.chatMember = chatMember;
		this.sCategory = sCategory;
		this.sCaname = sCaname;
	}

	
	public StudyChat(int sId, String chatRoom, String chatMember, String sTitle, String sCategory, String sCaname) {
		super();
		this.sId = sId;
		this.chatRoom = chatRoom;
		this.chatMember = chatMember;
		this.sTitle = sTitle;
		this.sCategory = sCategory;
		this.sCaname = sCaname;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getsCaname() {
		return sCaname;
	}

	public void setsCaname(String sCaname) {
		this.sCaname = sCaname;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(String chatRoom) {
		this.chatRoom = chatRoom;
	}

	public String getChatMember() {
		return chatMember;
	}

	public void setChatMember(String chatMember) {
		this.chatMember = chatMember;
	}

	@Override
	public String toString() {
		return "StudyChat [sId=" + sId + ", chatRoom=" + chatRoom + ", chatMember=" + chatMember + "]";
	}
	
	
}