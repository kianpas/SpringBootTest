package com.at.spring.member.model.dao;

import com.at.spring.member.model.vo.Member;

public interface MemberDao {

	int insertMember(Member member);

	int insertRole(String id);

}
