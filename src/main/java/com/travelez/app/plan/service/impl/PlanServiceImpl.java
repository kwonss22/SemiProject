package com.travelez.app.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelez.app.plan.dao.PlanDAO;
import com.travelez.app.plan.dto.LikeDTO;
import com.travelez.app.plan.dto.PlanDTO;
import com.travelez.app.plan.dto.PlanParam;
import com.travelez.app.plan.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	PlanDAO dao;

	@Override
	public List<PlanDTO> list(PlanParam param) {
		return dao.list(param);
	}

	@Override
	public int getPostCount(PlanParam param) {
		return dao.getPostCount(param);
	}

	@Override
	public PlanDTO getDetail(int tpSeq) {
		return dao.getDetail(tpSeq);
	}

	@Override
	public int planWrite(PlanDTO dto) {
		return dao.planWrite(dto);
	}

	@Override
	public int planUpdate(PlanDTO dto) {
		return dao.planUpdate(dto);
	}

	@Override
	public int planDelete(int tpSeq) {
		return dao.planDelete(tpSeq);
	}

	@Override
	public int likeCheck(LikeDTO likeDTO) {
		return dao.likeCheck(likeDTO);
	}

	@Override
	public int countLike(int tpSeq) {
		return dao.countLike(tpSeq);
	}

	@Override
	public int likeDel(LikeDTO likeDTO) {
		return dao.likeDel(likeDTO);
	}

	@Override
	public int minusLike(int tpSeq) {
		return dao.minusLike(tpSeq);
	}

	@Override
	public int likeUp(LikeDTO likeDTO) {
		return dao.likeUp(likeDTO);
	}

	@Override
	public int plusLike(int tpSeq) {
		return dao.plusLike(tpSeq);
	}


}
