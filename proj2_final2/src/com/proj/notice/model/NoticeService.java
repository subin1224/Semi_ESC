package com.proj.notice.model;

import java.sql.SQLException;
import java.util.List;


public class NoticeService {
	private NoticeDAO noDao;

	public NoticeService() {
		noDao=new NoticeDAO();
	}
	
	//공지사항 등록
	public int insertNotice(NoticeVO noVo) throws SQLException {
		return noDao.insertNotice(noVo);
	}

	
	//공지사항 검색조건으로 전체 선택 
	public List<NoticeVO> selectAll(String condition, String keyword) throws SQLException {
		return noDao.selectAll(condition, keyword);
	}

	//공지사항 전체선택
	public List<NoticeVO> selectAll() throws SQLException {
		return noDao.selectAll();
	}
	
	
	//1231지안 시작
	//공지사항  번호로 조회
	public NoticeVO selectByNo(int noticeNo) throws SQLException {
		return noDao.selectByNo(noticeNo);
	}
	
	//조회시 조회수 업데이트
	public int updateNoHit(int noticeNo) throws SQLException {
		return noDao.updateNoHit(noticeNo);
	}
	
	//공지사항 삭제
	public int deleteNotice(int noticeNo) throws SQLException {
		return noDao.deleteNotice(noticeNo);
	}
	
	//공지사항수정
	public int updateNotice(NoticeVO noticeVo) throws SQLException {
		return noDao.updateNotice(noticeVo);
	}

}

