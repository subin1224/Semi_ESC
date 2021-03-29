package com.proj.genre.model;

import java.sql.SQLException;
import java.util.List;

public class GenreService {
	private GenreDAO genreDao;
	
	public GenreService() {
		genreDao=new GenreDAO();
	}
	
	public int insertGenre(String genreName) throws SQLException {
		return genreDao.insertGenre(genreName);
	}
	
	public int updateGenre(GenreVO vo) throws SQLException {
		return genreDao.updateGenre(vo);
	}
	
	public int deleteGenre(int genreCode) throws SQLException {
		return genreDao.deleteGenre(genreCode);
	}

	public GenreVO selectByGenreCode(int genreCode) throws SQLException {
		return genreDao.selectByGenreCode(genreCode);
	}

	public List<GenreVO> selectByGenreName(String genreName) throws SQLException {
		return genreDao.selectByGenreName(genreName);
	}

	public List<GenreVO> selectByAll() throws SQLException{
		return genreDao.selectByAll();
	}


}//
