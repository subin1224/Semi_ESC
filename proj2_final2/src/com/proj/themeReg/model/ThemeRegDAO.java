package com.proj.themeReg.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.proj.db.ConnectionPoolMgr2;

public class ThemeRegDAO {
	//테마등록
	private ConnectionPoolMgr2 pool;
	
	public ThemeRegDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	//Theme Insert - 3 insert
	public int insertTheme(ThemeRegVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			con=pool.getConnection();
			
			con.setAutoCommit(false);
			
			//[1] theme insert
			String sql="insert into theme(themeno, themename, themecontent, difficulty, "
					+ " playtime, playermin, playermax, brandno, genrecode, genrecode2,themeprice) "
					+ " values(theme_seq.nextval,?,?,?,?,?,?,?,?,?,?) ";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getThemeName());
			ps.setString(2, vo.getThemeContent());
			ps.setInt(3, vo.getDifficulty());
			ps.setInt(4, vo.getPlayTime());
			ps.setInt(5, vo.getPlayerMin());
			ps.setInt(6, vo.getPlayerMax());
			ps.setInt(7, vo.getBrandNo());
			ps.setInt(8, vo.getGenreCode());
			ps.setInt(9, vo.getGenreCode2());
			ps.setInt(10, vo.getThemePrice());
			
			cnt=ps.executeUpdate();
			
			System.out.println("1차 theme에 insert 결과 cnt="+cnt);
			
			//[2] themeImg insert
			sql="insert into themeimg(themeno, filename, originalfilename, filesize)"
					+ " values(theme_seq.currval, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getFileName());
			ps.setString(2, vo.getOriginalFileName());
			ps.setLong(3, vo.getFileSize());
			
			cnt=ps.executeUpdate();
			
			System.out.println("2차 thmemImg에 insert 결과 cnt="+cnt);
			
			//[3] room insert
			
			sql="insert into room(roomno, brandno, unitno, themeno)"
					+ " values(room_seq.nextval,?,?,theme_seq.currval)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, vo.getBrandNo());
			ps.setInt(2, vo.getUnitNo());
			
			cnt=ps.executeUpdate();
			
			System.out.println("3차 room에 insert 결과 cnt="+cnt);
			
			con.commit();
		}catch(SQLException e) {
			con.rollback();
			e.printStackTrace();
		}finally {
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}
		
		return cnt;
	}
}
