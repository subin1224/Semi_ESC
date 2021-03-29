package com.proj.request.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.proj.db.ConnectionPoolMgr2;

public class RequestDAO {
	private ConnectionPoolMgr2 pool;
	
	public RequestDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	//가입 요청
	public int insertRequest(RequestVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into request(requestno, adid, adpwd, brandname, unitname, loc1, loc2, address, unittel)"
					+ " values(request_seq.nextval,?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getAdId());
			ps.setString(2, vo.getAdPwd());
			ps.setString(3, vo.getBrandName());
			ps.setString(4, vo.getUnitName());
			ps.setString(5, vo.getLoc1());
			ps.setString(6, vo.getLoc2());
			ps.setString(7, vo.getAddress());
			ps.setString(8, vo.getUnitTel());
			
			int cnt=ps.executeUpdate();
	
			System.out.println("요청 승인 등록 결과 cnt="+cnt+"매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	//가입 승인
	public int updateRequest(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update request set requestflag='Y' where requestno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
	
			System.out.println("요청 승인 결과 cnt="+cnt+"매개변수 no="+no);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}		
	}
	
	
	
}
