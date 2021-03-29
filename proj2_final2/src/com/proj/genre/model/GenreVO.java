package com.proj.genre.model;

public class GenreVO {
	private int genreCode;
	private String genreName;
	
	public GenreVO() {
		super();
	}

	public GenreVO(int genreCode, String genreName) {
		super();
		this.genreCode = genreCode;
		this.genreName = genreName;
	}

	public int getGenreCode() {
		return genreCode;
	}

	public void setGenreCode(int genreCode) {
		this.genreCode = genreCode;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	@Override
	public String toString() {
		return "GenreVO [genreCode=" + genreCode + ", genreName=" + genreName + "]";
	}
	
	
	
}
