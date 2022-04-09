package com.home.dao;

import java.util.List;

import com.home.vo.BoardVO;
import com.home.vo.MemberVO;
import com.home.vo.SearchCriteria;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;

	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//회원 정보 변경
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//회원 탈퇴 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	//회원 쓴 글 조회
	public List<BoardVO> memberwritelistPage(SearchCriteria scri) throws Exception;
	
	//회원 쓴 댓글 조회
	public List<BoardVO> memberreplylistPage(SearchCriteria scri) throws Exception;
		
}
