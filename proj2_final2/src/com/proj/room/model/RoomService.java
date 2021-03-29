package com.proj.room.model;

import java.sql.SQLException;
import java.util.List;

public class RoomService {
	private RoomDAO roomDao;

	public RoomService() {
		roomDao=new RoomDAO();
	}

	public int insertRoom(RoomVO vo) throws SQLException {
		return roomDao.insertRoom(vo);
	}

	public int deleteRoom(int roomNo) throws SQLException {
		return roomDao.deleteRoom(roomNo);
	}

	public RoomVO selectByRoomNo(int roomNo) throws SQLException {
		return roomDao.selectByRoomNo(roomNo);
	}

	public int selectRoomNoBy(int brandNo, int unitNo, int themeNo) throws SQLException {
		return roomDao.selectRoomNoBy(brandNo, unitNo, themeNo);
	}

	public List<RoomVO> selectByAll() throws SQLException{
		return roomDao.selectByAll();
	}

	//1229 추가(1)
	public List<RoomTotalVO> selectByAll2() throws SQLException{
		return roomDao.selectByAll2();
	}

	//1229 추가(2)
	public List<RoomTotalVO> selectByThemeName(String themeName) throws SQLException{
		return roomDao.selectByThemeName(themeName);
	}

	//1229 추가(3)
	public RoomTotalVO selectByRoomNo2(int roomNo) throws SQLException {
		return roomDao.selectByRoomNo2(roomNo);
	}
	
	//1229 추가(4)
	public List<RoomTotalVO> selectByCondition(String condition, String keyword) throws SQLException{
		return roomDao.selectByCondition(condition, keyword);
	}
	
	//1229 추가(5)
	public List<RoomTotalVO> selectByCondition(String condition, List<String> keyword) throws SQLException{
		return roomDao.selectByCondition(condition, keyword);
	}

	//1230
	public List<RoomTotalVO> selectByBrandNo(int BrandNo) throws SQLException{
		return roomDao.selectByBrandNo(BrandNo);
	}

}
