package com.travelez.app.play.dao;

import java.util.List;

import com.travelez.app.play.dto.PlayComment;
import com.travelez.app.play.dto.PlayDto;
import com.travelez.app.play.dto.PlayParam;

public interface PlayDao {
	
	List<PlayDto> playlist(PlayParam param);
	int getAllplay(PlayParam param);
	
	int writeplay(PlayDto dto);
	
	PlayDto getPlay(int p_seq);
	
	void upReadcount(int p_seq);
	
	int updatePlay(PlayDto dto);
	int deletePlay(int p_seq);
	
	int pCommentWrite(PlayComment dto);
	List<PlayComment> pCommentList(int p_seq);
	int deleteComment(int p_answerSeq);
	
	int test();
}
