package com.icia.petopia.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.petopia.dao.MemberDAO;
import com.icia.petopia.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired 
	private MemberDAO mdao;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	public ModelAndView memberJoin(MemberDTO member) {
		mav = new ModelAndView();
		
		mdao.memberJoin(member);
		mav.setViewName("home");
		
		return mav;
	}

	public String idCheck(String mid) {
		String checkResult = mdao.idCheck(mid);
		String result = "";
		if(checkResult == null) {
			result = "ok";
		} else {
			result = "no";
		}
		return result;
	}
	
	public ModelAndView memberLogin(MemberDTO member) {
		mav = new ModelAndView();
		
		String loginId = mdao.memberLogin(member);
		
		if(loginId != null) {
			session.setAttribute("loginMember", loginId);
			mav.setViewName("redirect:/"); 
		} else {
			mav.setViewName("memberlogin");
		}
		
		return mav;
	}
	
	public ModelAndView memberList() {
		mav = new ModelAndView();
		
		List<MemberDTO> memberList = mdao.memberList();
		
		mav.addObject("memberList", memberList);
		mav.setViewName("memberlist");
		
		return mav;
	}
	
	public ModelAndView memberView(String mid) {
		mav = new ModelAndView();
		MemberDTO member = mdao.memberView(mid);
		
		mav.addObject("memberView", member);
		mav.setViewName("memberview");
		
		return mav;
	}
	
	public ModelAndView memberDelete(String mid) {
		mav = new ModelAndView();
		mdao.memberDelete(mid);
		
		mav.setViewName("redirect:/memberlist");
		return mav;
	}
	
	public MemberDTO memberViewAjax(String mid) {
		MemberDTO member = mdao.memberView(mid);
		return member;
	}
	
	public ModelAndView memberUpdate() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginMember");
		MemberDTO memberUpdate = mdao.memberUpdate(loginId);
		
		mav.addObject("member", memberUpdate);
		mav.setViewName("memberupdate");
		
		return mav;
	}

	public ModelAndView memberUpdateProcess(MemberDTO member) {
		mav = new ModelAndView();
		
		int updateResult = mdao.memberUpdateProcess(member);
		
		if(updateResult>0) {
			mav.setViewName("mypage");
		} else {
			mav.setViewName("updatefail");
		}
		
		return mav;
	}
	
}
