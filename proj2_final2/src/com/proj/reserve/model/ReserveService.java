package com.proj.reserve.model;

import java.sql.SQLException;
import java.util.List;

public class ReserveService {
	private ReserveDAO reserveDao;

	public ReserveService() {
		reserveDao = new ReserveDAO();
	}

	//해당 브랜드NO의 예약목록 5건 조회
	public List<ReserveVO> selectByBrandNO(int brandNo) throws SQLException {
		return reserveDao.selectByBrandNO(brandNo);
	}

	//해당 브랜드의 예약목록 전체 조회
	public List<ReserveVO> selectByBrandNoAll(int brandNo) throws SQLException {
		return reserveDao.selectByBrandNoAll(brandNo);
	}

	//예약 - 2번 insert 
	public int insertReserveAll(ReserveVO vo) throws SQLException {
		return reserveDao.insertReserveAll(vo);
	}	

	//1229 지안 추가
	public List<ReserveVO> selectReserveFlag(int roomNo) throws SQLException {
		return reserveDao.selectReserveFlag(roomNo);
	}	
	
	//유저가 예약내역 조회
	public List<ReserveVO> selectReserveByUserNo(int userNo) throws SQLException{
		return reserveDao.selectReserveByUserNo(userNo);
	}
	
	//review write...
	public ReserveVO selectByReserveNo(int reserveNo) throws SQLException {
		return reserveDao.selectByReserveNo(reserveNo);
	}
}
