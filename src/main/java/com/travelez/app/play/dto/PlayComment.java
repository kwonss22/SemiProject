package com.travelez.app.play.dto;

import java.io.Serializable;

public class PlayComment implements Serializable {
	
	private int pSeq;
	private int pAnswerSeq;
	private String pId;
	private String pContent;
	private String pWdate;
	
	public PlayComment() {
	}

	public PlayComment(int pSeq, int pAnswerSeq, String pId, String pContent, String pWdate) {
		super();
		this.pSeq = pSeq;
		this.pAnswerSeq = pAnswerSeq;
		this.pId = pId;
		this.pContent = pContent;
		this.pWdate = pWdate;
	}

	public int getpSeq() {
		return pSeq;
	}

	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}

	public int getpAnswerSeq() {
		return pAnswerSeq;
	}

	public void setpAnswerSeq(int pAnswerSeq) {
		this.pAnswerSeq = pAnswerSeq;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpWdate() {
		return pWdate;
	}

	public void setpWdate(String pWdate) {
		this.pWdate = pWdate;
	}

	@Override
	public String toString() {
		return "PlayComment [pSeq=" + pSeq + ", pAnswerSeq=" + pAnswerSeq + ", pId=" + pId + ", pContent=" + pContent
				+ ", pWdate=" + pWdate + "]";
	}

	
	
}
