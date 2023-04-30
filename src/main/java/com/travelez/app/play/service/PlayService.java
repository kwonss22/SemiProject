package com.travelez.app.play.service;

import java.util.List;

import com.travelez.app.play.dto.PlayComment;
import com.travelez.app.play.dto.PlayDto;
import com.travelez.app.play.dto.PlayParam;

public interface PlayService {
	

	List<PlayDto> playlist(PlayParam param);
	
	int getAllPlay(PlayParam param);
	
	boolean writeplay(PlayDto dto);
	
	PlayDto getPlay(int p_seq);
	
	void upReadcount(int p_seq);
	
	boolean updatePlay(PlayDto dto);
	
	boolean deletePlay(int p_seq);
	
	boolean pCommentWrite(PlayComment dto);
	List<PlayComment> pCommentList(int p_seq);
	boolean deleteComment(int p_answerSeq);
	
	int test();

}
