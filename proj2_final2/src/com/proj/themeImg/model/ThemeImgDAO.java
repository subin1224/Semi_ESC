package com.proj.themeImg.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class ThemeImgDAO {
	private ConnectionPoolMgr2 pool;

	public ThemeImgDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertThemeImg(ThemeImgVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into themeImg(themeNo, themeUrl, themeImgSrc, fileName, originalFileName, fileSize)"
					+ " values(themeImg_seq.nextval, ?, ?, ?, ? ,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getThemeUrl());
			ps.setString(2, vo.getThemeSrc());
			ps.setString(3, vo.getFileName());
			ps.setString(4, vo.getOriginalFileName());
			ps.setInt(5, vo.getFileSize());
			int cnt=ps.executeUpdate();
			System.out.println("ThemeImg insertThemeImg, cnt="+cnt+", param vo="+vo);
			return cnt;
		} finally { 
			pool.dbClose(ps, con);
		}
	}
	
	//
	public int updateThemeImg(ThemeImgVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update themeImg"
					+ " fileName=?, originalFileName=?, fileSize=?"
					+ " where themeNo=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getFileName());
			ps.setString(2, vo.getOriginalFileName());
			ps.setInt(3, vo.getFileSize());
			ps.setInt(4, vo.getThemeNo());
			
			int cnt=ps.executeUpdate();
			System.out.println("ThemeImg update, cnt="+cnt+", param vo="+vo);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteThemeImg(int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from themeImg"
					+ " where themeNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, themeNo);
			
			int cnt=ps.executeUpdate();
			System.out.println("ThemeImg deleteThemeImg, cnt="+cnt+", param themeNo="+themeNo);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public ThemeImgVO selectByThemeNo(int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ThemeImgVO vo=new ThemeImgVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select themeNo, themeUrl, themeSrc, "
					+ " fileName, fileSize, originalFileName from themeImg"
					+ " where themeNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, themeNo);
			
			rs=ps.executeQuery();
			if (rs.next()) {
				vo.setThemeNo(themeNo);
				vo.setThemeSrc(rs.getString("themeSrc"));
				vo.setFileName(rs.getString("fileName"));
				vo.setOriginalFileName(rs.getString("originalFileName"));
				vo.setThemeUrl(rs.getString("themeUrl"));
				vo.setFileSize(rs.getInt("fileSize"));
			}
			
			System.out.println("ThemeImg selectbyThemeNo, vo="+vo+", param themeNo="+themeNo);
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//1228추가
	public String selectImgSrcByThemeNo(int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			con=pool.getConnection();
			
			String sql="select themeSrc from themeImg"
					+ " where themeNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, themeNo);
			
			rs=ps.executeQuery();
			String themeSrc="";
			if (rs.next()) {
				if (rs.getString("themesrc")!=null) {
					themeSrc=rs.getString("themesrc");					
				} else {
					themeSrc="../images/jianPick.png";					
				}
			}//outer if
			
			System.out.println("ThemeImg 조건검색 결과 themeSrc="+themeSrc+", 매개변수 themeNo="+themeNo);
			return themeSrc;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//1230추가 - originalfilename 추출
	public String selectImgByThemeNo(int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String originalfilename="";
		try {
			con=pool.getConnection();
			
			String sql="select originalfilename from themeImg"
					+ " where themeNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, themeNo);
			
			rs=ps.executeQuery();
			
			if (rs.next()) {
				originalfilename=rs.getString("originalfilename");
			}//outer if
			
			System.out.println("ThemeImg 조건검색 결과 no="+themeNo +", originalfilename="+originalfilename);
			return originalfilename;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	public List<ThemeImgVO> selectByAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ThemeImgVO> list=new ArrayList<ThemeImgVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select themeNo, themeUrl, themesrc, fileName, "
					+ " originalFileName, fileSize from themeImg";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while (rs.next()) {
				int themeNo=rs.getInt("themeNo");
				String themeUrl=rs.getString("themeUrl");
				String themeImgSrc=rs.getString("themeSrc");
				String fileName=rs.getString("fileName");
				String originalFileName=rs.getString("originalFileName");
				int fileSize=rs.getInt("fileSize");
				ThemeImgVO vo=new ThemeImgVO(themeNo, themeUrl, themeImgSrc, fileName, originalFileName, fileSize);
				list.add(vo);
			}
			System.out.println("ThemeImg selectByAll, list.size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//

	
}
