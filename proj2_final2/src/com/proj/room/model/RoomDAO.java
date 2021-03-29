package com.proj.room.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class RoomDAO {
	private ConnectionPoolMgr2 pool;

	public RoomDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public int insertRoom(RoomVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();

			String sql="insert into room(roomNo, brandNo, unitNo, themeNo, roomRate)"
					+ " values(room_seq.nextval, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);

			ps.setInt(1, vo.getBrandNo());
			ps.setInt(2, vo.getUnitNo());
			ps.setInt(3, vo.getThemeNo());
			ps.setInt(4, vo.getRoomRate());


			int cnt=ps.executeUpdate();
			System.out.println("room 추가 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		} finally { 
			pool.dbClose(ps, con);
		}
	}//
	
	
	public int deleteRoom(int roomNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();

			String sql="delete from room"
					+ " where roomNo=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, roomNo);

			int cnt=ps.executeUpdate();
			System.out.println("room 삭제 결과, cnt="+cnt+", 매개변수 roomNo="+roomNo);
			return cnt;
		} finally { 
			pool.dbClose(ps, con);
		}
	}//
	
	public RoomVO selectByRoomNo(int roomNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		RoomVO vo=null;
		
		try {
			con=pool.getConnection();

			String sql="select roomNo, brandNo, unitNo, themeNo, roomRate"
					+ " from room where roomNo=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, roomNo);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				int brandNo=rs.getInt("brandNo");
				int unitNo=rs.getInt("unitNo");
				int themeNo=rs.getInt("themeNo");
				int roomRate=rs.getInt("roomRate");
				
				vo=new RoomVO(roomNo, brandNo, unitNo, themeNo, roomRate);
			}
			System.out.println("room 추가 결과, vo="+vo+", 매개변수 roomNo="+roomNo);
			return vo; 
			
		} finally { 
			pool.dbClose(rs, ps, con);
		}
	}//

	public int selectRoomNoBy(int brandNo, int unitNo, int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int roomNo=0;
		try {
			con=pool.getConnection();

			String sql="select roomNo from room"
					+ " where brandNo=? and unitNo=? and themeNo=?";
			ps=con.prepareStatement(sql);

			ps.setInt(1, brandNo);
			ps.setInt(2, unitNo);
			ps.setInt(3, themeNo);

			rs=ps.executeQuery();
			if(rs.next()) {
				roomNo=rs.getInt("roomNo");
			}
			
			System.out.println("room 선택 조회 결과, roomNo="+roomNo+", 매개변수 brandNo="+brandNo+", unitNo="+unitNo+", themeNo="+themeNo);
			return roomNo;
		} finally { 
			pool.dbClose(rs, ps, con);
		}
	}//
	
	public List<RoomVO> selectByAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RoomVO> list=new ArrayList<RoomVO>();
		
		try {
			con=pool.getConnection();

			String sql="select roomNo, brandNo, unitNo, themeNo, roomRate from room";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			
			while(rs.next()) {
				int roomNo=rs.getInt("roomNo");
				int brandNo=rs.getInt("brandNo");
				int unitNo=rs.getInt("unitNo");
				int themeNo=rs.getInt("themeNo");
				int roomRate=rs.getInt("roomRate");
				
				RoomVO vo=new RoomVO(roomNo, brandNo, unitNo, themeNo, roomRate);
				list.add(vo);
			}
			System.out.println("room 추가 결과, list.size="+list.size());
			return list; 
			
		} finally { 
			pool.dbClose(rs, ps, con);
		}
	}//
	
	
	
	//1229 추가(1)
	public List<RoomTotalVO> selectByAll2() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RoomTotalVO> list=new ArrayList<RoomTotalVO>();
		
		try {
			con=pool.getConnection();

			String sql="select r.roomNo, r.brandNo, b.brandName, r.unitNo, u.unitName, u.location1Code, r.themeNo, t.themeName, t.genreCode, t.genreCode2, t.difficulty, ti.themeSrc " + 
					" from room r join theme t " + 
					" on r.themeNo=t.themeNo " + 
					" join brand b " + 
					" on r.brandNo=b.brandNo " + 
					" join unit u " + 
					" on r.unitNo=u.unitNo " + 
					" join themeImg ti " + 
					" on r.themeNo=ti.themeNo " +
					" order by r.roomNo";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			
			while(rs.next()) {
				int roomNo=rs.getInt("roomNo");
				int brandNo=rs.getInt("brandNo");
				String brandName=rs.getString("brandName");
				int unitNo=rs.getInt("unitNo");
				String unitName=rs.getString("unitName");
				String location1Code=rs.getString("location1Code");
				int themeNo=rs.getInt("themeNo");
				String themeName=rs.getString("themeName");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int difficulty=rs.getInt("difficulty");
				String themeSrc=rs.getString("themeSrc");
				
				RoomTotalVO vo=new RoomTotalVO(roomNo, brandNo, brandName, unitNo, unitName, location1Code, themeNo, themeName, difficulty, themeSrc, genreCode, genreCode2);
				list.add(vo);
			}
			System.out.println("roomTotal 전체 검색 결과, list.size="+list.size());
			return list; 
			
		} finally { 
			pool.dbClose(rs, ps, con);
		}
		
	}//
	
	//1229 추가(2)
	public List<RoomTotalVO> selectByThemeName(String themeName) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RoomTotalVO> list=new ArrayList<RoomTotalVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select r.roomNo, r.brandNo, b.brandName, r.unitNo, u.unitName, u.location1Code, r.themeNo, t.themeName,t.themeContent ,t.genreCode, t.genreCode2, t.difficulty, ti.themeSrc, ti.originalfilename\r\n" + 
					"from room r join theme t\r\n" + 
					"on r.themeNo=t.themeNo\r\n" + 
					"join brand b\r\n" + 
					"on r.brandNo=b.brandNo\r\n" + 
					"join unit u\r\n" + 
					"on r.unitNo=u.unitNo\r\n" + 
					"join themeImg ti\r\n" + 
					"on r.themeNo=ti.themeNo\r\n" ; 
			
			if (themeName!=null && !themeName.isEmpty()) {
				sql+=" where themeName like '%' || ? || '%'\r\n";
			}
			
			sql+="order by r.roomNo";

			ps=con.prepareStatement(sql);
			
			if (themeName!=null && !themeName.isEmpty()) {
				ps.setString(1, themeName);
			}		
								
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int roomNo=rs.getInt("roomNo");
				int brandNo=rs.getInt("brandNo");
				String brandName=rs.getString("brandName");
				int unitNo=rs.getInt("unitNo");
				String unitName=rs.getString("unitName");
				String location1Code=rs.getString("location1Code");
				int themeNo=rs.getInt("themeNo");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int difficulty=rs.getInt("difficulty");
				String themeSrc=rs.getString("themeSrc");
				String originalFileName=rs.getString("originalfilename");
				String themeContent = rs.getString("themeContent");
				
				RoomTotalVO vo=new RoomTotalVO(roomNo, brandNo, brandName, unitNo, unitName, location1Code, themeNo, themeName,themeContent ,difficulty, themeSrc, genreCode, genreCode2,originalFileName);
				list.add(vo);
			}
			System.out.println("roomTotal 선택 검색 by themeName 결과, list.size="+list.size()+", 매개변수 themeName="+themeName);
			return list; 
			
		} finally { 
			pool.dbClose(rs, ps, con);
		}
		
		
	}//
	
	
	//1229 추가(3)
	public RoomTotalVO selectByRoomNo2(int roomNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		RoomTotalVO vo=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select r.roomNo, r.brandNo, b.brandName, r.unitNo, u.unitName, u.location1Code, r.themeNo, t.themeName, t.genreCode, t.genreCode2, t.difficulty, ti.themeSrc\r\n" + 
					"from room r join theme t\r\n" + 
					"on r.themeNo=t.themeNo\r\n" + 
					"join brand b\r\n" + 
					"on r.brandNo=b.brandNo\r\n" + 
					"join unit u\r\n" + 
					"on r.unitNo=u.unitNo\r\n" + 
					"join themeImg ti\r\n" + 
					"on r.themeNo=ti.themeNo\r\n" + 
					"where roomNo = ?\r\n" +
					"order by r.roomNo";
			ps=con.prepareStatement(sql);
			ps.setInt(1, roomNo);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int brandNo=rs.getInt("brandNo");
				String brandName=rs.getString("brandName");
				int unitNo=rs.getInt("unitNo");
				String unitName=rs.getString("unitName");
				String location1Code=rs.getString("location1Code");
				int themeNo=rs.getInt("themeNo");
				String themeName=rs.getString("themeName");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int difficulty=rs.getInt("difficulty");
				String themeSrc=rs.getString("themeSrc");
				
				vo=new RoomTotalVO(roomNo, brandNo, brandName, unitNo, unitName, location1Code, themeNo, themeName, difficulty, themeSrc, genreCode, genreCode2);
			}
			System.out.println("roomTotal 선택 검색 결과, vo="+vo+", 매개변수 roomNo="+roomNo);
			return vo; 
			
		} finally { 
			pool.dbClose(rs, ps, con);
		}
	}//
	
	
	//1229 추가(4)
	public List<RoomTotalVO> selectByCondition(String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<RoomTotalVO> list=new ArrayList<RoomTotalVO>();
		
		try {
			con=pool.getConnection();

			String sql="select r.roomNo, r.brandNo, b.brandName, r.unitNo, u.unitName, u.location1Code, r.themeNo, t.themeName,t.themeContent ,t.genreCode, t.genreCode2, t.difficulty, ti.themeSrc, ti.originalfilename" + 
					" from room r join theme t\r\n" + 
					" on r.themeNo=t.themeNo\r\n" + 
					" join brand b\r\n" + 
					" on r.brandNo=b.brandNo\r\n" + 
					" join unit u\r\n" + 
					" on r.unitNo=u.unitNo\r\n" + 
					" join themeImg ti\r\n" + 
					" on r.themeNo=ti.themeNo\r\n";
			
			if (condition!=null && !condition.isEmpty()) {
				switch(condition) {
					case "location1":
						condition="u.location1Code";
						break;
					case "brand" :
						break;
					case "genre" :
						break;
					case "difficulty" :
						break;
				}
			}
			
			if (keyword!=null && !keyword.isEmpty()) {
				sql+="where "+condition+" like "+"'%' || ? || +'%'";
			}
			
			sql+="order by r.roomNo";
			
			ps=con.prepareStatement(sql);

			if (keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int roomNo=rs.getInt("roomNo");
				int brandNo=rs.getInt("brandNo");
				String brandName=rs.getString("brandName");
				int unitNo=rs.getInt("unitNo");
				String unitName=rs.getString("unitName");
				String location1Code=rs.getString("location1Code");
				int themeNo=rs.getInt("themeNo");
				String themeName=rs.getString("themeName");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int difficulty=rs.getInt("difficulty");
				String themeSrc=rs.getString("themeSrc");
				String originalFileName=rs.getString("originalfilename");
				String themeContent=rs.getString("themeContent");
				
				RoomTotalVO vo=new RoomTotalVO(roomNo, brandNo, brandName, unitNo, unitName, location1Code, themeNo, themeName,themeContent ,difficulty, themeSrc, genreCode, genreCode2, originalFileName);
				list.add(vo);
			}
			System.out.println("roomTotal 전체 검색 결과, list.size="+list.size());
			return list; 
			
		} finally { 
			pool.dbClose(rs, ps, con);
		}
		
	}//
	
	//1229 추가(5)
		public List<RoomTotalVO> selectByCondition(String condition, List<String> keyword) throws SQLException{
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			List<RoomTotalVO> list=new ArrayList<RoomTotalVO>();
			
			try {
				con=pool.getConnection();

				String sql="select r.roomNo, r.brandNo, b.brandName, r.unitNo, u.unitName, u.location1Code, r.themeNo, t.themeName, t.genreCode, t.genreCode2, t.difficulty, ti.themeSrc\r\n" + 
						"from room r join theme t\r\n" + 
						"on r.themeNo=t.themeNo\r\n" + 
						"join brand b\r\n" + 
						"on r.brandNo=b.brandNo\r\n" + 
						"join unit u\r\n" + 
						"on r.unitNo=u.unitNo\r\n" + 
						"join themeImg ti\r\n" + 
						"on r.themeNo=ti.themeNo\r\n";
				
				
				if (condition!=null && !condition.isEmpty()) {
					switch(condition) {
					case "location1":
						condition="u.location1Code";
						break;
					case "brand" :
						condition="r.brandNo";
						break;
					case "genre" :
						condition="t.genreCode";
						break;
					case "difficulty" :
						condition="t.difficulty";
						break;
					}
				}
				
				if (keyword!=null && !keyword.isEmpty()) {
					sql+="where "+condition+" like "+"'%' || ? || '%'\r\n";
				}
				
				//sql+="order by r.roomNo";
				
				//ps=con.prepareStatement(sql);

				if (keyword!=null && !keyword.isEmpty()) {
						if (keyword.size()==1) {
							sql+="order by r.roomNo";
							ps=con.prepareStatement(sql);
							
							ps.setString(1, keyword.get(0));
							
						}else {
							for(int i=0; i<keyword.size()-1; i++) {
								sql+=" or "+condition+" like "+"'%' || ? || '%'\r\n";
							}//sql문 추가
							
							for(int i=0; i<keyword.size(); i++) {
								ps.setString(i+1, keyword.get(i));
							}//setString
							
							sql+=" order by r.roomNo";
						}
				}//keyword list에 값 있을 때 
				
				rs=ps.executeQuery();
				
				while(rs.next()) {
					int roomNo=rs.getInt("roomNo");
					int brandNo=rs.getInt("brandNo");
					String brandName=rs.getString("brandName");
					int unitNo=rs.getInt("unitNo");
					String unitName=rs.getString("unitName");
					String location1Code=rs.getString("location1Code");
					int themeNo=rs.getInt("themeNo");
					String themeName=rs.getString("themeName");
					int genreCode=rs.getInt("genreCode");
					int genreCode2=rs.getInt("genreCode2");
					int difficulty=rs.getInt("difficulty");
					String themeSrc=rs.getString("themeSrc");
					
					RoomTotalVO vo=new RoomTotalVO(roomNo, brandNo, brandName, unitNo, unitName, location1Code, themeNo, themeName, difficulty, themeSrc, genreCode, genreCode2);
					list.add(vo);
				}
				System.out.println("roomTotal 전체 검색 결과, list.size="+list.size());
				return list; 
				
			} finally { 
				pool.dbClose(rs, ps, con);
			}
			
		}//
		public List<RoomTotalVO> selectByBrandNo(int BrandNo) throws SQLException{
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			List<RoomTotalVO> list=new ArrayList<RoomTotalVO>();
			
			try {
				con=pool.getConnection();
				
				String sql="select r.roomNo, r.brandNo, b.brandName, r.unitNo, u.unitName, u.location1Code, r.themeNo, t.themeName, t.themecontent, t.genreCode, t.genreCode2, t.difficulty, ti.themeSrc, ti.originalfilename\r\n" + 
						" from room r join theme t " + 
						" on r.themeNo=t.themeNo " + 
						" join brand b " + 
						" on r.brandNo=b.brandNo " + 
						" join unit u " + 
						" on r.unitNo=u.unitNo " + 
						" join themeImg ti " + 
						" on r.themeNo=ti.themeNo " ; 
				
				if (BrandNo!=0) {
					sql+=" where b.BrandNo = ?";
				}
				
				sql+="order by r.roomNo";

				ps=con.prepareStatement(sql);
				
				if (BrandNo!=0) {
					ps.setInt(1, BrandNo);
				}		
									
				rs=ps.executeQuery();
				
				while(rs.next()) {
					int roomNo=rs.getInt("roomNo");
					int brandNo=rs.getInt("brandNo");
					String brandName=rs.getString("brandName");
					String themeName=rs.getString("themeName");
					int unitNo=rs.getInt("unitNo");
					String unitName=rs.getString("unitName");
					String location1Code=rs.getString("location1Code");
					int themeNo=rs.getInt("themeNo");
					int genreCode=rs.getInt("genreCode");
					int genreCode2=rs.getInt("genreCode2");
					int difficulty=rs.getInt("difficulty");
					String themeSrc=rs.getString("themeSrc");
					String originalFileName=rs.getString("originalfilename");
					String themeContent = rs.getString("themecontent");
					
					RoomTotalVO vo=new RoomTotalVO(roomNo, brandNo, brandName, unitNo, unitName, location1Code, themeNo, themeName,themeContent, difficulty, themeSrc, genreCode, genreCode2,originalFileName);
					list.add(vo);
				}
				System.out.println("roomTotal 선택 검색 by themeName 결과, list.size="+list.size()+", 매개변수 BrandNo="+BrandNo);
				return list; 
				
			} finally { 
				pool.dbClose(rs, ps, con);
			}
			
			
		}//	
}
