package com.icia.petopia.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.petopia.dto.SboardDTO;
import com.icia.petopia.service.SboardService;

@Controller
public class SboardController {

	@Autowired
	private SboardService sbs;
	
	private ModelAndView mav;
	
	@RequestMapping(value = "/sblist")
	public ModelAndView sbList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = sbs.sbList(page);
		return mav;
	}
	
	@RequestMapping(value = "/sbwritepage")
	public String sbWritePage() {
		return "sbwrite";
	}
	
	@RequestMapping(value = "/sbwrite")
	public ModelAndView sbWrite(@ModelAttribute SboardDTO sboard) throws IllegalStateException, IOException {
		mav = sbs.boardWrite(sboard);
		return mav;
	}
	
	@RequestMapping(value = "/sbview")
	public ModelAndView sbView(@RequestParam("sbnumber") int sbnumber) {
		mav = sbs.sbView(sbnumber);
		
		return mav;
	}
	
	@RequestMapping(value = "/sblike")
	public ModelAndView sbLike(@RequestParam("sbnumber") int sbnumber) {
		mav = sbs.sbLike(sbnumber);
		
		return mav;
	}
	
	@RequestMapping(value = "/citycheck")
	public ModelAndView cityCheck(@RequestParam("add") String add,
								  @RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = sbs.cityCheck(add, page);
		
		return mav;
	}
	
}
