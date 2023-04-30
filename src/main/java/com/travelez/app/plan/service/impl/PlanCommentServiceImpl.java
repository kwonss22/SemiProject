package com.travelez.app.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelez.app.plan.dao.PlanCommentDAO;
import com.travelez.app.plan.dto.PlanCommentDTO;
import com.travelez.app.plan.service.PlanCommentService;

@Service
public class PlanCommentServiceImpl implements PlanCommentService {

	@Autowired
	PlanCommentDAO dao;
	
	@Override
	public int commentCount(int tpSeq) {
		return dao.commentCount(tpSeq);
	}

	@Override
	public List<PlanCommentDTO> commentList(int tpSeq) {
		return dao.commentList(tpSeq);
	}

	@Override
	public int comWrite(PlanCommentDTO dto) {
		return dao.comWrite(dto);
	}

	@Override
	public int comModify(PlanCommentDTO dto) {
		return dao.comModify(dto);
	}

	@Override
	public int comDelete(int tcCommentSeq) {
		return dao.comDelete(tcCommentSeq);
	}

	@Override
	public int stepUp(int tcCommentSeq) {
		return dao.stepUp(tcCommentSeq);
	}

	@Override
	public int replyWrite(PlanCommentDTO dto) {
		return dao.replyWrite(dto);
	}

}
