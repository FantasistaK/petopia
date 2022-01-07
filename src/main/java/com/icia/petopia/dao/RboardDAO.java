package com.icia.petopia.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.petopia.dto.PageDTO;
import com.icia.petopia.dto.RboardDTO;

@Repository
public class RboardDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public List<RboardDTO> rbList(PageDTO paging) {
		return sql.selectList("rbm.rblist", paging);
	}
	
	public int listCount() {
		return sql.selectOne("rbm.listcount");
	}

	public void rbWrite(RboardDTO rboard) {
		sql.insert("rbm.rbwrite", rboard);
	}

	public void rbHits(int rbnumber) {
		sql.update("rbm.rbhits", rbnumber);
	}

	public RboardDTO rbView(int rbnumber) {
		return sql.selectOne("rbm.rbview", rbnumber);
	}

	public int rbUpdateProcess(RboardDTO rboard) {
		return sql.update("rbm.rbupdateprocess", rboard);
	}

	public void rbDelete(int rbnumber) {
		sql.delete("rbm.rbdelete", rbnumber);
	}
	
	

}
