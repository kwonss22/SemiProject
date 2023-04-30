package com.travelez.app.plan.dto;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class PlanDTO implements Serializable {

	private int tpSeq, tpLikeCount;
	private String tpId, tpLocation, tpTitle, tpContent, tpFileName;
	@DateTimeFormat(pattern = "yy-MM-dd hh:mm")
	private Date tpWriteDate;
	private MultipartFile image;
	private String deleteImage;
	
	public PlanDTO() {
		// TODO Auto-generated constructor stub
	}

	public PlanDTO(int tpSeq, int tpLikeCount, String tpId, String tpLocation, String tpTitle, String tpContent,
			String tpFileName, Date tpWriteDate, MultipartFile image, String deleteImage) {
		super();
		this.tpSeq = tpSeq;
		this.tpLikeCount = tpLikeCount;
		this.tpId = tpId;
		this.tpLocation = tpLocation;
		this.tpTitle = tpTitle;
		this.tpContent = tpContent;
		this.tpFileName = tpFileName;
		this.tpWriteDate = tpWriteDate;
		this.image = image;
		this.deleteImage = deleteImage;
	}

	public int getTpSeq() {
		return tpSeq;
	}

	public void setTpSeq(int tpSeq) {
		this.tpSeq = tpSeq;
	}

	public int getTpLikeCount() {
		return tpLikeCount;
	}

	public void setTpLikeCount(int tpLikeCount) {
		this.tpLikeCount = tpLikeCount;
	}

	public String getTpId() {
		return tpId;
	}

	public void setTpId(String tpId) {
		this.tpId = tpId;
	}

	public String getTpLocation() {
		return tpLocation;
	}

	public void setTpLocation(String tpLocation) {
		this.tpLocation = tpLocation;
	}

	public String getTpTitle() {
		return tpTitle;
	}

	public void setTpTitle(String tpTitle) {
		this.tpTitle = tpTitle;
	}

	public String getTpContent() {
		return tpContent;
	}

	public void setTpContent(String tpContent) {
		this.tpContent = tpContent;
	}

	public String getTpFileName() {
		return tpFileName;
	}

	public void setTpFileName(String tpFileName) {
		this.tpFileName = tpFileName;
	}

	public Date getTpWriteDate() {
		return tpWriteDate;
	}

	public void setTpWriteDate(Date tpWriteDate) {
		this.tpWriteDate = tpWriteDate;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getDeleteImage() {
		return deleteImage;
	}

	public void setDeleteImage(String deleteImage) {
		this.deleteImage = deleteImage;
	}

	@Override
	public String toString() {
		return "PlanDTO [tpSeq=" + tpSeq + ", tpLikeCount=" + tpLikeCount + ", tpId=" + tpId + ", tpLocation="
				+ tpLocation + ", tpTitle=" + tpTitle + ", tpContent=" + tpContent + ", tpFileName=" + tpFileName
				+ ", tpWriteDate=" + tpWriteDate + ", image=" + image + ", deleteImage=" + deleteImage + "]";
	}
	
	
}