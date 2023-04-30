package com.travelez.app.myplan.dao.impl;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travelez.app.member.dto.MemberDto;
import com.travelez.app.myplan.dao.MyplanDao;
import com.travelez.app.myplan.dto.MyPlanDetailDto;
import com.travelez.app.myplan.dto.MyPlanDto;

@Repository
public class MyplanDaoImpl implements MyplanDao{
	@Autowired  // 자동생성
	SqlSession session;
	
	String ns = "Myplan.";

	@Override
	public int addPlanList(MyPlanDto dto) {
		return session.insert(ns + "addPlanList", dto);
	}
	
	@Override
	public int updatePlanList(MyPlanDto dto) {
		return session.update(ns + "updatePlanList", dto);
	}
	
	@Override
	public int deletePlanList(int seq) {
		return session.delete(ns + "deletePlanList", seq);
	}
	
	@Override
	public List<MyPlanDto> myPlanList(String teId) {
		return session.selectList(ns + "myPlanList", teId);
	}

	@Override
	public MemberDto userInfo(String id) {
		return session.selectOne(ns + "userInfo", id);
	}

	@Override
	public List<MyPlanDetailDto> planDetailList(int seq) {
		return session.selectList(ns + "planDetailList", seq);
	}

	@Override
	public int planWrite(MyPlanDetailDto dto) {
		return session.insert(ns + "planWrite", dto);
	}

	@Override
	public MyPlanDto myPlan(int seq) {
		return session.selectOne(ns + "myPlan", seq);
	}

	@Override
	public int planUpdate(MyPlanDetailDto dto) {
		return session.update(ns + "planUpdate", dto);
	}

	@Override
	public int planDelete(int teDseq) {
		return session.delete(ns + "planDelete", teDseq);
	}

	@Override
	public MyPlanDetailDto myPlanDetail(int teDseq) {
		return session.selectOne(ns + "myPlanDetail", teDseq);
	}

	

	
	
}
