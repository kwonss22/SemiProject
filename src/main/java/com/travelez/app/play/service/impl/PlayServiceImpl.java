package com.travelez.app.play.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelez.app.play.dao.PlayDao;
import com.travelez.app.play.dto.PlayComment;
import com.travelez.app.play.dto.PlayDto;
import com.travelez.app.play.dto.PlayParam;
import com.travelez.app.play.service.PlayService;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDao dao;

	@Override
	public List<PlayDto> playlist(PlayParam param) {
		return dao.playlist(param);
	}

	@Override
	public int getAllPlay(PlayParam param) {
		return dao.getAllplay(param);
	}

	@Override
	public boolean writeplay(PlayDto dto) {
		int n = dao.writeplay(dto);
		return n > 0 ? true : false;
	}

	@Override
	public PlayDto getPlay(int p_seq) {
		return dao.getPlay(p_seq);
	}

	@Override
	public void upReadcount(int p_seq) {
		dao.upReadcount(p_seq);
	}

	@Override
	public boolean updatePlay(PlayDto dto) {
		int n = dao.updatePlay(dto);
		return n > 0 ? true : false;
	}

	@Override
	public boolean deletePlay(int p_seq) {
		int n = dao.deletePlay(p_seq);
		return n > 0 ? true : false;
	}

	@Override
	public boolean pCommentWrite(PlayComment dto) {
		int n = dao.pCommentWrite(dto);
		return n > 0 ? true : false;
	}

	@Override
	public List<PlayComment> pCommentList(int p_seq) {
		return dao.pCommentList(p_seq);
	}

	@Override
	public boolean deleteComment(int p_answerSeq) {
		int n = dao.deleteComment(p_answerSeq);
		return n > 0 ? true : false;

	}

	@Override
	public int test() {
		return dao.test();
			
	}

}
