package com.at.spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.at.spring.board.model.service.BoardService;
import com.at.spring.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
public class BoardController {

	
	@GetMapping("/boardList")
	public String boardList() {
		
		return "board/boardList";
	}
	
	@GetMapping("/boardForm")
	public String boardForm() {
		
		return "board/boardForm";
	}
	
	@GetMapping("/boardView/{no}")
	public String boardDetail() {
		
		return "board/boardView";
	}
	
	@GetMapping("/boardUpdate/{no}")
	public String boardUpdate() {
		
		return "board/boardUpdate";
	}
}
