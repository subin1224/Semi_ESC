//1227 지안 15 줄에 <지안 시작> 부터 복사해주시면 됩니다.

package com.proj.location1.model;

import java.sql.SQLException;
import java.util.List;

public class Location1Service {
	private Location1DAO loc1Dao;
	
	public Location1Service() {
		loc1Dao=new Location1DAO();
	}
	//지안 시작
	//지역을 reserve 페이지에 전체 뿌리기 위해 만듬
	public List<Location1VO> selectAll() throws SQLException{
		return loc1Dao.selectAll();
	}
	
	//수정
	public int insertLocation1(Location1VO vo) throws SQLException{
		return loc1Dao.insertLocation1(vo);
	}
	
	public int updateLocation1(Location1VO vo) throws SQLException{
		return loc1Dao.updateLocation1(vo);
	}
	
	public int deleteLocation1(int location1Order) throws SQLException {
		return loc1Dao.deleteLocation1(location1Order);
	}
	
	public Location1VO selectByLocation1Code(String location1Code) throws SQLException {
		return loc1Dao.selectByLocation1Code(location1Code);
	}
	
	public List<Location1VO> selectByLocation1Name(String location1Name) throws SQLException {
		return loc1Dao.selectByLocation1Name(location1Name);
	}

	public List<Location1VO> selectByAll() throws SQLException{
		return loc1Dao.selectByAll();
	}	
}
