package com.proj.brand.model;

import java.sql.SQLException;
import java.util.List;


public class BrandService {
	private BrandDAO brandDao;

	public BrandService() {
		brandDao=new BrandDAO();
	}

	public int insertBrand(BrandVO vo) throws SQLException {
		return brandDao.insertBrand(vo);
	}	

	//브랜드명 수정
	public int updateBrand(String brandname, int brandno) throws SQLException {
		return brandDao.updateBrand(brandname, brandno);
	}	

	//해당 브랜드 번호를 가진 브랜드 정보 조회
	public BrandVO selectByNo(int brandNo) throws SQLException {
		return brandDao.selectByNo(brandNo);
	}

	//1228 추가 : 입력한 브랜드 값 제외하고 출력
	public String selectBrandNameByNo(int brandNo) throws SQLException {
		return brandDao.selectBrandNameByNo(brandNo);
	}

	//1228 추가 : 입력한 브랜드 값에 따른 브랜드네임 출력
	public String selectBnameByNo(int brandNo) throws SQLException {
		return brandDao.selectBnameByNo(brandNo);
	}

	
	//해당 브랜드 이름을 가진 브랜드 정보 조회
	public BrandVO selectByBrandName(String brandName) throws SQLException {
		return brandDao.selectByBrandName(brandName);
	}

	//브랜드 전체 리스트 출력
	public List<BrandVO> selectByAll() throws SQLException{
		return brandDao.selectByAll();
	}

	//브랜드 adFlag='N'인 브랜드리스트 
	public List<BrandVO> selectFlagN() throws SQLException{
		return brandDao.selectFlagN();
	}

	//브랜드 관리자 아이디 조회 중복체크
	public int checkDup(String adid) throws SQLException {
		return brandDao.checkDup(adid);
	}

	//로그인
	public int loginCheck(String adid, String adpwd) throws SQLException{
		return brandDao.loginCheck(adid, adpwd);
	}

	//브랜드 관리자의 브랜드 정보
	public BrandVO selectByAdminId(String adid) throws SQLException {
		return brandDao.selectByAdminId(adid);
	}

	//플래그 업데이트
	public int updateFlag(int brandno) throws SQLException {
		return brandDao.updateFlag(brandno);
	}

	//flag N 요청삭제
	public int deleteNflag(int brandno) throws SQLException {
		return brandDao.deleteNflag(brandno);
	}
	
	//예약 브랜드 리스트 뿌리기 
	public List<BrandVO> selectByLoc1(String Location1Code) throws SQLException{
		return brandDao.selectByLoc1(Location1Code);
	}

	//브랜드 번호로 브랜드 이름 구하기
	public String selectBrandNameByBrandNo(int brandNo) throws SQLException {
		return brandDao.selectBrandNameByBrandNo(brandNo);
	}	
		
	
	
	
}
