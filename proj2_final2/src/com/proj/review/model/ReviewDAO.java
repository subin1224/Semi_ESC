package com.proj.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;
import com.proj.member.model.MemberService;

public class ReviewDAO {

	public int insertReview(ReviewVO vo) throws SQLException {
		Connection con= null;
		PreparedStatement ps=null;
		ConnectionPoolMgr2 pool= new ConnectionPoolMgr2();

		int cnt=0;
		try {
			con=pool.getConnection();
			String sql="insert into review(reviewno, userno, reserveno, retitle, recontent, rating, roomno) "
					+ " values(review_seq.nextval,?,?,?,?,?,?) ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getUserNo());
			ps.setInt(2, vo.getReserveno());
			ps.setString(3, vo.getReTitle());
			ps.setString(4, vo.getReContent());
			ps.setDouble(5, vo.getRating());
			ps.setInt(6, vo.getRoomNo());
			
			cnt=ps.executeUpdate();
			
			System.out.println("매개변수 vo="+vo+ " , 결과값cnt="+cnt);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int editReview(ReviewVO vo) throws SQLException {
		Connection con= null;
		PreparedStatement ps=null;
		ConnectionPoolMgr2 pool= new ConnectionPoolMgr2();

		try {
			con=pool.getConnection();
			String sql=" update review " + 
					   " set retitle=?, recontent=?, rating=? " + 
					   " where reviewno =? ";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getReTitle());
			ps.setString(2, vo.getReContent());
			ps.setDouble(3, vo.getRating());
			ps.setInt(4, vo.getReviewNo());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("매개변수 vo="+vo+ " , 결과값cnt="+cnt);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateReadCount(int reviewNo) throws SQLException{
		Connection con= null;
		PreparedStatement ps=null;
		ConnectionPoolMgr2 pool= new ConnectionPoolMgr2();

		try {
			con=pool.getConnection();
			String sql=" update review " + 
					   " set likecount=likecount+1 " + 
					   " where reviewno= ? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			
			int cnt=ps.executeUpdate();
			
			System.out.println("매개변수 vo="+reviewNo+ " , 결과값cnt="+cnt);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<ReviewVO> sellectAll(String keyword, String condition) throws SQLException{
		//1
		Connection con =null;
		PreparedStatement ps= null;
		ResultSet rs =null;
		ConnectionPoolMgr2 pool =new ConnectionPoolMgr2();
		List<ReviewVO> list= new ArrayList<ReviewVO>();
		
		//2
		try {
			con= pool.getConnection();
			String sql="select b.reviewno reviewno, b.userno userno, b.roomno roomno, b.retitle retitle, \r\n" + 
					" b.recontent recontent, b.likecount likecount, b.rating rating, \r\n" + 
					" b.reregdate reregdate, b.rehit rehit, a.themename themename, \r\n" + 
					" c.userid userid, e.brandname brandname, f.unitname unitname  \r\n" + 
					" from theme a join room d on a.themeno = d.themeno  \r\n" + 
					" join review b on d.roomno = b.roomno  \r\n" + 
					" join escmem c on c.userno = b.userno  \r\n" + 
					" join brand e on e.BRANDNO = d.brandno\r\n" + 
					" join unit f on f.UNITNO = d.UNITNO ";
			
			if(keyword!=null && !keyword.isEmpty()) { //검색
				if(condition.equals("themeName")) {
					System.out.println("step1");
					sql +=" and a.themename like '%' || ? || '%' order by reviewno desc";	
				}else if(condition.equals("userId")){
					System.out.println("step2");
					sql += " and c.userid like '%' || ? || '%' order by reviewno desc";
				}else if(condition.equals("reTitle")) {
					System.out.println("step3");
					sql += " and b.retitle like '%' || ? || '%' order by reviewno desc";
				}
				System.out.println("step4");
				ps=con.prepareStatement(sql);
				ps.setString(1, keyword);
				System.out.println("step5");
			}else {
				System.out.println("step6");
				sql += " order by reviewno desc";
				ps=con.prepareStatement(sql);
			}
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int reviewNo = rs.getInt("reviewno");
				int userNo = rs.getInt("userno");
				int roomNo = rs.getInt("roomno");
				String reTitle = rs.getString("retitle");
				String reContent = rs.getString("recontent");
				int likeCount = rs.getInt("likecount");
				Double rating = rs.getDouble("rating");
				Timestamp reRegdate = rs.getTimestamp("reregdate");
				int reHit = rs.getInt("rehit");
				String themeName = rs.getString("themename");
				String userId = rs.getString("userid");
				String brandName = rs.getString("brandname");
				String unitName = rs.getString("unitname");
				
				ReviewVO reviewVo= new ReviewVO(reviewNo, userNo, roomNo, reTitle, reContent,
						likeCount, rating, reRegdate, reHit, themeName, userId, brandName, unitName);
				
				list.add(reviewVo);
			}
			System.out.println("리뷰조회결과 list="+list.size());
			
			for(int i =0; i<list.size(); i++) {
				ReviewVO vo= list.get(i);
				System.out.println(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public ReviewVO selectByReNo(int reviewNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps= null;
		ResultSet rs =null;
		ConnectionPoolMgr2 pool =new ConnectionPoolMgr2();
		
		try{
			con=pool.getConnection();
			String sql ="select b.reviewno reviewno, b.userno userno, b.roomno roomno, b.retitle retitle, \r\n" + 
					" b.recontent recontent, b.likecount likecount, b.rating rating, \r\n" + 
					" b.reregdate reregdate, b.rehit rehit, a.themename themename, \r\n" + 
					" c.userid userid, e.brandname brandname, f.unitname unitname  \r\n" + 
					" from theme a join room d on a.themeno = d.themeno  \r\n" + 
					" join review b on d.roomno = b.roomno  \r\n" + 
					" join escmem c on c.userno = b.userno  \r\n" + 
					" join brand e on e.BRANDNO = d.brandno\r\n" + 
					" join unit f on f.UNITNO = d.UNITNO" + 
					" and b.reviewno =? order by reviewno desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, reviewNo);
			
			ReviewVO reviewVo = new ReviewVO();
			rs=ps.executeQuery();
			if(rs.next()) {
				
				int userNo = rs.getInt("userno");
				int roomNo = rs.getInt("roomno");
				String reTitle = rs.getString("retitle");
				String reContent = rs.getString("recontent");
				int likeCount = rs.getInt("likecount");
				Double rating = rs.getDouble("rating");
				Timestamp reRegdate = rs.getTimestamp("reregdate");
				int reHit = rs.getInt("rehit");
				String themeName = rs.getString("themename");
				String userId = rs.getString("userid");
				String brandName = rs.getString("brandname");
				String unitName = rs.getString("unitname");
				
				reviewVo= new ReviewVO(reviewNo, userNo, roomNo, reTitle, reContent,
						likeCount, rating, reRegdate, reHit, themeName, userId, brandName, unitName);
				
				System.out.println("결과값 reviewVo="+reviewVo);				
			}
			return reviewVo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public ReviewVO selectByRoomNo(int roomNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps= null;
		ResultSet rs =null;
		ConnectionPoolMgr2 pool =new ConnectionPoolMgr2();
		
		try{
			con=pool.getConnection();
			String sql ="select b.reviewno reviewno, b.userno userno, b.roomno roomno, b.retitle retitle, " + 
					" b.recontent recontent, b.likecount likecount, b.rating rating, " + 
					" b.reregdate reregdate, b.rehit rehit, a.themename themename, " + 
					" c.userid userid, e.brandname brandname " + 
					" from theme a join room d on a.themeno = d.themeno " + 
					" join review b on d.roomno = b.roomno " + 
					" join escmem c on c.userno = b.userno " + 
					" join brand e on e.BRANDNO = d.brandno " + 
					" and b.roomno =? order by reviewno desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, roomNo);
			
			ReviewVO reviewVo = new ReviewVO();
			rs=ps.executeQuery();
			if(rs.next()) {
				int reviewNo = rs.getInt("reviewno");
				int userNo = rs.getInt("userno");				
				String reTitle = rs.getString("retitle");
				String reContent = rs.getString("recontent");
				int likeCount = rs.getInt("likecount");
				Double rating = rs.getDouble("rating");
				Timestamp reRegdate = rs.getTimestamp("reregdate");
				int reHit = rs.getInt("rehit");
				String themeName = rs.getString("themename");
				String userId = rs.getString("userid");
				String brandName = rs.getString("brandname");
				String unitName = rs.getString("unitname");
				
				reviewVo= new ReviewVO(reviewNo, userNo, roomNo, reTitle, reContent,
						likeCount, rating, reRegdate, reHit, themeName, userId, brandName, unitName);
				
				System.out.println("결과값 reviewVo="+reviewVo);				
			}
			return reviewVo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public String imgByRoomNo(int roomNo) throws SQLException {
		Connection con= null;	
		PreparedStatement ps= null;		
		ResultSet rs =null;

		ConnectionPoolMgr2 pool= new ConnectionPoolMgr2();

		try {
			con = pool.getConnection();
			String sql=" select themesrc from themeimg" + 
					" where themeno=(select themeno from room" + 
					" where roomno=?)";

			ps=con.prepareStatement(sql);
			ps.setInt(1, roomNo);
			rs=ps.executeQuery();
			String result=null;
			if(rs.next()) {
				result = rs.getString(1);
				System.out.println("result ="+result);
			}

			return result;			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//브랜드넘버를 넣으면 테마이름과, 리뷰 정보들 출력
	public List<ReviewVO> selectByBrandNo(int brandno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ConnectionPoolMgr2 pool = new ConnectionPoolMgr2();
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			con=pool.getConnection();
			String sql="select a.reviewno, c.themename, a.retitle, a.rating, d.userid ,a.reregdate "
					+ " from review a join room b on a.roomno = b.roomno join theme c on c.themeno=b.themeno "
					+ " join escmem d on a.userno = d.userno"
					+ " where b.brandno=? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, brandno);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				int reviewNo = rs.getInt("reviewno");
				String themeName = rs.getString("themename");
				String reTitle = rs.getString("retitle");
				double rating = rs.getDouble("rating");
				String userId = rs.getString("userid");
				Timestamp reRegdate = rs.getTimestamp("reregdate");
				
				ReviewVO vo = new ReviewVO(reviewNo, reTitle, rating, reRegdate, themeName, userId);
				list.add(vo);
			}
			System.out.println("BrandNo로 조회한 list.size="+list.size()+", 매개변수 brandNo="+brandno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//해당 UserId가 적은 Review리스트 출력
	public List<ReviewTotalVO> selectReviewByUser(int userno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ConnectionPoolMgr2 pool = new ConnectionPoolMgr2();
		
		List<ReviewTotalVO> list = new ArrayList<ReviewTotalVO>();
		try {
			con=pool.getConnection();
			String sql=" select a.reviewno,c.themename, a.retitle, a.recontent, a.rating, a.reregdate "
					+ " from review a join escmem b on a.userno = b.userno "
					+ " join room d on a.roomno = d.roomno "
					+ " join theme c on d.themeno = c.themeno "
					+ " where b.userno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, userno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int reviewNo = rs.getInt("reviewno");
				String reTitle = rs.getString("retitle");
				String reContent = rs.getString("recontent");
				double rating = rs.getInt("rating");
				Timestamp reRegdate = rs.getTimestamp("reregdate");
				String themeName = rs.getString("themename");
				
				ReviewTotalVO vo = new ReviewTotalVO(reviewNo, reTitle, reContent, rating, reRegdate, themeName);
				list.add(vo);
			}
			
			System.out.println("select-Review-ByUser list.size()="+list.size()+", 매개변수 userNo="+userno);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//해당 유저가 예약한 방에 대해 리뷰를 적었는지 안적었는지 체크
	public int chkReview(int reserveNo, int userNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ConnectionPoolMgr2 pool = new ConnectionPoolMgr2();
		
		int result=0;
		try {
			con=pool.getConnection();
			String sql="select count(*) from review where reserveno=? and userno=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, reserveNo);
			ps.setInt(2, userNo);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) { //이미 작성한 리뷰
					result=ReviewService.REVIEW_OK;
				}else { //아직 리뷰를 작성하지 않음
					result=ReviewService.REVIEW_NOT; 					
				}
			}//if
			
			System.out.println("리뷰 작성했나요? 맞다면 1 아니라면 2!! : "+result+", reserveNo="+reserveNo+", userNo="+userNo);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}		

	}
	
	
}
