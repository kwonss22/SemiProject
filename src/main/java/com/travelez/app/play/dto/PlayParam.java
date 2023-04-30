package com.travelez.app.play.dto;

import java.io.Serializable;

public class PlayParam implements Serializable {

	private String choice; //  카테고리 (제목/내용/작성자)
	private String search; //  검색어
	private int pageNumber; // [1][2][3]
	
	private int start;    //[start]....[end]
	private int end;
	
	public PlayParam() {
	}

	public PlayParam(String choice, String search, int pageNumber, int start, int end) {
		super();
		this.choice = choice;
		this.search = search;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
}
