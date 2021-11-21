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

	@GetMapping("/login")
	public void memberLogin() {
			
	}
	
	@GetMapping("/signUp")
	public void memberSignUp() {
			
	}
	@GetMapping("/jusoPopup")
	public void jusoPopup() {}

	@GetMapping("/profile")
	public String memberDetail(Authentication authentication, Model model) {
		try {
			// 1. SecurityContextHolder로 부터 가져오기
			Member principal = (Member) authentication.getPrincipal();
			model.addAttribute("loginMember", principal);
			log.debug("authentication = {}", authentication);
			log.debug("principal = {}", principal);
			return "member/profile";
		} catch (Exception e) {
			throw e;
		}
	}
	
		
	
}
