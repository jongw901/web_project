package com.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.home.dao.BoardDAO;
import com.home.vo.BoardVO;
import com.home.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	@Override
	public void write_notice(BoardVO boardVO) throws Exception {
		dao.write_notice(boardVO);		
	}

	
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	@Override
	public List<BoardVO> list_notice(SearchCriteria scri) throws Exception {
		return dao.list_notice(scri);
	}

	
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}
	@Override
	public int listCount_notice(SearchCriteria scri) throws Exception {
		return dao.listCount_notice(scri);
	}
	@Override
	public int replyCount(SearchCriteria scri) throws Exception{
		return dao.replyCount(scri);
	}


	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		dao.boardHit(bno);
		return dao.read(bno);
	}
	@Transactional(isolation = Isolation.READ_COMMITTED)	
	@Override
	public BoardVO read_notice(int bno) throws Exception {
		dao.boardHit_notice(bno);
		return dao.read_notice(bno);
	}
	
	
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	@Override
	public void update_notice(BoardVO boardVO) throws Exception {
		dao.update_notice(boardVO);
	}

	
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}
	@Override
	public void delete_notice(int bno) throws Exception {
		dao.delete_notice(bno);
	}

}