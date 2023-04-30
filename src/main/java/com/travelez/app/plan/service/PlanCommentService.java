package com.travelez.app.plan.service;

import java.util.List;

import com.travelez.app.plan.dto.PlanCommentDTO;

public interface PlanCommentService {

	// 해당 게시글의 댓글 수
	int commentCount(int tpSeq);
	
	// 해당 게시글의 댓글 리스트
	List<PlanCommentDTO> commentList(int tpSeq);
	
	// 댓글 작성
	int comWrite(PlanCommentDTO dto);
	
	// 댓글 수정
	int comModify(PlanCommentDTO dto);
	
	// 댓글 삭제
	int comDelete(int tcCommentSeq);
	
	// 답글 작성 전, 기존에 답글이 존재하면 step 값 증가
	int stepUp(int tcCommentSeq);
	
	// 답글 작성
	int replyWrite(PlanCommentDTO dto);
}
