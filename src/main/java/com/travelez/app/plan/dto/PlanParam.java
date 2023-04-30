package com.travelez.app.plan.dto;

import java.io.Serializable;

public class PlanParam implements Serializable {

	private String category, search;
	private int pageNumber, start, end;

	public PlanParam() {
		// TODO Auto-generated constructor stub
	}

	public PlanParam(String category, String search, int pageNumber, int start, int end) {
		super();
		this.category = category;
		this.search = search;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	@Override
	public String toString() {
		return "PlanParam [category=" + category + ", search=" + search + ", pageNumber=" + pageNumber + ", start="
				+ start + ", end=" + end + "]";
	}

}
