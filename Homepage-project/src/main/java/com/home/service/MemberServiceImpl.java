package com.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.home.dao.MemberDAO;
import com.home.vo.BoardVO;
import com.home.vo.MemberVO;
import com.home.vo.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	@Override
	public int passChk(MemberVO vo) throws Exception {
		return dao.passChk(vo);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		return dao.idChk(vo);
	}
	
	
	@Override
	public List<BoardVO> memberwritelistPage(SearchCriteria scri) throws Exception {
		return dao.memberwritelistPage(scri);
	}

	@Override
	public List<BoardVO> memberreplylistPage(SearchCriteria scri) throws Exception {
		return dao.memberreplylistPage(scri);
	}


}
