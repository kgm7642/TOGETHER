package com.project.app.moim.dto;

public class MoimChatDTO {
	private int moimchatnum;
	private String userid;
	private int moimnum;
	private String moimchatcontents;
	private String moimchatdate;
	
	public MoimChatDTO() {}

	public int getMoimchatnum() {
		return moimchatnum;
	}
	public void setMoimchatnum(int moimchatnum) {
		this.moimchatnum = moimchatnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMoimnum() {
		return moimnum;
	}
	public void setMoimnum(int moimnum) {
		this.moimnum = moimnum;
	}
	public String getMoimchatcontents() {
		return moimchatcontents;
	}
	public void setMoimchatcontents(String moimchatcontents) {
		this.moimchatcontents = moimchatcontents;
	}
	public String getMoimchatdate() {
		return moimchatdate;
	}
	public void setMoimchatdate(String moimchatdate) {
		this.moimchatdate = moimchatdate;
	}
}
