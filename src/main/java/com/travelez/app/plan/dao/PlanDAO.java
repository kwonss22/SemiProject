package com.travelez.app.plan.dao;

import java.util.List;

import com.travelez.app.plan.dto.LikeDTO;
import com.travelez.app.plan.dto.PlanDTO;
import com.travelez.app.plan.dto.PlanParam;

public interface PlanDAO {

	// 리스트
	List<PlanDTO> list(PlanParam param);
	
	// 총 게시글 수
	int getPostCount(PlanParam param);
	
	// 게시글 상세
	PlanDTO getDetail(int tpSeq);
	
	// 게시글 작성
	int planWrite(PlanDTO dto);
	
	// 게시글 수정
	int planUpdate(PlanDTO dto);
	
	// 게시글 삭제
	int planDelete(int tpSeq);
	
	// 좋아요 체크
	int likeCheck(LikeDTO likeDTO);
	
	// 기존에 좋아요 클릭한 이력이 있으면 취소 및 좋아요 개수 감소
	int likeDel(LikeDTO likeDTO);
	int minusLike(int tpSeq);
	
	// 기존에 좋아요 클릭한 이력이 없으면 좋아요 반영 및 개수 증가
	int likeUp(LikeDTO likeDTO);
	int plusLike(int tpSeq);
	
	
	// 좋아요 개수
	int countLike(int tpSeq);
	
	
	
	
}
