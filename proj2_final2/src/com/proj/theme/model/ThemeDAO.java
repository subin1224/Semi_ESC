package com.proj.theme.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;
import com.proj.location2.model.Location2VO;
import com.proj.themeImg.model.ThemeImgVO;

public class ThemeDAO {
	private ConnectionPoolMgr2 pool;

	public ThemeDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public int insertTheme(ThemeVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="insert into theme(themeNo, themeName, themeContent, difficulty, playTime,"
					+ " playerMin, playerMax, brandNo, genreCode, genreCode2, themePrice)"
					+ " values(theme_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

			int cnt=ps.executeUpdate();
			System.out.println("추가 결과, cnt="+cnt+", 매개변수 =");
			return cnt;
		} finally { 
			pool.dbClose(ps, con);
		}
	}

	public int updateTheme(ThemeVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update theme"
					+ " set themeName=?, themeContent=?, genreCode=?, genreCode2=?,"
					+ " difficulty=?, playtime=?, playerMin=?, playerMax=?, brandNo=?, themePrice=?"
					+ " where themeNo=?";
			ps=con.prepareStatement(sql);

			ps.setString(1, vo.getThemeName());
			ps.setString(2, vo.getThemeContent());
			ps.setInt(3, vo.getGenreCode());
			ps.setInt(4, vo.getGenreCode2());
			ps.setInt(5, vo.getDifficulty());
			ps.setInt(6, vo.getPlayTime());
			ps.setInt(7, vo.getPlayerMin());
			ps.setInt(8, vo.getPlayerMax());
			ps.setInt(9, vo.getBrandNo());
			ps.setInt(10, vo.getThemePrice());
			ps.setInt(11, vo.getThemeNo());

			int cnt=ps.executeUpdate();
			System.out.println("Theme 수정 결과, cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}//

	public int deleteTheme(int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql=" delete from theme"
					+ " where themeNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, themeNo);

			int cnt=ps.executeUpdate();
			System.out.println("Theme 삭제 결과, cnt="+cnt+", 매개변수 themeNo="+themeNo);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	public ThemeVO selectByThemeNo(int themeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ThemeVO vo=new ThemeVO();

		try {
			con=pool.getConnection();

			String sql="select a.themeNo, a.themeName, a.themeContent, a.difficulty, a.playTime, "
					+ "    a.playerMin, a.playerMax, a.brandNo, a.genreCode, a.genreCode2, a.themePrice, b.ORIGINALFILENAME "
					+ " from Theme a join themeImg b on a.themeno = b.themeno "
					+ " join room r on a.themeno = r.themeno "
					+ " where a.themeNo=? "
					+ " order by r.roomno ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, themeNo);

			rs=ps.executeQuery();
			while (rs.next()) {
				String themeName=rs.getString("themeName");
				String themeContent=rs.getString("themeContent");
				int difficulty=rs.getInt("difficulty");
				int playTime=rs.getInt("playTime");
				int playerMin=rs.getInt("playerMin");
				int playerMax=rs.getInt("playerMax");
				int brandNo=rs.getInt("brandNo");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int themePrice=rs.getInt("themePrice");
				String originalFileName=rs.getString("ORIGINALFILENAME");
				
				vo=new ThemeVO(themeNo, themeName, themeContent, difficulty, playTime, playerMin, playerMax, brandNo, genreCode, genreCode2, themePrice,originalFileName);
			}
			System.out.println("ThemeNO로 선택검색, 결과 vo="+vo+", 매개변수 themeNo="+themeNo);
			return vo;
		} finally {
			pool.dbClose(ps, con);
		}
	}

	public List<ThemeVO> selectByThemeName(String themeName) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ThemeVO> list=new ArrayList<ThemeVO>();
		ThemeVO vo=new ThemeVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select themeNo, themeName, themeContent, difficulty, playTime,"
					+ " playerMin, playerMax, brandNo, genreCode, genreCode2, themePrice from theme";
			
			if (themeName!=null && !themeName.isEmpty()) {
				sql+=" where themeName like '%' || ? || '%'";
			}
			
			ps=con.prepareStatement(sql);
			
			if (themeName!=null && !themeName.isEmpty()) {
				ps.setString(1, themeName);
			}

			
			rs=ps.executeQuery();
			while (rs.next()) {
				int themeNo=rs.getInt("themeNo");
				String themeContent=rs.getString("themeContent");
				int difficulty=rs.getInt("difficulty");
				int playTime=rs.getInt("playTime");
				int playerMin=rs.getInt("playerMin");
				int playerMax=rs.getInt("playerMax");
				int brandNo=rs.getInt("brandNo");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int themePrice=rs.getInt("themePrice");
				themeName=rs.getString("themeName");

				vo=new ThemeVO(themeNo, themeName, themeContent, genreCode, genreCode2, difficulty, playTime, playerMin, playerMax, brandNo, themePrice);
				list.add(vo);
			}
			System.out.println("ThemeName�� ���ð˻�,  list.size="+list.size()+", �Ű����� themeName="+themeName);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//

	/*public String selectUrl(int themeNo) {

	}*/

	public List<ThemeVO> selectByGenreCode(int genreCode) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ThemeVO> list=new ArrayList<ThemeVO>();

		try {
			con=pool.getConnection();

			String sql="select themeNo, themeName, themeContent, difficulty, playTime,"
					+ " playerMin, playerMax, brandNo, genreCode, genreCode2, themePrice from Theme"
					+ " where genreCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, genreCode);

			rs=ps.executeQuery();
			while (rs.next()) {
				int themeNo=rs.getInt("themeNo");
				String themeName=rs.getString("themeName");
				String themeContent=rs.getString("themeContent");
				int difficulty=rs.getInt("difficulty");
				int playTime=rs.getInt("playTime");
				int playerMin=rs.getInt("playerMin");
				int playerMax=rs.getInt("playerMax");
				int brandNo=rs.getInt("brandNo");
				int genreCode2=rs.getInt("genreCode2");
				int themePrice=rs.getInt("themePrice");

				ThemeVO vo=new ThemeVO(themeNo, themeName, themeContent, genreCode, genreCode2, difficulty, playTime, playerMin, playerMax, brandNo, themePrice);
				list.add(vo);
			}
			System.out.println("ThemeGenreCode 선택 조회 결과, list.size="+list.size()+", 매개변수 genreCode="+genreCode);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<ThemeVO> selectByAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ThemeVO> list=new ArrayList<ThemeVO>();

		try {
			con=pool.getConnection();

			String sql="select themeNo, themeName, themeContent, difficulty, playTime,"
					+ " playerMin, playerMax, brandNo, genreCode, genreCode2, themePrice from Theme";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			while (rs.next()) {
				int themeNo=rs.getInt("themeNo");
				String themeName=rs.getString("themeName");
				String themeContent=rs.getString("themeContent");
				int difficulty=rs.getInt("difficulty");
				int playTime=rs.getInt("playTime");
				int playerMin=rs.getInt("playerMin");
				int playerMax=rs.getInt("playerMax");
				int brandNo=rs.getInt("brandNo");
				int genreCode=rs.getInt("genreCode");
				int genreCode2=rs.getInt("genreCode2");
				int themePrice=rs.getInt("themePrice");

				ThemeVO vo=new ThemeVO(themeNo, themeName, themeContent, genreCode, genreCode2, difficulty, playTime, playerMin, playerMax, brandNo, themePrice);
				list.add(vo);
			}
			System.out.println("Theme 전체 조회 결과, list.size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//

	//1228 수정 추가 : count 20 이상인 장르만 출력
	public List<ThemeVO> selectPopularGenre(int no) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<ThemeVO> list=new ArrayList<ThemeVO>();
		
		try {
			con=pool.getConnection();
			String sql="select distinct ta.genreCode from theme ta" + 
					" where (select count(*) from theme tb where tb.genreCode=ta.genreCode) >=?" + 
					" order by genreCode desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			while (rs.next()) {

				int genreCode=rs.getInt("genreCode");

				
				ThemeVO vo=new ThemeVO();
				vo.setGenreCode(genreCode);
				list.add(vo);
			}
			System.out.println("Theme 전체 조회 결과, list.size="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}//



	//지안 시작

	public List<ThemeVO> selectThemeByBrandUnit(int BrandNo, int UnitNo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ThemeVO> list = new ArrayList<ThemeVO>(); 

		try {

			con=pool.getConnection();

			String sql = "select * from theme " + 
					" where themeno in (select themeno from room " + 
					" where unitno = ?  and brandno = ? ) " + 
					" order by themename";

			ps=con.prepareStatement(sql);

			ps.setInt(1, UnitNo);
			ps.setInt(2, BrandNo);
			rs=ps.executeQuery();
			while(rs.next()) {
				int themeNo = rs.getInt("themeno");
				String themeName = rs.getString("themename");
				String themeContent= rs.getString("themecontent");
				int difficulty= rs.getInt("difficulty");
				int playTime= rs.getInt("playtime");
				int playerMin = rs.getInt("playermin");
				int playerMax = rs.getInt("playermax");
				int brandNo= rs.getInt("brandno");
				int genreCode = rs.getInt("genrecode");
				int genreCode2  = rs.getInt("genrecode2");
				int themePrice = rs.getInt("themeprice");

				ThemeVO vo = new ThemeVO(themeNo, themeName, themeContent, difficulty, playTime, playerMin, playerMax, brandNo, genreCode, genreCode2, themePrice);
				list.add(vo);
			}

			System.out.println("브랜드 넘버, 유닛넘버로 테마 전체 리스트 조회 결과="+list.size()+"매개변수 unitno="+UnitNo+",brandno="+BrandNo);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}


	//테마 번호로 테마 이름 구하기
	public String selectThemeNameByThemeNo(int themeNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String result = null;

		try {
			con=pool.getConnection();

			String sql = "select themename from theme"
					+ "	where themeNo = ? ";

			ps=con.prepareStatement(sql);

			ps.setInt(1,themeNo);

			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}

			System.out.println("브랜드 번호로 브랜드 네임 조회 결과 result"+result+", 매개변수 ="+ themeNo);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
}