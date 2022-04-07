package com.home.service;

import java.util.List;

import com.home.vo.BoardVO;
import com.home.vo.SearchCriteria;

public interface BoardService {
	public void write(BoardVO boardVO) throws Exception;
	public void write_notice(BoardVO boardVO_n) throws Exception;

	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	public List<BoardVO> list_notice(SearchCriteria scri_n) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	public int listCount_notice(SearchCriteria scri_n) throws Exception;
	public int replyCount(SearchCriteria scri) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	public BoardVO read_notice(int bno_n) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
	public void update_notice(BoardVO boardVO_n) throws Exception;
	
	public void delete(int bno) throws Exception;
	public void delete_notice(int bno_n) throws Exception;
	
	
}