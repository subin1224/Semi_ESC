package com.proj.themeReg.model;

import java.sql.SQLException;

public class ThemeRegService {
	private ThemeRegDAO themeRegDao;

	public ThemeRegService() {
		themeRegDao=new ThemeRegDAO();
	}
	
	public int insertTheme(ThemeRegVO vo) throws SQLException {
		return themeRegDao.insertTheme(vo);
	}
	
}
