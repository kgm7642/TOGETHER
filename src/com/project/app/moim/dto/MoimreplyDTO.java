package com.project.app.moim.dto;

public class MoimreplyDTO {
	private int replynum;
	private String replywriter;
	private String replycontents;
	private String regdate;
	private int recruitnum;
	
	public MoimreplyDTO() {
	}
	
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public String getReplywriter() {
		return replywriter;
	}
	public void setReplywriter(String replywriter) {
		this.replywriter = replywriter;
	}
	public String getReplycontents() {
		return replycontents;
	}
	public void setReplycontents(String replycontents) {
		this.replycontents = replycontents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRecruitnum() {
		return recruitnum;
	}
	public void setRecruitnum(int recruitnum) {
		this.recruitnum = recruitnum;
	}
}
