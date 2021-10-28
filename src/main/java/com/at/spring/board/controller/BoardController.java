package com.at.spring.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@GetMapping("/boardList")
	public void boardList() {
	
	}
	
	@GetMapping("/boardForm")
	public void boardForm() {

	}
	
	@GetMapping("/boardView/{no}")
	public String boardView() {
		
		return "/board/boardView";
	}
	
	@GetMapping("/boardUpdate/{no}")
	public String boardUpdate() {

		return "/board/boardUpdate";
	}

}
	


	
