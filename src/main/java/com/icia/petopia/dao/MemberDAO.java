package com.icia.petopia.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.petopia.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public void memberJoin(MemberDTO member) {
		sql.insert("mm.memberjoin", member);
	}

	public String idCheck(String mid) {
		return sql.selectOne("mm.idcheck", mid);
	}

	public String memberLogin(MemberDTO member) {
		return sql.selectOne("mm.memberlogin", member);
	}
	
	public List<MemberDTO> memberList() {
		return sql.selectList("mm.memberlist");
	}
	
	public MemberDTO memberView(String mid) {
		return sql.selectOne("mm.memberview", mid);
	}
	
	public void memberDelete(String mid) {
		sql.delete("mm.memberdelete", mid);
	}
	
	public MemberDTO memberUpdate(String loginId) {
		return sql.selectOne("mm.memberupdate", loginId);
	}

	public int memberUpdateProcess(MemberDTO member) {
		return sql.update("mm.memberupdateprocess", member);
	}
	
}
