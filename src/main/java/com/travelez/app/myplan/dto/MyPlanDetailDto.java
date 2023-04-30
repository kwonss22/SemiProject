package com.travelez.app.myplan.dto;

import java.io.Serializable;

public class MyPlanDetailDto implements Serializable{
	private int seq;
	private int teDseq;
	private String teId;
	private String tePlace;
	private String teDday;
	private String teTime;
	private String teMemo;
	
	public MyPlanDetailDto() {
		
	}

	

	public MyPlanDetailDto(int seq, int teDseq, String teId, String tePlace, String teDday, String teTime,
			String teMemo) {
		super();
		this.seq = seq;
		this.teDseq = teDseq;
		this.teId = teId;
		this.tePlace = tePlace;
		this.teDday = teDday;
		this.teTime = teTime;
		this.teMemo = teMemo;
	}


	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getTeDseq() {
		return teDseq;
	}

	public void setTeDseq(int teDseq) {
		this.teDseq = teDseq;
	}

	public String getTeId() {
		return teId;
	}

	public void setTeId(String teId) {
		this.teId = teId;
	}

	public String getTePlace() {
		return tePlace;
	}

	public void setTePlace(String tePlace) {
		this.tePlace = tePlace;
	}

	public String getTeDday() {
		return teDday;
	}

	public void setTeDday(String teDday) {
		this.teDday = teDday;
	}
	
	public String getTeTime() {
		return teTime;
	}

	public void setTeTime(String teTime) {
		this.teTime = teTime;
	}

	public String getTeMemo() {
		return teMemo;
	}

	public void setTeMemo(String teMemo) {
		this.teMemo = teMemo;
	}



	@Override
	public String toString() {
		return "MyPlanDetailDto [seq=" + seq + ", teDseq=" + teDseq + ", teId=" + teId + ", tePlace=" + tePlace
				+ ", teDday=" + teDday + ", teTime=" + teTime + ", teMemo=" + teMemo + "]";
	}



	


	
	
	
	
}
