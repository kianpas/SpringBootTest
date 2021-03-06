package com.at.spring.member.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.at.spring.member.model.service.MemberService;
import com.at.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/member")
@Slf4j
public class MemberRestController {

	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;


	@PostMapping("/insertMember")
	public int insertMember(@RequestBody Member member) {

		try {
			log.debug("member = {}", member);

			String rawPassword = member.getPassword();
			String encodedPassword = bCryptPasswordEncoder.encode(rawPassword);
			member.setPassword(encodedPassword);

			int result = memberService.insertMember(member);
			result = memberService.insertRole(member.getId());
			return result;
		} catch (Exception e) {
			throw e;
		}
	}

	@PutMapping("/updateMember")
	public int updateMember(@RequestBody Member member, Authentication authentication) {
		log.debug("member = {}", member);

		int result = memberService.updateMember(member);
		
		//??????????????? ???????????? ??????
		member.setPassword(((Member) authentication.getPrincipal()).getPassword());
		
		//??????????????? ?????? ????????????
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

		//????????? ?????? ????????? ??????
		List<SimpleGrantedAuthority> newAuthorites = new ArrayList<>();

		//????????? ?????? ???????????? ??????????????? ?????? ??????
		for (GrantedAuthority auth : authorities) {
			SimpleGrantedAuthority simpleAuth = new SimpleGrantedAuthority(auth.getAuthority());
			newAuthorites.add(simpleAuth);
		}
		
		//????????? ????????? ??????
		member.setAuthorities(newAuthorites);

		
		//????????? ?????? ?????? ??????, ??????????????? ??????????????? ?????? ?????? ???????????????
		Authentication newAuth = new UsernamePasswordAuthenticationToken(member, authentication.getCredentials(),
				authentication.getAuthorities());

		SecurityContextHolder.getContext().setAuthentication(newAuth);

		return result;
	}

	@GetMapping("/idCheckDuplicate")
	public Map<String, Object> idCheckDuplicate(@RequestParam String id) {

		try {
			log.debug("id = {}", id);
			Member member = memberService.idCheckDuplicate(id);
			log.debug("member = {}", member);
			Boolean available = member != null ? false : true;

			Map<String, Object> map = new HashMap<>();
			map.put("id", id);
			map.put("available", available);
			return map;

		} catch (Exception e) {
			throw e;
		}
	}
}
