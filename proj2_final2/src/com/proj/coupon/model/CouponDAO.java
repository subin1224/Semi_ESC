package com.proj.coupon.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class CouponDAO {
	private ConnectionPoolMgr2 pool;
	
	public CouponDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	//지안 시작
	//reserveDetail 의 쿠폰 적용 버튼 누를 시 쿠폰 리스트 뿌리기 위해서
	//마감일이 오늘 날짜보다 이전에 있는 쿠폰을 전체 조회입니다.
	public List<CouponVO> selectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CouponVO> list = new ArrayList<CouponVO>();
		
		try {
			con=pool.getConnection();
			
			String sql = "select * from coupon " + 
					" where endDate > sysdate " + 
					" order by cpno desc";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int cpNo= rs.getInt("cpNo");
				String cpCode = rs.getString("cpCode");
				int discount = rs.getInt("disCount");
				Timestamp startDate = rs.getTimestamp("startDate");
				Timestamp endDate = rs.getTimestamp("endDate");
				String cpName = rs.getString("couponName");
				
				CouponVO cpVo = new CouponVO(cpNo, cpCode, discount, startDate, endDate, cpName);
				list.add(cpVo);
			}
			System.out.println("쿠폰 리스트 전체 조회 list.size()="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//쿠폰 삭제
	public int deleteCoupon(int couponNo) throws SQLException {
		Connection con= null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			String sql="delete coupon " + 
					" where cpNo= ? ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, couponNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("쿠폰 번호로 쿠폰 삭제 결과 cnt="+cnt+", 매개변수 쿠폰번호="+couponNo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	//쿠폰 등록
	public int insertCoupon(CouponVO vo,int day) throws SQLException {
		Connection con= null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into coupon " + 
					"values(coupon_seq.nextval, ? , ? , sysdate , sysdate + ? , ? )";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getCouponCode());
			ps.setInt(2, vo.getDiscount());
			ps.setInt(3, day);
			ps.setString(4, vo.getCouponName());
			
			int cnt = ps.executeUpdate();
			System.out.println("쿠폰 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
