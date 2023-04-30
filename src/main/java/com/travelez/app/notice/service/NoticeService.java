package com.travelez.app.notice.service;

import java.util.List;

import com.travelez.app.notice.dto.NoticeComment;
import com.travelez.app.notice.dto.NoticeDTO;
import com.travelez.app.notice.dto.NoticeParam;

public interface NoticeService {
	
	List<NoticeDTO> bbslist(NoticeParam bbs);	
	int getAllBbs(NoticeParam bbs);
	
	boolean writeBbs(NoticeDTO dto);
	
	NoticeDTO getBbs(int seq);
	
	int deleteBbs(int seq);
	
	boolean updateBbs(NoticeDTO dto);
	
	boolean answerBbs(NoticeDTO dto);
	
	boolean commentWrite(NoticeComment bbs);
	List<NoticeComment> commentList(int seq);

}
