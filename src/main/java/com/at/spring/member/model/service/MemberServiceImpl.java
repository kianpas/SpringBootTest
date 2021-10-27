package com.at.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.spring.member.model.dao.MemberDao;
import com.at.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public int insertMember(Member member) {
	
		return memberDao.insertMember(member);
	}

	@Override
	public int insertRole(String id) {
		
		return memberDao.insertRole(id);
	}
	
	
	
}
