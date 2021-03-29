package com.proj.request.model;

import java.sql.SQLException;

public class RequestService {
	private RequestDAO dao;
	
	public RequestService() {
		dao=new RequestDAO();
	}
	
	public int insertRequest(RequestVO vo) throws SQLException {
		return dao.insertRequest(vo);
	}

	
}
