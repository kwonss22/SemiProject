package com.travelez.app.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelez.app.notice.dao.NoticeDAO;
import com.travelez.app.notice.dto.NoticeComment;
import com.travelez.app.notice.dto.NoticeDTO;
import com.travelez.app.notice.dto.NoticeParam;
import com.travelez.app.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO dao;

	@Override
	public List<NoticeDTO> bbslist(NoticeParam bbs) {		
		return dao.bbslist(bbs);
	}

	@Override
	public int getAllBbs(NoticeParam bbs) {		
		return dao.getAllBbs(bbs);
	}

	@Override
	public boolean writeBbs(NoticeDTO dto) {
		int n = dao.writeBbs(dto);
		return n>0?true:false;
	}

	@Override
	public NoticeDTO getBbs(int seq) {		
		return dao.getBbs(seq);
	}

	@Override
	public boolean updateBbs(NoticeDTO dto) {
		int n = dao.updateBbs(dto); 
		return n>0?true:false;
	}

	@Override
	public boolean answerBbs(NoticeDTO dto) {
		dao.answerBbsUpdate(dto);
		int n = dao.answerBbsInsert(dto);
		return n>0?true:false;
	}

	@Override
	public boolean commentWrite(NoticeComment bbs) {
		int n = dao.commentWrite(bbs);
		return n>0?true:false;
	}

	@Override
	public List<NoticeComment> commentList(int seq) {		
		return dao.commentList(seq);
	}
	
	@Override
	public int deleteBbs(int seq) {
		return dao.deleteBbs(seq);
	}
}
