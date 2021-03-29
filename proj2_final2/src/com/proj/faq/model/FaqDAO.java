package com.proj.faq.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proj.db.ConnectionPoolMgr2;

public class FaqDAO {
private ConnectionPoolMgr2 pool;
	
	public FaqDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public List<FaqVO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<FaqVO> faqList = new ArrayList<FaqVO>();
		try {
			
			con = pool.getConnection();
			
			String sql = "select * from faq";
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int faqNo = rs.getInt("faqNo");
				String question = rs.getString("Question");
				String ask = rs.getString("Ask");
				
				FaqVO vo = new FaqVO(faqNo, question, ask);
				faqList.add(vo);
				
			}
			System.out.println("faq 전체 리스트 조회 결과= faqList.size()="+ faqList.size());
			return faqList;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
}
