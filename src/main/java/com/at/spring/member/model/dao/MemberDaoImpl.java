package com.at.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.at.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertMember(Member member) {
		
		return session.insert("member.insertMember", member);
	}

	@Override
	public int insertRole(String id) {
		
		return session.insert("member.insertRole", id);
	}

	
	
}
