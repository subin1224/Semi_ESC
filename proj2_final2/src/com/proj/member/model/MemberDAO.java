package com.proj.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import com.proj.db.ConnectionPoolMgr2;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;
	
	public MemberDAO() {
		pool=new ConnectionPoolMgr2();		
	}
	
	//유저 - 회원가입
	public int insertMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			String sql="insert into escmem(userno,userid,userpwd,username,usertel)"
					+ " values(escmem_seq.nextval,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getUserId());
			ps.setString(2, vo.getUserPwd());
			ps.setString(3, vo.getUserName());
			ps.setString(4, vo.getUserTel());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("회원 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	//유저 - 아이디 중복체크
	public int checkDup(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			
			String sql="select count(*) from escmem where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) { //아이디가 있음
					result=MemberService.EXIST_ID; //이미 존재
				}else { //아이디가 없음
					result=MemberService.NON_EXIST_ID; 					
				}
			}//if
			
			System.out.println("아이디 중복확인 결과, result="+result
					+", 매개변수 userid="+userid);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}		
	}
	
	//유저 - 로그인 일치 (로그인 화면)
	public int loginCheck(String userid, String pwd) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		
		try{
			con=pool.getConnection();
			//아이디에 해당하는 패스워드 읽어오기
			String sql="select userpwd from escmem where userid=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()){
				String dbPwd=rs.getString(1);
				//3가지로 나누어서 작업 : 로그인 성공? 아이디? 비밀번호?
				if(dbPwd.equals(pwd)){
					result=MemberService.LOGIN_OK;
				}else{
					result=MemberService.PWD_DISAGREE;
				}
			}else {
				result=MemberService.ID_NONE;
			}
			
			System.out.println("로그인 처리결과, result="+result
					+", 매개변수 userid="+userid+", pwd="+pwd);
			return result;
		}finally{
			pool.dbClose(rs, ps, con);
		}		
	}
	
	//유저에 관한 정보
	public MemberVO selectMember(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		MemberVO vo= new MemberVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from escmem where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int userno=rs.getInt("userno");
				String m_userid=rs.getString("userid");
				String username=rs.getString("username");
				String userpwd=rs.getString("userpwd");
				String usertel=rs.getString("usertel");
				Timestamp userregdate=rs.getTimestamp("userregdate");
				int mileage=rs.getInt("mileage");
				Timestamp outdate=rs.getTimestamp("outdate");
				
				vo.setMileage(mileage);
				vo.setOutdate(outdate);
				vo.setUserId(m_userid);
				vo.setUserName(username);
				vo.setUserNo(userno);
				vo.setUserPwd(userpwd);
				vo.setUserRegdate(userregdate);
				vo.setUserTel(usertel);
			}
			System.out.println("회원정보 조회 결과 vo="+vo+", 매개변수 userid="+userid);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}		
	}
	
	//유저 - 회원 수정
	public int updateMember(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update escmem"
					+ " set username=?, usertel=?, userpwd=?"
					+ " where userid=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getUserName());
			ps.setString(2, vo.getUserTel());
			ps.setString(3, vo.getUserPwd());
			ps.setString(4, vo.getUserId());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원수정 결과 cnt="+cnt+",매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}		
		
	}
	
	//유저 - 회원 탈퇴
	public int withdrawMember(String userid) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try{
			con=pool.getConnection();

			String sql="update escmem" 
					+" set outdate=sysdate" 
					+" where userid=? and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			cnt=ps.executeUpdate();
			
			System.out.println("회원 탈퇴 결과 cnt="+cnt+", userid="+userid);
			
			return cnt;
		}finally{
			pool.dbClose(ps, con);
		}		
	}
	
	//1229 지안 마일리지 업데이트 // reserve Detail 에서 업데이트 하기위함
	public int updateMileage(String userid, int mileage) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		int cnt =0;
		try {
			con = pool.getConnection();
			
			String sql = "update escmem " + 
					"set mileage = (mileage - ? ) " + 
					"where userid = ? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, mileage);
			ps.setString(2, userid);
			
			cnt = ps.executeUpdate();
			
			System.out.println("유저아이디랑 마일리지로 회원테이블 마일리지 업데이트 결과 cnt="+cnt+", 매개변수 userid="+userid+", mileage="+mileage);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}	
}
