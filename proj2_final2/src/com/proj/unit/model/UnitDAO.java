//1227 지안 21줄 부터 추가 부탁드립니다.
package com.proj.unit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class UnitDAO {
	private ConnectionPoolMgr2 pool;

	public UnitDAO(){
		pool =new ConnectionPoolMgr2();
	}
	
	//수빈
	//브랜드 관리자가 지점을 추가할때
	public int insertUnit(UnitVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into unit(unitno, unitname, brandno, unitaddress, unittel, location1code)"
					+ " values(unit_seq.nextval,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getUnitName());
			ps.setInt(2, vo.getBrandNo());
			ps.setString(3, vo.getUnitAddress());
			ps.setString(4, vo.getUnitTel());
			ps.setString(5, vo.getLocation1Code());
			
			int cnt=ps.executeUpdate();
			System.out.println("지점 추가 결과 cnt="+cnt+"매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}  
	
	//브랜드No 통해서 Unit 정보 리스트 출력 :1229
	public List<UnitVO> selectUnitByBrandNo(int brandNo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<UnitVO> list = new ArrayList<UnitVO>(); 
		
		try {
			con=pool.getConnection();
			String sql="select * from unit where brandno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, brandNo);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int unitNo=rs.getInt("unitno");
				String unitName=rs.getString("unitName");
				int r_brandNo=rs.getInt("brandno");
				String unitAddress=rs.getString("unitaddress");
				String unitTel=rs.getString("unittel");
				Double latitude=rs.getDouble("latitude");
				Double longitude=rs.getDouble("longitude");
				Timestamp unitRegdate=rs.getTimestamp("unitregdate");
				String location1Code=rs.getString("location1code");
				int location2Code=rs.getInt("location2code");
				String unitURL=rs.getString("uniturl");
				String unitImg=rs.getString("unitimg");
				
				UnitVO vo=new UnitVO(unitNo, unitName, r_brandNo, unitAddress, unitTel, latitude, longitude, unitRegdate, location1Code, location2Code, unitURL, unitImg);
				
				list.add(vo);
			}
			
			System.out.println("BrandNO에 따른 Unit전체 출력 결과 List.size()="+list.size()+", brandNo="+brandNo);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	//지안 시작
	//reserve 페이지에서 unit 리스트 뿌리기 위해서 지역 -> 브랜드 -> 유닛
	public List<UnitVO> selectUnitByBrandLocation1(int BrandNo, String Location1Code) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UnitVO> list = new ArrayList<UnitVO>(); 

		try {

			con=pool.getConnection();

			String sql = "select distinct(unitName), unitNo, brandno, location1code, location2code from unit " + 
					" where brandno = ? " + 
					" and location1code = ? " + 
					" order by unitname";

			ps=con.prepareStatement(sql);

			ps.setInt(1, BrandNo);
			ps.setString(2, Location1Code);

			rs=ps.executeQuery();
			while(rs.next()) {
				int unitno=rs.getInt("unitno");
				String unitname= rs.getString("unitname");
				int brandno= rs.getInt("brandNo");
				String location1code = rs.getString("location1code");
				int location2code = rs.getInt("location2code");

				UnitVO vo = new UnitVO();
				vo.setBrandNo(brandno);
				vo.setUnitNo(unitno);
				vo.setUnitName(unitname);
				vo.setLocation1Code(location1code);
				vo.setLocation2Code(location2code);

				list.add(vo);
			}
			System.out.println("브랜드no 와 지역1 코드로 조회한 유닛 리스트 일부 컬럼 결과="
					+list.size()+", 매개변수 brandno="+BrandNo+", location1code = "+Location1Code);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);

		}
	}


	
	public UnitVO selectByUnitNo(int unitNo) throws SQLException {
		 Connection con = null;
		   PreparedStatement ps = null;
		   ResultSet rs = null;
		   UnitVO vo = null;
		   try {

			   con=pool.getConnection();

			   String sql = "select unitNo, unitName, brandNo, unitAddress, unitTel, "
			   		+ " latitude, longitude, unitRegdate, location1Code, location2Code, unitUrl, unitImg from unit " + 
			   		" where unitno= ? ";
			   ps=con.prepareStatement(sql);

			   ps.setInt(1, unitNo);
			   rs = ps.executeQuery();

			   if(rs.next()) {
				   String unitName= rs.getString("unitName");
				   int brandNo = rs.getInt("brandNo");
				   String unitAddress = rs.getString("unitAddress");
				   String unitTel = rs.getString("unitTel");
				   double latitude = rs.getDouble("latitude");
				   double longitude = rs.getDouble("longitude");
				   Timestamp unitRegdate= rs.getTimestamp("unitregdate");
				   String location1Code = rs.getString("location1Code");
				   int location2Code = rs.getInt("location2code");
				   String unitUrl = rs.getString("unitUrl");
				   String unitImg = rs.getString("UnitImg");

				   vo = new UnitVO(unitNo, unitName, brandNo, unitAddress, unitTel, latitude, longitude, unitRegdate, location1Code, location2Code, unitUrl, unitImg);

			   }
			   System.out.println("유닛 번호로 유닛 조회 결과 vo="+vo +", 매개변수 unitNo="+unitNo);
			   return vo;
		   }finally {
			   pool.dbClose(rs, ps, con);

		   }
	}//
	


	//reserveTheme 에서 유닛 번호로 이름 찾기 위해서 
	public String selectUnitNameByUnitNo(int unitNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result = null;

		try {
			con=pool.getConnection();

			String sql = "select unitname from unit"
					+ "	where unitNo = ? ";

			ps=con.prepareStatement(sql);

			ps.setInt(1,unitNo);

			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}

			System.out.println("유닛 번호로 유닛 네임 조회 결과 result"+result+", 매개변수 ="+ unitNo);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
	//1228 수정 추가
	public List<UnitVO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<UnitVO> list = new ArrayList<UnitVO>(); 

		try {
			con=pool.getConnection();

			String sql = "select unitNo, unitName, brandno, unitAddress, unitTel, latitude, longitude," +
					" unitRegdate, location1code, location2code, unitUrl, unitImg from unit " + 
					" order by unitNo";

			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			
			while(rs.next()) {
				int unitNo=rs.getInt("unitno");
				String unitName= rs.getString("unitname");
				int brandNo= rs.getInt("brandNo");
				String unitAddress=rs.getString("unitAddress");
				String unitTel=rs.getString("unitTel");
				double latitude=rs.getDouble("latitude");
				double longitude=rs.getDouble("longitude");
				Timestamp unitRegdate=rs.getTimestamp("unitRegdate");
				String location1Code = rs.getString("location1code");
				int location2Code = rs.getInt("location2code");
				String unitUrl=rs.getString("unitUrl");
				String unitImg=rs.getString("unitImg");

				UnitVO vo = new UnitVO(unitNo, unitName, brandNo, unitAddress, unitTel, latitude, longitude, unitRegdate, location1Code, location2Code, unitUrl, unitImg);

				list.add(vo);
			}
			System.out.println("Unit 전체 검색 결과, list.size="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);

		}
	}//
	
	
	
}