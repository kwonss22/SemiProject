package com.travelez.app.myplan.dto;

import java.io.Serializable;

public class MyPlanDto implements Serializable {
	private int seq;
	private String teId;
	private String teGoDay;
	private String teEndDay;
	private String tePlace;

	public MyPlanDto() {
			
	}

	public MyPlanDto(int seq, String teId, String teGoDay, String teEndDay, String tePlace) {
		super();
		this.seq = seq;
		this.teId = teId;
		this.teGoDay = teGoDay;
		this.teEndDay = teEndDay;
		this.tePlace = tePlace;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTeId() {
		return teId;
	}

	public void setTeId(String teId) {
		this.teId = teId;
	}

	public String getTeGoDay() {
		return teGoDay;
	}

	public void setTeGoDay(String teGoDay) {
		this.teGoDay = teGoDay;
	}

	public String getTeEndDay() {
		return teEndDay;
	}

	public void setTeEndDay(String teEndDay) {
		this.teEndDay = teEndDay;
	}

	public String getTePlace() {
		return tePlace;
	}

	public void setTePlace(String tePlace) {
		this.tePlace = tePlace;
	}

	@Override
	public String toString() {
		return "MyPlanDto [seq=" + seq + ", teId=" + teId + ", teGoDay=" + teGoDay + ", teEndDay=" + teEndDay
				+ ", tePlace=" + tePlace + "]";
	}
	
	


}

	