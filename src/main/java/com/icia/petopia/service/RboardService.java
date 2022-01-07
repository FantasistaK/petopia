package com.icia.petopia.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.petopia.dto.PageDTO;
import com.icia.petopia.dao.RboardDAO;
import com.icia.petopia.dto.RboardDTO;

@Service
public class RboardService {

	@Autowired
	private RboardDAO rbdao;
	
	private ModelAndView mav;
	
	// 페이징 처리에 활용할 상수
	private static final int PAGE_LIMIT = 5; // 한페이지에 보여질 글 개수
	private static final int BLOCK_LIMIT = 5; // 한화면에 보여질 페이지 개수
	
	public ModelAndView rbList(int page) {
		mav = new ModelAndView();
		
		int listCount = rbdao.listCount();
		
		// 매개변수로 넘겨받은 page 변수값을 기준으로 현재 보여줘야 하는 게시글의 범위 계산
		int startRow = (page-1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		// page=1 일 때(1페이지 클릭) startRow = 1, endRow = 3
		// page=2 일 때(2페이지 클릭) startRow = 4, endRow = 6
		// page=3 일 때(3페이지 클릭) startRow = 7, endRow = 9
		
		// startRow, endRow 기준으로 boardlist 가져오기
		PageDTO paging = new PageDTO();
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		List<RboardDTO> rbList = rbdao.rbList(paging);
		
		// 필요한 페이지 계산
		// maxPage : 최대로 필요한 페이지 갯수
		// 글갯수 : 16개, 현페이지에 보여질 글갯수 : 3개 => maxPage=6
		// 3.9 => 4, 4.1 => 5
		int maxPage = (int)(Math.ceil((double)listCount / PAGE_LIMIT));
		// 페이지 번호에서 시작할 페이지의 번호
		// 1,4,7,10~~ (BLOCK_LIMIT=3 일때)
		// 1,6,11,16~~ (BLOCK_LIMIT=5 일때)
		// 1,11,21,31~~ (BLOCK_LIMIT=10 일때)
		int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		// 페이지 번호에서 마지막 페이지의 번호
		// 3,6,9,12~~ (BLOCK_LIMIT=3 일때)
		// 5,10,15,20~~ (BLOCK_LIMIT=5 일때)
		// 10,20,30,40~~ (BLOCK_LIMIT=10 일때)
		int endPage = startPage + BLOCK_LIMIT - 1;

		/* 계산결과 전체 페이지 갯수는 4개밖에 없는데
		 * BLOCK_LIMIT 5라면 endPage는 5의 값을 갖게 됨
		 * 그러면 5페이지는 클릭을 해봐야 나올 데이터도 없고 필요없는 페이지 번호임. 따라서 BLOCK_LIMIT이 5라고 하더라도
		 * 하단의 페이지 목록은 1,2,3,4 만 노출되면 되기 때문에 아래와 같은 식을 통해 endPage값을 조정.
		 */
				
		if(endPage > maxPage)
			endPage = maxPage;
		
		// 계산된 page 관련 값을 PageDTO 객체에 담음
		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		
		mav.addObject("paging", paging);
		mav.addObject("rbList", rbList);
		mav.setViewName("rblist");
		
		return mav;
	}

	public ModelAndView boardWrite(RboardDTO rboard) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		
		MultipartFile rbfile = rboard.getRbfile();
		String rbfilename = rbfile.getOriginalFilename();
		rbfilename = System.currentTimeMillis() + "-" + rbfilename;

		String savePath = "D:\\source_kbr\\spring\\petopia\\src\\main\\webapp\\resources\\upload\\"+rbfilename;
		if(!rbfile.isEmpty()) {
			rbfile.transferTo(new File(savePath));
		}
		
		rboard.setRbfilename(rbfilename);
		rbdao.rbWrite(rboard);
		
		mav.setViewName("redirect:/rblist");
		
		return mav;
	}

	public ModelAndView rbView(int rbnumber, int page) {
		mav = new ModelAndView();
		rbdao.rbHits(rbnumber);
		RboardDTO rbView = rbdao.rbView(rbnumber);
		
		mav.addObject("page", page);
		mav.addObject("rbView", rbView);
		mav.setViewName("rbview");
		
		return mav;
	}

	public ModelAndView rbUpdate(int rbnumber) {
		mav = new ModelAndView();
		
		RboardDTO rbUpdate = rbdao.rbView(rbnumber);
		
		mav.addObject("rbUpdate",rbUpdate);
		mav.setViewName("rbupdate");
		
		return mav;
	}

	public ModelAndView rbUpdateProcess(RboardDTO rboard) {
		mav = new ModelAndView();
		
		int updateResult = 0;
		updateResult = rbdao.rbUpdateProcess(rboard);
		if(updateResult > 0) {
			mav.setViewName("redirect:/rbview?rbnumber="+rboard.getRbnumber());
		} else {
			mav.setViewName("updatefail");
		}
		
		return mav;
	}

	public ModelAndView rbDelete(int rbnumber) {
		mav = new ModelAndView();
		rbdao.rbDelete(rbnumber); 
		
		mav.setViewName("redirect:/rblist");
		return mav;
	}
	
}
