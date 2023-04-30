package com.travelez.app.plan.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travelez.app.plan.dao.PlanDAO;
import com.travelez.app.plan.dto.LikeDTO;
import com.travelez.app.plan.dto.PlanDTO;
import com.travelez.app.plan.dto.PlanParam;

@Repository
public class PlanDAOImpl implements PlanDAO {

	@Autowired
	SqlSession session;
	
	String NS = "Plan.";
	
	@Override
	public List<PlanDTO> list(PlanParam param) {
		return session.selectList(NS + "getList", param);
	}

	@Override
	public int getPostCount(PlanParam param) {
		return session.selectOne(NS + "getPostCount", param);
	}

	@Override
	public PlanDTO getDetail(int tpSeq) {
		return session.selectOne(NS + "getDetail", tpSeq);
	}

	@Override
	public int planWrite(PlanDTO dto) {
		return session.insert(NS + "planWrite", dto);
	}

	@Override
	public int planUpdate(PlanDTO dto) {
		return session.update(NS + "planUpdate", dto);
	}

	@Override
	public int planDelete(int tpSeq) {
		return session.delete(NS + "planDelete", tpSeq);
	}

	@Override
	public int likeCheck(LikeDTO likeDTO) {
		return session.selectOne(NS + "likeCheck", likeDTO);
	}

	@Override
	public int countLike(int tpSeq) {
		return session.selectOne(NS + "countLike", tpSeq);
	}

	@Override
	public int likeDel(LikeDTO likeDTO) {
		return session.delete(NS + "likeDel", likeDTO);
	}

	@Override
	public int minusLike(int tpSeq) {
		return session.update(NS + "minusLike", tpSeq);
	}
	
	@Override
	public int likeUp(LikeDTO likeDTO) {
		return session.insert(NS + "likeUp", likeDTO);
	}

	@Override
	public int plusLike(int tpSeq) {
		return session.update(NS + "plusLike", tpSeq);
	}

}
