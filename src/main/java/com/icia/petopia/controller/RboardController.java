package com.icia.petopia.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.petopia.dto.RboardDTO;
import com.icia.petopia.service.RboardService;

@Controller
public class RboardController {

	@Autowired
	private RboardService rbs;
	
	private ModelAndView mav;
	
	@RequestMapping(value = "/rblist")
	public ModelAndView rbList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = rbs.rbList(page);
		return mav;
	}
	
	@RequestMapping(value = "/rbwritepage")
	public String rbWritePage() {
		return "rbwrite";
	}
	
	@RequestMapping(value = "/rbwrite")
	public ModelAndView rbWrite(@ModelAttribute RboardDTO rboard) throws IllegalStateException, IOException {
		mav = rbs.boardWrite(rboard);
		return mav;
	}
	
	@RequestMapping(value = "/rbview")
	public ModelAndView rbView(@RequestParam("rbnumber") int rbnumber,
			@RequestParam(value="page", required=false, defaultValue="1") int page) {
		mav = rbs.rbView(rbnumber, page);
		return mav;
	}
	
	@RequestMapping(value = "/rbupdate")
	public ModelAndView rbUpdate(@RequestParam("rbnumber") int rbnumber) {
		mav = rbs.rbUpdate(rbnumber);
		
		return mav;
	}
	
	@RequestMapping(value = "/rbupdateprocess")
	public ModelAndView boardUpdateProcess(@ModelAttribute RboardDTO rboard) {
		mav = rbs.rbUpdateProcess(rboard);
		
		return mav;
	}
	
	@RequestMapping(value = "/rbdelete")
	public ModelAndView rbDelete(@RequestParam("rbnumber") int rbnumber) {
		mav = rbs.rbDelete(rbnumber);
		
		return mav;
	}
	
}
