//1227 지안 45번째 줄 부터 추가해주시면 됩니다.
package com.proj.theme.model;

import java.sql.SQLException;
import java.util.List;


public class ThemeService {
	private ThemeDAO themeDao;
	
	public ThemeService() {
		themeDao=new ThemeDAO();
	}
	
	public int insertTheme(ThemeVO vo) throws SQLException {
		return themeDao.insertTheme(vo);
	}
	
	public int updateTheme(ThemeVO vo) throws SQLException {
		return themeDao.updateTheme(vo);
	}

	public int deleteTheme(int themeNo) throws SQLException {
		return themeDao.deleteTheme(themeNo);
	}
	
	public ThemeVO selectByThemeNo(int themeNo) throws SQLException {
		return themeDao.selectByThemeNo(themeNo);
	}
	
	public List<ThemeVO> selectByThemeName(String themeName) throws SQLException {
		return themeDao.selectByThemeName(themeName);
	}
	
	public List<ThemeVO> selectByGenreCode(int genreCode) throws SQLException {
		return themeDao.selectByGenreCode(genreCode);
	}

	public List<ThemeVO> selectByAll() throws SQLException{
		return themeDao.selectByAll();
	}
	
	//1228 수정 추가
	public List<ThemeVO> selectPopularGenre(int no) throws SQLException{
		return themeDao.selectPopularGenre(no);
	}


	//지안시작
	public List<ThemeVO> selectThemeByBrandUnit(int BrandNo, int UnitNo) throws SQLException{
		return themeDao.selectThemeByBrandUnit(BrandNo, UnitNo);
	}
	
	public String selectThemeNameByThemeNo(int themeNo) throws SQLException {
		return themeDao.selectThemeNameByThemeNo(themeNo);
	}
}
