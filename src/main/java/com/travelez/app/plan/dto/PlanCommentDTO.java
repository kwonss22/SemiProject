package com.travelez.app.plan.dto;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PlanCommentDTO implements Serializable {
	private int tpSeq, tcCommentSeq, tcRef, tcDepth, tcStep;
	private String tcId, tcContent;
	@DateTimeFormat(pattern = "yy-MM-dd hh:mm")
	private Date tcWriteDate;

	public PlanCommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public PlanCommentDTO(int tpSeq, int tcCommentSeq, int tcRef, int tcDepth, int tcStep, String tcId,
			String tcContent, Date tcWriteDate) {
		super();
		this.tpSeq = tpSeq;
		this.tcCommentSeq = tcCommentSeq;
		this.tcRef = tcRef;
		this.tcDepth = tcDepth;
		this.tcStep = tcStep;
		this.tcId = tcId;
		this.tcContent = tcContent;
		this.tcWriteDate = tcWriteDate;
	}

	public int gettpSeq() {
		return tpSeq;
	}

	public void settpSeq(int tpSeq) {
		this.tpSeq = tpSeq;
	}

	public int getTcCommentSeq() {
		return tcCommentSeq;
	}

	public void setTcCommentSeq(int tcCommentSeq) {
		this.tcCommentSeq = tcCommentSeq;
	}

	public int getTcRef() {
		return tcRef;
	}

	public void setTcRef(int tcRef) {
		this.tcRef = tcRef;
	}

	public int getTcDepth() {
		return tcDepth;
	}

	public void setTcDepth(int tcDepth) {
		this.tcDepth = tcDepth;
	}

	public int getTcStep() {
		return tcStep;
	}

	public void setTcStep(int tcStep) {
		this.tcStep = tcStep;
	}

	public String getTcId() {
		return tcId;
	}

	public void setTcId(String tcId) {
		this.tcId = tcId;
	}

	public String getTcContent() {
		return tcContent;
	}

	public void setTcContent(String tcContent) {
		this.tcContent = tcContent;
	}

	public Date getTcWriteDate() {
		return tcWriteDate;
	}

	public void setTcWriteDate(Date tcWriteDate) {
		this.tcWriteDate = tcWriteDate;
	}

	@Override
	public String toString() {
		return "PlanCommentDTO [tpSeq=" + tpSeq + ", tcCommentSeq=" + tcCommentSeq + ", tcRef=" + tcRef + ", tcDepth="
				+ tcDepth + ", tcStep=" + tcStep + ", tcId=" + tcId + ", tcContent=" + tcContent + ", tcWriteDate="
				+ tcWriteDate + "]";
	}

}
