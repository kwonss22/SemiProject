package com.travelez.app.myplan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.myplan.dao.MyplanDao;
import com.travelez.app.myplan.dto.MyPlanDetailDto;
import com.travelez.app.myplan.dto.MyPlanDto;
import com.travelez.app.myplan.service.MyplanService;

@Service
public class MyplanServiceImpl implements MyplanService{
	@Autowired
	MyplanDao dao;

	@Override
	public boolean addPlanList(MyPlanDto dto) {
		int n = dao.addPlanList(dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean updatePlanList(MyPlanDto dto) {
		int n = dao.updatePlanList(dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean deletePlanList(int seq) {
		int n = dao.deletePlanList(seq);
		return n>0?true:false;
	}

	@Override
	public List<MyPlanDto> myPlanList(String teId) {
		return dao.myPlanList(teId);
	}

	@Override
	public MemberDto userInfo(String id) {
		return dao.userInfo(id);
	}

	@Override
	public List<MyPlanDetailDto> planDetailList(int seq) {
		return dao.planDetailList(seq);
	}

	@Override
	public boolean planWrite(MyPlanDetailDto dto) {
		int n = dao.planWrite(dto);
		return n>0?true:false;
	}

	@Override
	public MyPlanDto myPlan(int seq) {
		return dao.myPlan(seq);
	}

	@Override
	public boolean planUpdate(MyPlanDetailDto dto) {
		int n = dao.planUpdate(dto);
		return n>0?true:false;
	}

	@Override
	public boolean planDelete(int teDseq) {
		int n = dao.planDelete(teDseq);
		return n>0?true:false;
	}

	@Override
	public MyPlanDetailDto myPlanDetail(int teDseq) {
		return dao.myPlanDetail(teDseq);
	}

	
	
}
