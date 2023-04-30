package com.travelez.app.myplan.dao;

import java.util.List;

import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.myplan.dto.MyPlanDetailDto;
import com.travelez.app.myplan.dto.MyPlanDto;

public interface MyplanDao {
	// 여행일정리스트 추가
	int addPlanList(MyPlanDto dto);
	// 여행일정리스트 수정
	int updatePlanList(MyPlanDto dto);
	// 여행일정리스트 삭제
	int deletePlanList(int seq);
	// 여행일정리스트 가져오기
	List<MyPlanDto> myPlanList (String teId);
	
	// 회원정보 가져오기
	MemberDto userInfo(String id);
	
	// 여행일정 클릭 시 seq에 맞는 일정만 가져오기
	MyPlanDto myPlan(int seq);
	
	// 여행디테일리스트 가져오기
	List<MyPlanDetailDto> planDetailList (int seq);
	// 여행 디테일 작성
	int planWrite(MyPlanDetailDto dto);
	// 여행 디테일 수정
	int planUpdate(MyPlanDetailDto dto);
	// 여행 디테일 삭제
	int planDelete(int teDseq);
	// 여행디테일 수정버튼 클릭 시 teDseq에 맞는 정보 가져오기
	MyPlanDetailDto myPlanDetail(int teDseq);
}
