//1227 지안 14 번 줄 부터 추가 부탁드립니다.

package com.proj.unit.model;

import java.sql.SQLException;
import java.util.List;

public class UnitService {
	private UnitDAO dao;
	
	public UnitService() {
		dao=new UnitDAO();
	}

	//지안 시작
	public List<UnitVO> selectUnitByBrandLocation1(int BrandNo, String Location1Code) throws SQLException{
		return dao.selectUnitByBrandLocation1(BrandNo, Location1Code);
	}
	
	//1228 수정 추가
	public UnitVO selectByUnitNo(int unitNo) throws SQLException {
		return dao.selectByUnitNo(unitNo);
	}
	
	
	public String selectUnitNameByUnitNo(int unitNo) throws SQLException {
		return dao.selectUnitNameByUnitNo(unitNo);
	}
	
	//수빈
	//지점 추가
	public int insertUnit(UnitVO vo) throws SQLException {
		return dao.insertUnit(vo);
	}	
	
	//1228 수정 추가
	public List<UnitVO> selectAll() throws SQLException {
		return dao.selectAll();
	}

	//브랜드No 통해서 Unit 정보 리스트 출력 :1229
	public List<UnitVO> selectUnitByBrandNo(int brandNo) throws SQLException{
		return dao.selectUnitByBrandNo(brandNo);
	}
}
