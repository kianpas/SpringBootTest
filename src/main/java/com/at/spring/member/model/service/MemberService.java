package com.at.spring.member.model.service;

import com.at.spring.member.model.vo.Member;


public interface MemberService {

	int insertMember(Member member);

	int insertRole(String id);

	
}
