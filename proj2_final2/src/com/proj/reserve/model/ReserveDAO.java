package com.proj.reserve.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class ReserveDAO {
	private ConnectionPoolMgr2 pool;

	public ReserveDAO() {
		pool=new ConnectionPoolMgr2();
	}

	//예약 - 2번 insert 
	public int insertReserveAll(ReserveVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		int cnt=0;
		try {
			con=pool.getConnection();

			con.setAutoCommit(false);
			//[1] reserveDate에 입력 먼저
			String sql = "insert into reservedate(redatecode, reserveday,reservetime) " + 
					" values(reservedate_seq.nextval, ? , ? )";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getReserveDay());
			ps.setString(2, vo.getReserveTime());


			cnt=ps.executeUpdate();
			System.out.println("reserveDate 테이블에 입력 결과 cnt="+cnt+"이때의 day="+vo.getReserveDay()+", time="+vo.getReserveTime());

			//[2] reserve에 입력
			sql="insert into reserve (reserveno , userno , roomno, playernum, payment, reservecode, reservereg) " 
					+ " values( reserve_seq.nextval, ? , ? , ? ,? , reservedate_seq.currval, sysdate ) ";
			ps=con.prepareStatement(sql);

			ps.setInt(1, vo.getUserNo());
			ps.setInt(2, vo.getRoomNo());
			ps.setInt(3, vo.getPlayerNum());
			ps.setInt(4, vo.getPayment());

			cnt=ps.executeUpdate();
			System.out.println("reserve 테이블에 입력 결과 cnt="+cnt+"이때의 userno="+vo.getUserNo()
			+", roomno="+vo.getRoomNo()+", playernum="+vo.getPlayerNum()+", payment="+vo.getPayment());

			con.commit();
		}catch(SQLException e){
			con.rollback();
			e.printStackTrace();
		}finally {
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}

		return cnt;
	}


	//해당 브랜드(brandNo)의 예약목록 조회 - 5건 까지만
	public List<ReserveVO> selectByBrandNO(int brandNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ReserveVO> list = new ArrayList<ReserveVO>();
		try {
			con=pool.getConnection();
			String sql="select a.reserveno, b.redatecode, d.themename, b.reserveday, b.reservetime, e.userid, a.reservereg,"
					+ " b.reserveflag, c.brandno, c.roomno, a.playernum, a.payment, a.userno "
					+ " from reserve a "
					+ " join reservedate b on a.reservecode = b.redatecode "
					+ " join room c on c.roomno = a.roomno "
					+ " join theme d on d.THEMENO = c.THEMENO "
					+ " join escmem e on e.userno = a.userno "
					+ " where c.brandno=? and rownum<=5 order by reservereg desc ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, brandNo);

			rs=ps.executeQuery();

			while(rs.next()) {
				int reserveNo = rs.getInt("reserveno");
				int redateCode = rs.getInt("redatecode");
				String themeName = rs.getString("themename");
				String reserveDay = rs.getString("reserveday");
				String reserveTime = rs.getString("reservetime");
				String userId = rs.getString("userid");
				Timestamp reserveReg = rs.getTimestamp("reservereg");
				String reserveFlag = rs.getString("reserveflag");
				int r_brandNo = rs.getInt("brandno");
				int roomNo = rs.getInt("roomno");
				int playerNum = rs.getInt("playernum");
				int payment = rs.getInt("payment");
				int userNo = rs.getInt("userno");

				ReserveVO vo = new ReserveVO(reserveNo, redateCode, themeName, reserveDay, reserveTime, userId, reserveReg, reserveFlag, r_brandNo, roomNo, playerNum, payment, userNo);

				list.add(vo);
			}

			System.out.println("BrandNo로 예약 조회 결과 list.size()="+list.size()+", 매개변수 brandNo="+brandNo);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//해당 브랜드(brandNo)의 예약목록 전체 조회
	public List<ReserveVO> selectByBrandNoAll(int brandNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<ReserveVO> list = new ArrayList<ReserveVO>();
		try {
			con=pool.getConnection();
			String sql="select a.reserveno, b.redatecode, d.themename, b.reserveday, b.reservetime, e.userid, a.reservereg,"
					+ " b.reserveflag, c.brandno, c.roomno, a.playernum, a.payment, a.userno "
					+ " from reserve a "
					+ " join reservedate b on a.reservecode = b.redatecode "
					+ " join room c on c.roomno = a.roomno "
					+ " join theme d on d.THEMENO = c.THEMENO "
					+ " join escmem e on e.userno = a.userno "
					+ " where c.brandno=? order by reservereg desc ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, brandNo);

			rs=ps.executeQuery();

			while(rs.next()) {
				int reserveNo = rs.getInt("reserveno");
				int redateCode = rs.getInt("redatecode");
				String themeName = rs.getString("themename");
				String reserveDay = rs.getString("reserveday");
				String reserveTime = rs.getString("reservetime");
				String userId = rs.getString("userid");
				Timestamp reserveReg = rs.getTimestamp("reservereg");
				String reserveFlag = rs.getString("reserveflag");
				int r_brandNo = rs.getInt("brandno");
				int roomNo = rs.getInt("roomno");
				int playerNum = rs.getInt("playernum");
				int payment = rs.getInt("payment");
				int userNo = rs.getInt("userno");

				ReserveVO vo = new ReserveVO(reserveNo, redateCode, themeName, reserveDay, reserveTime, userId, reserveReg, reserveFlag, r_brandNo, roomNo, playerNum, payment, userNo);

				list.add(vo);
			}

			System.out.println("BrandNo로 예약 조회 결과 list.size()="+list.size()+", 매개변수 brandNo="+brandNo);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//지안 추가 12 29
	//reserveTheme에서 시간 
	public List<ReserveVO> selectReserveFlag(int roomNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		try {
			con=pool.getConnection();

			String sql = "select * from reservedate  "+ 
					" where redatecode = (select redatecode from reserve where roomno= ? ) and reserveflag ='Y'";
			ps=con.prepareStatement(sql);

			ps.setInt(1, roomNo);

			rs = ps.executeQuery();
			while(rs.next()) {
				int reDateCode = rs.getInt("redatecode");
				String reserveDay = rs.getString("reserveday");
				String reserveTime = rs.getString("reserveTime");
				String reserveFlag = rs.getString("reserveFlage");

				ReserveVO vo =  new ReserveVO(reDateCode, reserveDay, reserveTime, reserveFlag);
				list.add(vo);
			}
			System.out.println("방번호로 조회한 예약 날짜 전체 조회 결과 list.size = "+list.size()+"매개변수 roomNo="+roomNo);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//userNo로 예약내역조회
	public List<ReserveVO> selectReserveByUserNo(int userNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		try {
			con=pool.getConnection();
			
			String sql="select r.reserveno, b.brandname, t.themename, rd.reserveday, rd.reservetime, rd.reserveflag "
					+ " from reserve r "
					+ " join reservedate rd on r.reservecode=rd.redatecode "
					+ " join room ro on r.roomno=ro.roomno "
					+ " join theme t on t.themeno=ro.themeno "
					+ " join brand b on b.brandno=ro.brandno "
					+ " join escmem m on r.userno=m.userno "
					+ " where m.userno=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, userNo);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int reserveNo=rs.getInt(1);
				String brandName=rs.getString(2);
				String themeName=rs.getString(3);
				String reserveDay=rs.getString(4);
				String reserveTime=rs.getString(5);
				String reserveFlag=rs.getString(6);
				
				ReserveVO vo = new ReserveVO(reserveNo, themeName, reserveDay, reserveTime, reserveFlag, brandName);

				list.add(vo);
			}
			
			System.out.println("userNo로 예약내역 조회 결과="+list.size()+", userno="+userNo);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//reserveNo
	public ReserveVO selectByReserveNo(int reserveNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ReserveVO vo = new ReserveVO();
		try {
			con=pool.getConnection();
			
			String sql="select a.reserveno, a.userno, a.roomno, a.playernum, a.payment, a.reservecode, a.reservereg, th.themename "
					+ " from reserve a "
					+ " join room ro on a.roomno = ro.roomno "
					+ " join theme th on ro.themeno = th.themeno "
					+ " where a.reserveno=? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, reserveNo);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				vo.setThemeName(rs.getString("themename"));
				vo.setUserNo(rs.getInt("userno"));
				vo.setRoomNo(rs.getInt("roomno"));
				vo.setPlayerNum(rs.getInt("playernum"));
				vo.setPayment(rs.getInt("payment"));
				vo.setReserveCode(rs.getInt("reservecode"));
				vo.setReserveReg(rs.getTimestamp("reservereg"));
				vo.setThemeName(rs.getString("themename"));
			}
			System.out.println("예약번호로 조회 결과 vo:"+vo+", 매개변수 reserveNo="+reserveNo);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
}
