package com.icia.petopia.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.petopia.dto.PageDTO;
import com.icia.petopia.dto.SboardDTO;

@Repository
public class SboardDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void sbWrite(SboardDTO sboard) {
		sql.insert("sbm.sbwrite", sboard);
	}

	public List<SboardDTO> sbList(PageDTO paging) {
		return sql.selectList("sbm.sblist", paging);
	}
	
	public void sbHits(int sbnumber) {
		sql.update("sbm.sbhits", sbnumber);
	}

	public SboardDTO sbView(int sbnumber) {
		return sql.selectOne("sbm.sbview", sbnumber);
	}

	public int listCount() {
		return sql.selectOne("sbm.listcount");
	}

	public void sbLike(int sbnumber) {
		sql.update("sbm.sblike", sbnumber);
		
	}

	public List<SboardDTO> cityCheck(String add) {
		return sql.selectList("sbm.citycheck", add);
	}

}
