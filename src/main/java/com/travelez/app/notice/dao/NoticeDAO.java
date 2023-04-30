package com.travelez.app.notice.dao;

import java.util.List;

import com.travelez.app.notice.dto.NoticeComment;
import com.travelez.app.notice.dto.NoticeDTO;
import com.travelez.app.notice.dto.NoticeParam;

public interface NoticeDAO {
	
	List<NoticeDTO> bbslist(NoticeParam bbs);	
	int getAllBbs(NoticeParam bbs);
	
	int writeBbs(NoticeDTO dto);
	
	NoticeDTO getBbs(int seq);
	
	int updateBbs(NoticeDTO dto);
	
	int deleteBbs(int seq);
	
	int answerBbsUpdate(NoticeDTO dto);
	int answerBbsInsert(NoticeDTO dto);
	
	// 댓글
	int commentWrite(NoticeComment bbs);	
	List<NoticeComment> commentList(int seq);

}
