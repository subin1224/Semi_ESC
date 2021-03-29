package com.proj.notice.model;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class NoticeDAO {
	private ConnectionPoolMgr2 pool;

	public NoticeDAO() {
		pool=new ConnectionPoolMgr2();
	}

	//1230 지안
	//공지사항 등록
	public int insertNotice(NoticeVO noVo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con= pool.getConnection();

			String sql="insert into notice (noticeno, notitle,nocontent, brandno)" + 
					" values(notice_seq.nextval, ? , ? , ?)";
			ps=con.prepareStatement(sql);

			ps.setString(1, noVo.getNoTitle());
			ps.setString(2, noVo.getNoContent());
			ps.setInt(3, noVo.getBrandNo());

			int cnt = ps.executeUpdate();
			System.out.println("공지사항 등록 결과 cnt="+cnt+"매개변수 noVo="+noVo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	//공지사항 전체 조회
	public List<NoticeVO> selectAll() throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<NoticeVO> noList = new ArrayList<NoticeVO>();



		try {
			con=pool.getConnection();

			String sql = "select * from notice order by noticeNo desc";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();

			while(rs.next()) {
				int noticeNo = rs.getInt("noticeNo");
				String noTitle= rs.getString("notitle");
				String noContent = rs.getString("noContent");
				Timestamp noRegdate = rs.getTimestamp("noregdate");
				int brandNo = rs.getInt("brandNo");
				int noHit = rs.getInt("noHit");


				NoticeVO noVo = new NoticeVO(noticeNo, noTitle, noContent, noRegdate, brandNo, noHit);

				noList.add(noVo);
			}
			System.out.println("공지사항 전체 조회 결과 List.size()="+noList.size());
			return noList;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}


	//공지사항 전체 조회 (+검색조건)
	public List<NoticeVO> selectAll(String condition, String keyword) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<NoticeVO> noList = new ArrayList<NoticeVO>();

		try {
			con=pool.getConnection();

			String sql = "select * from notice ";
			if(keyword!=null && !keyword.isEmpty()) { //검색
				sql += " where "+ condition +" like '%' || ? || '%'";
			}
			sql += "order by noticeNo desc";
			ps=con.prepareStatement(sql);

			if(keyword!=null && !keyword.isEmpty()) { //검색
				ps.setString(1, keyword);
			}         

			rs=ps.executeQuery();

			while(rs.next()) {
				int noticeNo = rs.getInt("noticeNo");
				String noTitle= rs.getString("notitle");
				String noContent = rs.getString("noContent");
				Timestamp noRegdate = rs.getTimestamp("noregdate");
				int brandNo = rs.getInt("brandNo");
				int noHit = rs.getInt("noHit");


				NoticeVO noVo = new NoticeVO(noticeNo, noTitle, noContent, noRegdate, brandNo, noHit);

				noList.add(noVo);
			}
			System.out.println("공지사항 전체 조회 결과 List.size()="+noList.size()+", 매개변수 condition="+condition+", keyword="+keyword);
			return noList;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}









	//지안 이가 한거 

	//공지사항 번호로 조회하기

	public NoticeVO selectByNo(int noticeNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		NoticeVO noVo = new NoticeVO();



		try {
			con=pool.getConnection();

			String sql = "select * from notice "
					+ " where noticeNo= ? ";
			ps=con.prepareStatement(sql);

			ps.setInt(1, noticeNo);


			rs=ps.executeQuery();

			while(rs.next()) {
				String noTitle= rs.getString("notitle");
				String noContent = rs.getString("noContent");
				Timestamp noRegdate = rs.getTimestamp("noregdate");
				int brandNo = rs.getInt("brandNo");
				int noHit = rs.getInt("noHit");


				noVo = new NoticeVO(noticeNo, noTitle, noContent, noRegdate, brandNo, noHit);
			}
			System.out.println("공지사항 번호로 조회 결과 noVo="+noVo);
			return noVo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	//공지사항 hit update
	public int updateNoHit(int noticeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {

			con=pool.getConnection();


			String sql="update notice" + 
					" set noHit=noHit+1" + 
					" where noticeNo = ? ";
			ps=con.prepareStatement(sql);

			ps.setInt(1, noticeNo);

			//4
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과, cnt="+cnt+", 매개변수 no="+noticeNo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	//공지사항 수정

	//공지사항 delete 
	public int deleteNotice(int noticeNo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="delete from notice where noticeNo= ? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, noticeNo);


			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 삭제 결과, cnt="+cnt+", 매개변수 noticeNo="+noticeNo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}


	//공지사항 내용  수정
	public int updateNotice(NoticeVO noticeVo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="update notice" + 
					" set notitle =? ,nocontent = ?" + 
					" where noticeNo=? ";
			ps=con.prepareStatement(sql);

			ps.setString(1, noticeVo.getNoTitle());
			ps.setString(2, noticeVo.getNoContent());
			ps.setInt(3, noticeVo.getNoticeNo());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("글수정 결과, cnt="+cnt+", 매개변수 vo="+noticeVo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}


	//공지사항 detail보기



}
