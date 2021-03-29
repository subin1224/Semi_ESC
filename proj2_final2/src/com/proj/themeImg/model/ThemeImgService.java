package com.proj.themeImg.model;

import java.sql.SQLException;
import java.util.List;

public class ThemeImgService {
	private ThemeImgDAO themeImgDao;
	
	public ThemeImgService() {
		themeImgDao=new ThemeImgDAO();
	}
	
	public int insertThemeImg(ThemeImgVO vo) throws SQLException {
		return themeImgDao.insertThemeImg(vo);
	}
	
	public int updateThemeImg(ThemeImgVO vo) throws SQLException {
		return themeImgDao.updateThemeImg(vo);
	}
	
	public int deleteThemeImg(int themeNo) throws SQLException {
		return themeImgDao.deleteThemeImg(themeNo);
	}
	
	public ThemeImgVO selectByThemeNo(int themeNo) throws SQLException {
		return themeImgDao.selectByThemeNo(themeNo);
	}
	
	//1228 추가
	public String selectImgSrcByThemeNo(int themeNo) throws SQLException {
		return themeImgDao.selectImgSrcByThemeNo(themeNo);
	}

	public String selectImgByThemeNo(int themeNo) throws SQLException {
		return themeImgDao.selectImgByThemeNo(themeNo);
	}
	
	public List<ThemeImgVO> selectByAll() throws SQLException{
		return themeImgDao.selectByAll();
	}

}
