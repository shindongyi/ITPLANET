package com.project.itplanet.study.model.vo;

public class StudyChat {
	private int sId; // 스터디 글번호
	private String chatRoom; // 채팅방
	private String chatMember; // 채팅멤버

	public StudyChat() {}

	public StudyChat(int sId, String chatRoom, String chatMember) {
		super();
		this.sId = sId;
		this.chatRoom = chatRoom;
		this.chatMember = chatMember;
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
