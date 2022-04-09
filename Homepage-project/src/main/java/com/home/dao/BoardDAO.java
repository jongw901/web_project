package com.home.dao;

import java.util.List;

import com.home.vo.BoardVO;
import com.home.vo.SearchCriteria;

public interface BoardDAO {
	// 글 write
	public void write(BoardVO boardVO) throws Exception;
	// 공지 글 write
	public void write_notice(BoardVO boardVO) throws Exception;
	
	// 글 list
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	// 공지 list
	public List<BoardVO> list_notice(SearchCriteria scri) throws Exception;
	
	// 글 개수
	public int listCount(SearchCriteria scri) throws Exception;
	// 공지 글 개수
	public int listCount_notice(SearchCriteria scri) throws Exception;
	
	// 댓글 개수
	public int replyCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	// 공지 조회
	public BoardVO read_notice(int bno) throws Exception;

	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	// 공지 수정
	public void update_notice(BoardVO boardVO) throws Exception;	

	// 게시물 삭제
	public void delete(int bno) throws Exception;
	// 공지 삭제
	public void delete_notice(int bno) throws Exception;	
	
	//조회수
	public void boardHit(int bno) throws Exception;
	//공지 조회수
	public void boardHit_notice(int bno) throws Exception;
	
	
}
