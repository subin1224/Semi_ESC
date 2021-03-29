package com.proj.review.model;

import java.sql.SQLException;
import java.util.List;

public class ReviewService {
	public static final int REVIEW_OK=1; //리뷰 있음
	public static final int REVIEW_NOT=2; //리뷰 없음	
	
	private ReviewDAO reviewDao;
	
	public ReviewService() {
		reviewDao = new ReviewDAO();
	}
	
	public int insertReview(ReviewVO vo) throws SQLException {
		return reviewDao.insertReview(vo);
		
	}
	
	public int editReview(ReviewVO vo) throws SQLException {
		return reviewDao.editReview(vo);
	}
	
	public List<ReviewVO> sellectAll(String keyword, String condition) throws SQLException{
	
		return reviewDao.sellectAll(keyword, condition);
	}
	
	public ReviewVO selectByReNo(int reviewNo) throws SQLException {
		return reviewDao.selectByReNo(reviewNo);
	}
	
		
	public String imgByRoomNo(int roomNo) throws SQLException {
		return reviewDao.imgByRoomNo(roomNo);
	}
	
	public ReviewVO selectByRoomNo(int roomNo) throws SQLException {
		return reviewDao.selectByRoomNo(roomNo);
	}
	
	public int updateReadCount(int reviewNo) throws SQLException{
		return reviewDao.updateReadCount(reviewNo);
	}

	public List<ReviewVO> selectByBrandNo(int brandno) throws SQLException{
		return reviewDao.selectByBrandNo(brandno);
	}
	
	public List<ReviewTotalVO> selectReviewByUser(int userno) throws SQLException{
		return reviewDao.selectReviewByUser(userno);
	}
	
	public int chkReview(int reserveNo, int userNo) throws SQLException {
		return reviewDao.chkReview(reserveNo, userNo);
	}	
}
