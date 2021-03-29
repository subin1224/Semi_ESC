package com.proj.coupon.model;

import java.sql.SQLException;
import java.util.List;

public class CouponService {

	private CouponDAO cpDao;

	public CouponService() {
		cpDao=new CouponDAO();
	}

	
	//쿠폰 전체 리스트 조회
	public List<CouponVO> selectAll() throws SQLException{
		return cpDao.selectAll();
	}
	
	//통합관리자 쿠폰삭제
	public int deleteCoupon(int couponNo) throws SQLException {
		return cpDao.deleteCoupon(couponNo);
	}
	
	
	//통합관리자 쿠폰등록
	public int insertCoupon(CouponVO vo,  int day) throws SQLException {
		return cpDao.insertCoupon(vo, day);
	}
}
