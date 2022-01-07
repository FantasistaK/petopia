package com.icia.petopia.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.petopia.dto.MemberDTO;
import com.icia.petopia.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;

	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	// 회원가입 페이지
	@RequestMapping(value = "/joinpage")
	public String memberJoin() {
		return "memberjoin";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/memberjoin")
	public ModelAndView memberJoin(@ModelAttribute MemberDTO member) {
		mav = ms.memberJoin(member);
		return mav;
	}
	
	// 아이디 중복확인
	@RequestMapping(value = "/idcheck")
	public @ResponseBody String idCheck(@RequestParam("mid") String mid) {
		String result = ms.idCheck(mid);
		return result;
	}
	
	// 로그인 페이지
	@RequestMapping(value = "/loginpage")
	public String memberLogin() {
		return "memberlogin";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/memberlogin")
	public ModelAndView memberLogin(@ModelAttribute MemberDTO member) {
		mav = ms.memberLogin(member);
		return mav;
	}
	
	// 로그아웃 처리
	@RequestMapping(value = "/logout")
	public String logout() {
		session.invalidate();
		return "home";
	}
	
	// 회원목록조회
	@RequestMapping(value = "/memberlist")
	public ModelAndView memberList() {
		mav = ms.memberList();
		return mav;
	}
	
	// 회원정보조회
	@RequestMapping(value = "/memberview")
	public ModelAndView memberView(@RequestParam("mid") String mid) {
		mav = ms.memberView(mid);
		return mav;
	}
	
	// 회원삭제 처리 메소드
	@RequestMapping(value = "/memberdelete")
	public ModelAndView memberDelete(@RequestParam("mid") String mid) {
		mav = ms.memberDelete(mid);
		return mav;
	}
	
	// ajax로 상세조회
	@RequestMapping(value = "/memberviewajax")
	public @ResponseBody MemberDTO memberViewAjax(@RequestParam("mid") String mid) {
		MemberDTO member = ms.memberViewAjax(mid);
		return member;
	}
	
	// 마이페이지
	@RequestMapping(value = "/mypage")
	public String myPage() {
		return "mypage";
	}
	
	// 회원정보수정 요청
	@RequestMapping(value = "/memberupdate")
	public ModelAndView memberUpdate() {
		mav = ms.memberUpdate();
		return mav;
	}
		
	// 회원정보수정 처리
	@RequestMapping(value = "/memberupdateprocess")
	public ModelAndView memberUpdateProcess(@ModelAttribute MemberDTO member) {
		mav = ms.memberUpdateProcess(member);
		return mav;
	}
	
}
