package com.travelez.app.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.travelez.app.plan.dto.PlanCommentDTO;
import com.travelez.app.plan.service.PlanCommentService;

/**
 * 여행 플랜 게시판 - 댓글
 * @author 해운
 *
 */
@Controller
@RequestMapping("/plan")
public class PlanCommentController {

	@Autowired
	PlanCommentService service;
	
	// 댓글 등록
	@ResponseBody
	@PostMapping(value = "comWrite.do", produces = "application/text;charset=UTF-8")
	public String repWrite(PlanCommentDTO dto) {
		
		int count = service.comWrite(dto);
		return count > 0 ? "댓글이 등록되었습니다" : "실패";
		
	}
	
	
	@ResponseBody
	@PostMapping(value = "comModify.do", produces = "application/text;charset=UTF-8")
	public String repModify(PlanCommentDTO dto) {
		
		int count = service.comModify(dto);
		return count > 0 ? "댓글이 수정되었습니다" : "실패";
		
	}
	
	
	@ResponseBody
	@GetMapping(value = "comDelete.do", produces = "application/text;charset=UTF-8")
	public String repDelete(int tcCommentSeq) {
		
		int count = service.comDelete(tcCommentSeq);
		return count > 0 ? "댓글이 삭제되었습니다" : "실패";
		
	}
	
	// 리댓 등록
	@ResponseBody
	@PostMapping(value = "replyWrite.do", produces = "application/text;charset=UTF-8")
	public String repAnswer(PlanCommentDTO dto) {
		
		// 기존에 리댓이 있으면 그 리댓들의 STEP값을 1씩 증가
		service.stepUp(dto.getTcCommentSeq());
		
		// 리댓 등록
		int reComment = service.replyWrite(dto);
		return reComment > 0 ? "댓글이 등록되었습니다" : "실패";
		
	}
	
}
