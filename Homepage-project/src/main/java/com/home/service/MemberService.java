package com.home.service;

import java.util.List;

import com.home.vo.BoardVO;
import com.home.vo.MemberVO;
import com.home.vo.SearchCriteria;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public void memberDelete(MemberVO vo) throws Exception;
	
	public int passChk(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public List<BoardVO> memberwritelistPage(SearchCriteria scri) throws Exception;
	
	public List<BoardVO> memberreplylistPage(SearchCriteria scri) throws Exception;
}
