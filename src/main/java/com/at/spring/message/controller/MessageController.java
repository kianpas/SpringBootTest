package com.at.spring.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@GetMapping("/messagePage")
	public void messagePage() {
		
	};
	
	@GetMapping("/messageView/{no}")
	public String messageView() {
		
		return "/message/messageView";
	};
	
	@GetMapping("/messageForm")
	public void messageForm() {
		
	}

}
