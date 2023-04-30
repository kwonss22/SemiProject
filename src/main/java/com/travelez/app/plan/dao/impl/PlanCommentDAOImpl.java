package com.travelez.app.plan.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travelez.app.plan.dto.PlanCommentDTO;

@Repository
public class PlanCommentDAOImpl implements com.travelez.app.plan.dao.PlanCommentDAO {

	@Autowired
	SqlSession session;
	
	String NS = "comment.";
	
	@Override
	public int commentCount(int tpSeq) {
		return session.selectOne(NS + "commentCount", tpSeq);
	}

	@Override
	public List<PlanCommentDTO> commentList(int tpSeq) {
		return session.selectList(NS +"commentList", tpSeq);
	}

	@Override
	public int comWrite(PlanCommentDTO dto) {
		return session.insert(NS + "commentWrite", dto);
	}

	@Override
	public int comModify(PlanCommentDTO dto) {
		return session.update(NS + "commentModify", dto);
	}

	@Override
	public int comDelete(int tcCommentSeq) {
		return session.delete(NS + "commentDelete", tcCommentSeq);
	}

	@Override
	public int stepUp(int tcCommentSeq) {
		return session.update(NS + "stepUp", tcCommentSeq);
	}

	@Override
	public int replyWrite(PlanCommentDTO dto) {
		return session.insert(NS + "replyWrite", dto);
	}

}
