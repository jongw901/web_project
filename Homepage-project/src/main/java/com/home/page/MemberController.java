package com.home.page;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.home.service.BoardService;
import com.home.service.MemberService;
import com.home.vo.MemberVO;
import com.home.vo.PageMaker;
import com.home.vo.SearchCriteria;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService service;
	@Autowired
	BoardService boardservice;

	// 회원가입 화면
	@RequestMapping(value = "/member/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("register");
	}

	// 회원가입 post
	@RequestMapping(value = "/member/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("registerpost");
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/member/register";
			}
			else if(result == 0) {
				service.register(vo);
			} 
			}catch(Exception e) {
				throw new RuntimeException();		
		}
		return "redirect:/";
	}

	// 로그인 post
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("login post");

		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);

		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
			scri.setUserId(login.getUserId());
		}

		return "redirect:/";
	}

	// logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("logout");
		session.invalidate();

		return "redirect:/";
	}

	// 정보변경 화면
	@RequestMapping(value = "/member/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		logger.info("memberupdateview");
		return "member/memberUpdateView";
	}

	// 정보변경 post
	@RequestMapping(value = "/member/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("memberupdatepost");
		service.memberUpdate(vo);

		session.invalidate();

		return "redirect:/";
	}

	// 회원 탈퇴 화면
	@RequestMapping(value = "/member/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception {
		logger.info("memberdeleteview");
		
		return "member/memberDeleteView";
	}

	// 회원 탈퇴 post
	@RequestMapping(value = "/member/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		logger.info("memberdeletepost");
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getUserPass();
		String voPass = vo.getUserPass();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
	}
	//패스워드 체크
	@ResponseBody
	@RequestMapping(value="/member/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/member/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception{
		int result = service.idChk(vo);
		return result;
	}
	
	//회원 쓴 글 확인
	@RequestMapping(value = "/board/memberwritelistPage", method = RequestMethod.GET)
	public String memberwritelistPage(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("memberwritelistPage");

		scri.setMemberwritelist("y");
		model.addAttribute("memberwritelistPage", service.memberwritelistPage(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardservice.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board/memberwritelistPage";
	}
	
	//회원 쓴 댓글 확인
	@RequestMapping(value = "/board/memberreplylistPage", method = RequestMethod.GET)
	public String memberreplylistPage(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("memberreplylistPage");

		
		model.addAttribute("memberreplylistPage", service.memberreplylistPage(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardservice.replyCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "board/memberreplylistPage";
	}
}