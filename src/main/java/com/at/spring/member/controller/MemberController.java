package com.at.spring.member.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@GetMapping("/memberLogin")
	public void memberLogin() {

	}

	@GetMapping("/memberDetail")
	public String memberDetail(Authentication authentication, Model model) {
		try {
			// 1. SecurityContextHolder로 부터 가져오기
			Member principal = (Member) authentication.getPrincipal();
			model.addAttribute("loginMember", principal);
			log.debug("authentication = {}", authentication);
			log.debug("principal = {}", principal);
			return "member/memberDetail";
		} catch (Exception e) {
			throw e;
		}
	}
}
