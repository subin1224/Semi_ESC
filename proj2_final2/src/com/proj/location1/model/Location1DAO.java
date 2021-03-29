//1227 지안 22 줄에 <지안 시작> 부터 복사해주시면 됩니다.

package com.proj.location1.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class Location1DAO {
	private ConnectionPoolMgr2 pool;
	
	public Location1DAO(){
		pool =new ConnectionPoolMgr2();
	}
	
	
	//지안 시작
	//지역 리스트 전체 조회 => 예약 지역 select에 뿌리기 위해 만듬
	public List<Location1VO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		List<Location1VO> list=  new ArrayList<Location1VO>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from location1 " + 
					"order by location1order";
			ps= con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String location1Code = rs.getString("location1code");
				String location1Name = rs.getString("location1name");
				int location1Order = rs.getInt("location1order");
				
				Location1VO vo = new Location1VO();
				vo.setLocation1Code(location1Code);
				vo.setLocation1Name(location1Name);
				vo.setLocation1Order(location1Order);
				
				list.add(vo);
			}
			System.out.println("Location1 전체 조회 결과 = "+ list.size());
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//수정
	public int insertLocation1(Location1VO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try{
			con=pool.getConnection();
			
			String sql="insert into location1(location1Code, location1Name, location1order)"
					+ " values(?, ?, LOCATION1_SEQ.NEXTVAL)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getLocation1Code());
			ps.setString(2, vo.getLocation1Name());
			
			int cnt=ps.executeUpdate();
			System.out.println("Location1 입력 결과, 매개변수 vo="+vo+", cnt="+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}//
	
	public int updateLocation1(Location1VO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try{
			con=pool.getConnection();
			
			String sql="update Location1"
					+ " set location1Name=?, location1Code=?"
					+ " where location1Order=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getLocation1Name());
			ps.setString(2, vo.getLocation1Code());
			ps.setInt(3, vo.getLocation1Order());
			
			int cnt=ps.executeUpdate();
			System.out.println("Location1 수정 결과, 매개변수 vo="+vo+", cnt="+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}//
	
	public int deleteLocation1(int location1Order) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try{
			con=pool.getConnection();
			
			String sql="delete from location1"
					+ " where location1Order = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, location1Order);
			
			int cnt=ps.executeUpdate();
			System.out.println("Location1 삭제 결과, 매개변수 location1Order="+location1Order+", cnt="+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
		
	}//
	
	public Location1VO selectByLocation1Code(String location1Code) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Location1VO vo=new Location1VO();
		
		try {
			con=pool.getConnection();
			
			String sql="select location1Code, location1Name, location1Order from Location1"
					+ " where location1Code like ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, location1Code);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String location1Name=rs.getString("location1Name");
				int location1Order=rs.getInt("location1Order");
				
				vo=new Location1VO(location1Code, location1Name, location1Order);
			}
			System.out.println("Location1 선택 조회 결과, 매개변수 location1Code="+location1Code+", vo="+vo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
	public List<Location1VO> selectByLocation1Name(String location1Name) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Location1VO> list=new ArrayList<Location1VO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select location1Code, location1Name, location1Order from Location1"
					+ " where location1Name like '%' || ? || '%'";
			ps=con.prepareStatement(sql);
			ps.setString(1, location1Name);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				String location1Code=rs.getString("location1Code");
				String db_location1Name=rs.getString("locatoin1Name");
				int location1Order=rs.getInt("location1Order");
				
				Location1VO loc1Vo=new Location1VO(location1Code, db_location1Name, location1Order);
				list.add(loc1Vo);
			}
			System.out.println("Location1 선택검색, list.size="+list.size()+", 매개변수 location1Name="+location1Name);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//
	
	public List<Location1VO> selectByAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Location1VO> list=new ArrayList<Location1VO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select location1Code, location1Name from Location1";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				String location1Code=rs.getString("location1Code");
				String location1Name=rs.getString("locatoin1Name");
				
				Location1VO loc1Vo=new Location1VO(location1Code, location1Name);
				list.add(loc1Vo);
			}
			System.out.println("Location1 전체 조회 결과, list.size="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}//
		
	
}
