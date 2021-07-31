package com.at.spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.spring.board.model.service.BoardService;
import com.at.spring.board.model.vo.Board;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/board")
@Slf4j
public class BoardRestController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/selectBoardList")
	public List<Board> selectboardList() {
		List<Board> boardList = boardService.selectBoardList();
		log.debug("boardList {}", boardList);

		return boardList;
	}

	@GetMapping("/boardDetail/{no}")
	public Board boardDetail(@PathVariable int no) {
		log.debug("no {}", no);
		Board board = boardService.selectOneBoard(no);
		log.debug("board {}", board);

		return board;

	}

	@PostMapping("/boardEnroll")
	public String boardEnroll(@ModelAttribute Board board) {
		log.debug("board {}", board);
		int result = boardService.insertBoard(board);
		return "redirect:/board/boardDetail?no=" + board.getNo();

	}

	@PutMapping("/boardUpdate/{no}")
	public int boardUpdate(@RequestBody Board board, @PathVariable int no) {
		log.debug("no {}", no);
		log.debug("board {}", board);
		int result = boardService.updateBoard(board);

		return result;

	}
	
	@DeleteMapping("/boardDelete/{no}")
	public int boardDelete(@PathVariable int no) {
		log.debug("no {}", no);
		int result = boardService.deleteBoard(no);

		return result;

	}
}