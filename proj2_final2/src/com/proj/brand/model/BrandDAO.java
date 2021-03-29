package com.proj.brand.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;
import com.proj.member.model.MemberService;

public class BrandDAO {
	private ConnectionPoolMgr2 pool;


	public BrandDAO() {
		pool=new ConnectionPoolMgr2();
	}

	//브랜드명 - 관리자 등록
	public int insertBrand(BrandVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();
			String sql="insert into brand(brandno, brandname, adid, adpwd, adtel)"
					+ " values(brand_seq.nextval,?,?,?,?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getBrandName());
			ps.setString(2, vo.getAdId());
			ps.setString(3, vo.getAdPwd());
			ps.setString(4, vo.getAdTel());

			int cnt=ps.executeUpdate();

			System.out.println("브랜드 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	//브랜드명 수정
	public int updateBrand(String brandname, int brandno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();
			String sql="update brand"
					+ " set brandname=?"
					+ " where brandno=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, brandname);
			ps.setInt(2, brandno);

			int cnt=ps.executeUpdate();

			System.out.println("브랜드 수정 결과 cnt="+cnt+", 매개변수 BrandName="+brandname+", brandNo="+brandno);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	//해당 브랜드 번호를 가진 브랜드 정보 조회
	public BrandVO selectByNo(int brandNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		BrandVO vo=new BrandVO();
		try {
			con=pool.getConnection();

			String sql="select * from brand where brandno=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, brandNo);

			rs=ps.executeQuery();

			while(rs.next()) {
				vo.setBrandNo(brandNo);
				vo.setBrandName(rs.getString("brandname"));
				vo.setAdTel(rs.getString("adtel"));
				vo.setAdId(rs.getString("adid"));
				vo.setAdPwd(rs.getString("adpwd"));
				vo.setAdFlag(rs.getString("adflag"));
			}

			System.out.println("해당 브랜드의 상세정보 VO="+vo+", 매개변수 brandNo="+brandNo);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//1228 추가 : 입력한 브랜드 값 제외하고 출력
		public String selectBrandNameByNo(int brandNo) throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			try {
				con=pool.getConnection();
				
				String sql="select brandName from brand where brandno not like ?";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, brandNo);
				
				rs=ps.executeQuery();
				String brandName="";
				
				if(rs.next()) {
					brandName=rs.getString("brandname");

				}
				
				System.out.println("brandNo로 조회한 brandName="+brandName+", 留ㅺ컻蹂��닔 brandNo="+brandNo);
				
				return brandName;
			}finally {
				pool.dbClose(rs, ps, con);
			}
		}
		
		//1228 추가 : 입력한 브랜드 값에 따른 브랜드네임 출력
		public String selectBnameByNo(int brandNo) throws SQLException {
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			try {
				con=pool.getConnection();
				
				String sql="select brandName from brand where brandno =? and brandNo not like 999";
				ps=con.prepareStatement(sql);
				
				ps.setInt(1, brandNo);
				
				rs=ps.executeQuery();
				String brandName="";
				
				if(rs.next()) {
					brandName=rs.getString("brandname");
				}
				
				System.out.println("brand 선택 검색 결과, brandName="+brandName+", 매개변수 brandNo="+brandNo);
				
				return brandName;
			}finally {
				pool.dbClose(rs, ps, con);
			}
		}
		
	//해당 브랜드 이름을 가진 브랜드 정보 조회
	public BrandVO selectByBrandName(String brandName) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		BrandVO vo=new BrandVO();
		try {
			con=pool.getConnection();

			String sql="select * from brand where brandname=? ";
			ps=con.prepareStatement(sql);

			ps.setString(1, brandName);

			rs=ps.executeQuery();

			while(rs.next()) {
				vo.setBrandNo(rs.getInt("brandno"));
				vo.setBrandName(rs.getString("brandname"));
				vo.setAdTel(rs.getString("adtel"));
				vo.setAdId(rs.getString("adid"));
				vo.setAdPwd(rs.getString("adpwd"));
				vo.setAdFlag(rs.getString("adflag"));
			}

			System.out.println("해당 브랜드의 상세정보 VO="+vo+", 매개변수 brandName="+brandName);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}	
	//브랜드 관리자의 브랜드 정보
	public BrandVO selectByAdminId(String adid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		BrandVO vo=new BrandVO();
		try {
			con=pool.getConnection();

			String sql="select * from brand where adid=? ";
			ps=con.prepareStatement(sql);

			ps.setString(1, adid);

			rs=ps.executeQuery();

			while(rs.next()) {
				vo.setBrandNo(rs.getInt("brandno"));
				vo.setBrandName(rs.getString("brandname"));
				vo.setAdTel(rs.getString("adtel"));
				vo.setAdId(rs.getString("adid"));
				vo.setAdPwd(rs.getString("adpwd"));
				vo.setAdFlag(rs.getString("adflag"));
			}

			System.out.println("해당 브랜드의 상세정보 VO="+vo+", 매개변수 adId="+adid);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}	


	//브랜드 전체 리스트 출력
	public List<BrandVO> selectByAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<BrandVO> list=new ArrayList<BrandVO>();
		try {
			con=pool.getConnection();
			String sql="select * from brand order by brandno";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			while(rs.next()) {
				int brandNo=rs.getInt("brandno");
				String brandName=rs.getString("brandname");
				String adId=rs.getString("adId");
				String adPwd=rs.getString("adPwd");
				String adTel=rs.getString("adTel");
				String adFlag=rs.getString("adFlag");

				BrandVO vo=new BrandVO(brandNo, brandName, adId, adPwd, adTel, adFlag);

				list.add(vo);
			}			

			System.out.println("전체 테마 리스트 list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//브랜드 adFlag='N'인 브랜드리스트 
	public List<BrandVO> selectFlagN() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<BrandVO> list=new ArrayList<BrandVO>();
		try {
			con=pool.getConnection();
			String sql="select * from brand where adflag=? order by brandno desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, "N");

			rs=ps.executeQuery();
			while(rs.next()) {
				int brandNo=rs.getInt("brandno");
				String brandName=rs.getString("brandname");
				String adId=rs.getString("adId");
				String adPwd=rs.getString("adPwd");
				String adTel=rs.getString("adTel");
				String adFlag=rs.getString("adFlag");

				BrandVO vo=new BrandVO(brandNo, brandName, adId, adPwd, adTel, adFlag);

				list.add(vo);
			}			

			System.out.println("승인 요청중인 테마 리스트 list.size"+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//관리자 아이디 중복 확인
	public int checkDup(String adid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		int result=0;
		try {
			con=pool.getConnection();

			String sql="select count(*) from brand where adid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, adid);

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
					+", 매개변수 adid="+adid);

			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}		
	}	

	//관리자 아이디 로그인
	public int loginCheck(String adid, String adpwd) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;

		try{
			con=pool.getConnection();
			//아이디에 해당하는 패스워드 읽어오기
			String sql="select adpwd from brand where adid=? and adflag='Y' ";
			ps=con.prepareStatement(sql);
			ps.setString(1, adid);

			rs=ps.executeQuery();
			if(rs.next()){
				String dbPwd=rs.getString(1);
				//3가지로 나누어서 작업 : 로그인 성공? 아이디? 비밀번호?
				if(dbPwd.equals(adpwd)){
					result=MemberService.LOGIN_OK;
				}else{
					result=MemberService.PWD_DISAGREE;
				}
			}else {
				result=MemberService.ID_NONE;
			}

			System.out.println("로그인 처리결과, result="+result
					+", 매개변수 adid="+adid+", adpwd="+adpwd);
			return result;
		}finally{
			pool.dbClose(rs, ps, con);
		}		
	}	

	//브랜드 관리자 승인플래그 N->Y로 업데이트
	public int updateFlag(int brandno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();
			String sql="update brand"
					+ " set adflag='Y'"
					+ " where adflag='N' and brandno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, brandno);

			int cnt=ps.executeUpdate();

			System.out.println("Flag Update결과 cnt="+cnt+", 매개변수 brandNo="+brandno);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	//브랜드 관리자 플래그 N - Delete(요청삭제)
	public int deleteNflag(int brandno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();
			String sql="delete brand"
					+ " where brandno=? and adflag='N'";
			ps=con.prepareStatement(sql);

			ps.setInt(1, brandno);

			int cnt=ps.executeUpdate();

			System.out.println("요청 삭제 결과 cnt="+cnt+", 매개변수 brandno="+brandno);

			return cnt;
		}finally {

		}
	}
	//지안 시작
	//reserve 페이지에서 location1 옵션 클릭했을시 브랜드 리스트 뿌리기 위한 method 
	public List<BrandVO> selectByLoc1(String Location1Code) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BrandVO> list = new ArrayList<BrandVO>(); 

		try {

			con=pool.getConnection();

			String sql = "select distinct(brandname), b.brandno from Brand b join unit u " + 
					"on b.BRANDNO = u.BRANDNO " + 
					"and u.location1code = ? and b.adflag= 'Y' " + 
					"order by brandname";

			ps=con.prepareStatement(sql);

			ps.setString(1, Location1Code);

			rs = ps.executeQuery();
			while(rs.next()) {
				String brandName = rs.getString("brandname");
				int brandNo = rs.getInt("brandno");

				BrandVO vo = new BrandVO();
				vo.setBrandNo(brandNo);
				vo.setBrandName(brandName);

				list.add(vo);
			}
			System.out.println("지역코드로 조회시 브랜드 조회 결과 = "+list.size());
			return list;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//브랜드 번호로 브랜드 네임 조회하기
	public String selectBrandNameByBrandNo(int brandNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result = null;

		try {
			con=pool.getConnection();

			String sql = "select brandname from brand"
					+ "	where brandNo = ? ";

			ps=con.prepareStatement(sql);

			ps.setInt(1,brandNo);

			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}

			System.out.println("브랜드 번호로 브랜드 네임 조회 결과 result"+result+", 매개변수 ="+ brandNo);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}

	}	


}
