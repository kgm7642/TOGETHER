package com.project.app.moim.dto;

public class FollowDTO {
	private int follownum;
	private String userid;
	private String followid;
	private String regdate;
	
	public FollowDTO() {
		
	}
	public int getFollownum() {
		return follownum;
	}
	public void setFollownum(int follownum) {
		this.follownum = follownum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFollowid() {
		return followid;
	}
	public void setFollowid(String followid) {
		this.followid = followid;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}