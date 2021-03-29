package com.proj.location2.model;

import java.sql.SQLException;
import java.util.List;

public class Location2Service {
	private Location2DAO l2Dao;
	
	public Location2Service() {
		l2Dao=new Location2DAO();
	}
	
	public List<Location2VO> selectByLocation1Code(String location1Code) throws SQLException {
		return l2Dao.selectByLocation1Code(location1Code);
	}
}
