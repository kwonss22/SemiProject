package com.travelez.app.notice.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travelez.app.notice.dao.NoticeDAO;
import com.travelez.app.notice.dto.NoticeComment;
import com.travelez.app.notice.dto.NoticeDTO;
import com.travelez.app.notice.dto.NoticeParam;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Autowired
	SqlSession session;
	
	String ns = "Bbs.";

	@Override
	public List<NoticeDTO> bbslist(NoticeParam bbs) {		
		return session.selectList(ns + "bbslist", bbs);
	}

	@Override
	public int getAllBbs(NoticeParam bbs) {		
		return session.selectOne(ns + "getAllBbs", bbs);
	}

	@Override
	public int writeBbs(NoticeDTO dto) {		
		return session.insert(ns + "writeBbs", dto);
	}

	@Override
	public NoticeDTO getBbs(int seq) {		
		return session.selectOne(ns + "getBbs", seq);
	}

	@Override
	public int updateBbs(NoticeDTO dto) {	
		return session.update(ns + "updateBbs", dto);
	}

	@Override
	public int answerBbsUpdate(NoticeDTO dto) {		
		return session.update(ns + "answerBbsUpdate", dto);
	}

	@Override
	public int answerBbsInsert(NoticeDTO dto) {		
		return session.insert(ns + "answerBbsInsert", dto);
	}

	@Override
	public int commentWrite(NoticeComment bbs) {		
		return session.insert(ns + "commentWrite", bbs);
	}

	@Override
	public List<NoticeComment> commentList(int seq) {		
		return session.selectList(ns + "commentList", seq);
	}
	
	@Override
	public int deleteBbs(int seq) {
		return session.delete(ns + "deleteBbs", seq);
	}
	
}
