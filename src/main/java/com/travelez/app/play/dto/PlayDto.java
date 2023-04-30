package com.travelez.app.play.dto;

import java.io.Serializable;

public class PlayDto implements Serializable {
	private int pSeq;
	private String pId;
	private String pLocation;
	private String pTitle;
	private String pWdate;
	private String pContent;
	private int pReadcount;
	private String pFilename;
	private String pNewfilename;

	public PlayDto() {
	}

	public PlayDto(int pSeq, String pId, String pLocation, String pTitle, String pWdate, String pContent,
			int pReadcount, String pFilename, String pNewfilename) {
		super();
		this.pSeq = pSeq;
		this.pId = pId;
		this.pLocation = pLocation;
		this.pTitle = pTitle;
		this.pWdate = pWdate;
		this.pContent = pContent;
		this.pReadcount = pReadcount;
		this.pFilename = pFilename;
		this.pNewfilename = pNewfilename;
	}

	public int getpSeq() {
		return pSeq;
	}

	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpLocation() {
		return pLocation;
	}

	public void setpLocation(String pLocation) {
		this.pLocation = pLocation;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpWdate() {
		return pWdate;
	}

	public void setpWdate(String pWdate) {
		this.pWdate = pWdate;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public int getpReadcount() {
		return pReadcount;
	}

	public void setpReadcount(int pReadcount) {
		this.pReadcount = pReadcount;
	}

	public String getpFilename() {
		return pFilename;
	}

	public void setpFilename(String pFilename) {
		this.pFilename = pFilename;
	}

	public String getpNewfilename() {
		return pNewfilename;
	}

	public void setpNewfilename(String pNewfilename) {
		this.pNewfilename = pNewfilename;
	}

	@Override
	public String toString() {
		return "PlayDto [pSeq=" + pSeq + ", pId=" + pId + ", pLocation=" + pLocation + ", pTitle=" + pTitle
				+ ", pWdate=" + pWdate + ", pContent=" + pContent + ", pReadcount=" + pReadcount + ", pFilename="
				+ pFilename + ", pNewfilename=" + pNewfilename + "]";
	}
}
