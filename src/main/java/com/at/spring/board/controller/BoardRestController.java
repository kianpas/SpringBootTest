package com.at.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		try {
			List<Board> boardList = boardService.selectBoardList();
			// log.debug("boardList {}", boardList);

			return boardList;
		} catch (Exception e) {
			throw e;
		}

	}

	@GetMapping("/boardDetail/{no}")
	public Board boardDetail(@PathVariable int no) {
		try {
			log.debug("no {}", no);
			Board board = boardService.selectOneBoard(no);
			log.debug("board {}", board);

			return board;
		} catch (Exception e) {
			throw e;
		}
	}

	@PostMapping("/boardEnroll")
	public Map<String, Object> boardEnroll(@ModelAttribute Board board) {
		try {
			log.debug("board {}", board);
			int result = boardService.insertBoard(board);
			int boardNo = board.getNo();
			log.debug("enroll boardNo {}", boardNo);
			Map<String, Object> map = new HashMap<>();
			map.put("result", result);
			map.put("boardNo", boardNo);
			return map;
		} catch (Exception e) {
			throw e;
		}

	}

	@PutMapping("/boardUpdate/{no}")
	public int boardUpdate(@RequestBody Board board, @PathVariable int no) {
		try {
			log.debug("no {}", no);
			log.debug("board {}", board);
			int result = boardService.updateBoard(board);

			return result;
		} catch (Exception e) {
			throw e;
		}
	}

	@DeleteMapping("/boardDelete/{no}")
	public int boardDelete(@PathVariable int no) {
		try {
			log.debug("no {}", no);
			int result = boardService.deleteBoard(no);

			return result;
		} catch (Exception e) {
			throw e;
		}
	}
}