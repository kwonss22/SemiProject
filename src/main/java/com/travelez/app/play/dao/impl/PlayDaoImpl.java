package com.travelez.app.play.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travelez.app.play.dao.PlayDao;
import com.travelez.app.play.dto.PlayComment;
import com.travelez.app.play.dto.PlayDto;
import com.travelez.app.play.dto.PlayParam;

@Repository
public class PlayDaoImpl implements PlayDao {

	@Autowired
	SqlSession session;

	String ns = "Play.";

	@Override
	public List<PlayDto> playlist(PlayParam param) {
		return session.selectList(ns + "playlist", param);
	}

	@Override
	public int getAllplay(PlayParam param) {
		return session.selectOne(ns + "getAllPlay", param);
	}

	@Override
	public int writeplay(PlayDto dto) {

		return session.insert(ns + "writePlay", dto);
	}

	@Override
	public PlayDto getPlay(int p_seq) {
		return session.selectOne(ns + "getPlay", p_seq);
	}

	@Override
	public void upReadcount(int p_seq) {
		 session.update(ns + "upReadcount", p_seq);
	}

	@Override
	public int updatePlay(PlayDto dto) {
		return session.update(ns + "updatePlay", dto);
	}

	@Override
	public int deletePlay(int p_seq) {

		return session.delete(ns + "deletePlay", p_seq);
	}

	@Override
	public int pCommentWrite(PlayComment dto) {
		return session.insert(ns + "pCommentWrite", dto);
	}

	@Override
	public List<PlayComment> pCommentList(int p_seq) {
		return session.selectList(ns + "pCommentList", p_seq);
	}

	@Override
	public int deleteComment(int p_answerSeq) {
		return session.delete(ns + "deleteComment", p_answerSeq);
	}

	@Override
	public int test() {
		return session.selectOne(ns + "getPost");
	}

}
