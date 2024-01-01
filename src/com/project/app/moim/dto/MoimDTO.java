package com.project.app.moim.dto;

public class MoimDTO {
	private int moimnum;
	private String moimname;
	private int moimtype;
	private int moimbudget;
	private String startdate;
	private String enddate;
	private String userid;
	private int placenum;
	private int dislike;

	public MoimDTO() {
	}
	
	public int getMoimnum() {
		return moimnum;
	}
	public void setMoimnum(int moimnum) {
		this.moimnum = moimnum;
	}
	public String getMoimname() {
		return moimname;
	}
	public void setMoimname(String moimname) {
		this.moimname = moimname;
	}
	public int getMoimtype() {
		return moimtype;
	}
	public void setMoimtype(int moimtype) {
		this.moimtype = moimtype;
	}
	public int getMoimbudget() {
		return moimbudget;
	}
	public void setMoimbudget(int moimbudget) {
		this.moimbudget = moimbudget;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPlacenum() {
		return placenum;
	}
	public void setPlacenum(int placenum) {
		this.placenum = placenum;
	}
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
}
