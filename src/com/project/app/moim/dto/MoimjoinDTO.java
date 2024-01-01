package com.project.app.moim.dto;

public class MoimjoinDTO {
	private int moimjoinnum;
	private String kinguserid;
	private String joinuserid;
	private int moimnum;
	private String joincontents;
	private String regdate;

	public MoimjoinDTO() {
	}
	
	public int getMoimjoinnum() {
		return moimjoinnum;
	}
	public void setMoimjoinnum(int moimjoinnum) {
		this.moimjoinnum = moimjoinnum;
	}
	public String getKinguserid() {
		return kinguserid;
	}
	public void setKinguserid(String kinguserid) {
		this.kinguserid = kinguserid;
	}
	public String getJoinuserid() {
		return joinuserid;
	}
	public void setJoinuserid(String joinuserid) {
		this.joinuserid = joinuserid;
	}
	public int getMoimnum() {
		return moimnum;
	}
	public void setMoimnum(int moimnum) {
		this.moimnum = moimnum;
	}
	public String getJoincontents() {
		return joincontents;
	}
	public void setJoincontents(String joincontents) {
		this.joincontents = joincontents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
