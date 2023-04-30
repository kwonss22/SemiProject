package com.travelez.app.plan.dto;

import java.io.Serializable;

public class LikeDTO implements Serializable {
	private String tpId;
	private int tpSeq;
	
	public LikeDTO() {
		// TODO Auto-generated constructor stub
	}

	public LikeDTO(String tpId, int tpSeq) {
		super();
		this.tpId = tpId;
		this.tpSeq = tpSeq;
	}

	public String getTpId() {
		return tpId;
	}

	public void setTpId(String tpId) {
		this.tpId = tpId;
	}

	public int getTpSeq() {
		return tpSeq;
	}

	public void setTpSeq(int tpSeq) {
		this.tpSeq = tpSeq;
	}

	@Override
	public String toString() {
		return "LikeDTO [tpId=" + tpId + ", tpSeq=" + tpSeq + "]";
	}
	
	
}
