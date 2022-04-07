package com.home.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.home.vo.BoardVO;
import com.home.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}
	@Override
	public void write_notice(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert_notice", boardVO);	
	}
	
	
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", scri);
	}
	@Override
	public List<BoardVO> list_notice(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage_notice", scri);
	}
	
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}
	@Override
	public int listCount_notice(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount_notice", scri);
	}
	@Override
	public int replyCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.replyCount", scri);
	}

	
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	@Override
	public BoardVO read_notice(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read_notice", bno);
	}
	

	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);		
	}
	@Override
	public void update_notice(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update_notice", boardVO);
	}
	

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete", bno);
	}
	@Override
	public void delete_notice(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete_notice", bno);
	}

	
	@Override
	public void boardHit(int bno) throws Exception {
		sqlSession.update("boardMapper.boardHit", bno);
	}
	@Override
	public void boardHit_notice(int bno) throws Exception {
		sqlSession.update("boardMapper.boardHit_notice", bno);
	}
	
}
