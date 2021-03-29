package com.proj.faq.model;

import java.sql.SQLException;
import java.util.List;

public class FaqService {

	private FaqDAO faqDao;

	public FaqService() {
		faqDao=new FaqDAO();
	}
	
	public List<FaqVO> selectAll() throws SQLException{
		return faqDao.selectAll();
	}
}
