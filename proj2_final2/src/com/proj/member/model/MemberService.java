package com.proj.member.model;

import java.sql.SQLException;


public class MemberService {
	//아이디 중복확인시 사용
	public static final int EXIST_ID=1;	//아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2;	//존재하지 않는 경우
	
	//로그인처리시 사용
	public static final int LOGIN_OK=1; //로그인 성공 , 회원 권한

	public static final int ID_NONE=2; //아이디가 없는 경우
	public static final int PWD_DISAGREE=3; //비밀번호 불일치

	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao=new MemberDAO();
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		int cnt=memberDao.insertMember(vo);
		return cnt;
	}
	
	public int checkDup(String userid) throws SQLException {
		return memberDao.checkDup(userid);
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException{
		return memberDao.loginCheck(userid, pwd);
	}
	
	public MemberVO selectMember(String userid) throws SQLException {
		return memberDao.selectMember(userid);
	}
	
	public int updateMember(MemberVO vo) throws SQLException {
		return memberDao.updateMember(vo);
	}
	
	public int withdrawMember(String userid) throws SQLException{
		return memberDao.withdrawMember(userid);
	}
	
	//1229지안 업데이트
	public int updateMileage(String userid, int mileage) throws SQLException {
		return memberDao.updateMileage(userid, mileage);
	}	

}
