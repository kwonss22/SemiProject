package com.travelez.app.myplan.service;

import java.util.List;

import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.myplan.dto.MyPlanDetailDto;
import com.travelez.app.myplan.dto.MyPlanDto;

public interface MyplanService {
	// 여행일정리스트 추가 
	boolean addPlanList(MyPlanDto dto);
	// 여행일정리스트 수정
	boolean updatePlanList(MyPlanDto dto);
	// 여행일정리스트 삭제
	boolean deletePlanList(int seq);
	// 여행일정리스트 가져오기
	List<MyPlanDto> myPlanList(String teId);
	
	// 회원정보
	MemberDto userInfo(String id);
	
	// 여행일정 클릭 시 seq에 맞는 일정만 가져오기
	MyPlanDto myPlan(int seq);
	
	// 여행디테일리스트 가져오기
	List<MyPlanDetailDto> planDetailList (int seq);
	// 여행 디테일 작성
	boolean planWrite(MyPlanDetailDto dto);
	// 여행 디테일 수정
	boolean planUpdate(MyPlanDetailDto dto);
	// 여행 디테일 삭제
	boolean planDelete(int teDseq);
	
	// 여행디테일 수정버튼 클릭 시 teDseq에 맞는 정보 가져오기
	MyPlanDetailDto myPlanDetail(int teDseq);
}
