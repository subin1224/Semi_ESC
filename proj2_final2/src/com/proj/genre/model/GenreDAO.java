package com.proj.genre.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.brand.model.BrandVO;
import com.proj.db.ConnectionPoolMgr2;
import com.proj.location2.model.Location2VO;

public class GenreDAO {
	private ConnectionPoolMgr2 pool;

	public GenreDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertGenre(String genreName) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into genre (genreCode, genreName)"
					+ " values (genre_seq.nextval, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, genreName);
			
			int cnt=ps.executeUpdate();
			System.out.println("Genre insert cnt="+cnt+", genreName="+genreName);
			return cnt;
		} finally { 
			pool.dbClose(ps, con);
		}
	}
	
	public int updateGenre(GenreVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update genre"
					+ " set genreName=?"
					+ " where genreCode=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getGenreName());
			ps.setInt(2, vo.getGenreCode());
			
			int cnt=ps.executeUpdate();
			System.out.println("Genre update, cnt="+cnt+", param vo="+vo);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteGenre(int genreCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from genre"
					+ " where genreCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, genreCode);
			
			int cnt=ps.executeUpdate();
			System.out.println("Genre delete, cnt="+cnt+", param genreCode="+genreCode);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public GenreVO selectByGenreCode(int genreCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		GenreVO vo=new GenreVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select genreCode, genreName from genre"
					+ " where genreCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, genreCode);
			
			rs=ps.executeQuery();
			while (rs.next()) {
				vo.setGenreCode(genreCode);
				vo.setGenreName(rs.getString("genreName"));
			}
			
			System.out.println("GenreCode select, vo="+vo+",param genreCode="+genreCode);
			return vo;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<GenreVO> selectByGenreName(String genreName) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		GenreVO vo=new GenreVO();
		List<GenreVO> list=new ArrayList<GenreVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select genreCode, genreName from genre"
					+ " where genreName like '%' || ? || '%'";
			ps=con.prepareStatement(sql);
			ps.setString(1, genreName);
			
			rs=ps.executeQuery();
			while (rs.next()) {
				vo.setGenreCode(rs.getInt("genreCode"));
				vo.setGenreName(genreName);
				list.add(vo);
			}
			
			System.out.println("GenreName select result type list, list.size="+list.size()+", vo="+vo+", param genreName="+genreName);
			return list;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	
	public List<GenreVO> selectByAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<GenreVO> list=new ArrayList<GenreVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select genreCode, genreName from genre";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while (rs.next()) {
				int genreCode=rs.getInt("genreCode");
				String genreName=rs.getString("genreName");
				
				GenreVO vo=new GenreVO(genreCode, genreName);
				list.add(vo);
			}
			System.out.println("Genre all select, list.size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//

	
}
