package com.icia.petopia.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.petopia.dao.SboardDAO;
import com.icia.petopia.dto.PageDTO;
import com.icia.petopia.dto.SboardDTO;

@Service
public class SboardService {

	@Autowired
	private SboardDAO sbdao;
	
	private ModelAndView mav;
	
	// 페이징 처리에 활용할 상수
	private static final int PAGE_LIMIT = 3; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 5; // 한화면에 보여질 페이지 개수

	public ModelAndView boardWrite(SboardDTO sboard) throws IllegalStateException, IOException {

		mav = new ModelAndView();
		
		MultipartFile sbfile = sboard.getSbfile();
		String sbfilename = sbfile.getOriginalFilename();
		sbfilename = System.currentTimeMillis() + "-" + sbfilename;
		
		String savePath = "D:\\source_kbr\\spring\\petopia\\src\\main\\webapp\\resources\\upload\\"+sbfilename;
		if(!sbfile.isEmpty()) {
			sbfile.transferTo(new File(savePath));
		}
		
		sboard.setSbfilename(sbfilename);
		sbdao.sbWrite(sboard);
		
		mav.setViewName("redirect:/sblist");
		
		return mav;
	}
	
	public ModelAndView sbList(int page) {
		mav = new ModelAndView();
		
		int listCount = sbdao.listCount();
		
		int startRow = (page-1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		
		List<SboardDTO> sbList = sbdao.sbList(paging);
		
		int maxPage = (int)(Math.ceil((double)listCount / PAGE_LIMIT));
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		
		if(endPage > maxPage)
			endPage = maxPage;
		
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		mav.addObject("paging", paging);
		mav.addObject("sbList", sbList);
		mav.setViewName("sblist");
		
		return mav;
		
	}

	public ModelAndView sbView(int sbnumber) {
		mav = new ModelAndView();
		sbdao.sbHits(sbnumber);
		SboardDTO sbView = sbdao.sbView(sbnumber);
		
		mav.addObject("sbView", sbView);
		mav.setViewName("sbview");
		
		return mav;
	}

	public ModelAndView sbLike(int sbnumber) {
		mav = new ModelAndView();
		sbdao.sbLike(sbnumber);
		
		SboardDTO sbView = sbdao.sbView(sbnumber);
		
		mav.addObject("sbView", sbView);
		mav.setViewName("sbview");
		
		return mav;
	}

	public ModelAndView cityCheck(String add, int page) {
		mav = new ModelAndView();
		
		PageDTO paging = new PageDTO();
		paging.setPage(page);
		paging.setStartPage(1);
		paging.setEndPage(1);
		paging.setMaxPage(1);
		
		List<SboardDTO> sbList = sbdao.cityCheck(add);
		
		mav.addObject("paging", paging);
		mav.addObject("sbList", sbList);
		mav.setViewName("sblist");
		
		return mav;
	}
	
}
