package com.proj.location2.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class Location2DAO {
	private ConnectionPoolMgr2 pool;

	public Location2DAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	//해당 Location1Code에 맞는 Location2Code 리스트 출력
	public List<Location2VO> selectByLocation1Code(String location1Code) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<Location2VO> list= new ArrayList<Location2VO>();
		try {
			con=pool.getConnection();
			String sql="select * from location2 where location1code=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, location1Code);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int location2Code = rs.getInt("location2code");
				String location2Name = rs.getString("location2name");
				String r_location1Code = rs.getString("location1Code");
				
				Location2VO vo = new Location2VO();
				vo.setLocation1Code(r_location1Code);
				vo.setLocation2Code(location2Code);
				vo.setLocation2Name(location2Name);
				
				list.add(vo);
			}
			System.out.println("Loc2전체조회 list.size()="+list.size()+", 매개변수 loc1="+location1Code);
			
			return list;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
}
