package com.at.spring.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.at.spring.board.model.service.BoardService;
import com.at.spring.board.model.vo.Board;
import com.at.spring.board.model.vo.BoardExt;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/board")
@Slf4j
public class BoardRestController {

	@Autowired
	private BoardService boardService;



	@GetMapping("/selectBoardList")
	public List<Board> selectboardList() throws Exception  {
		try {
			List<Board> boardList = boardService.selectBoardList();
			String url = "https://api.odcloud.kr/api/gov24/v1/serviceList";
			String key = "";
			
			String serviceKey = URLDecoder.decode(key, "UTF-8");
			
			HttpHeaders headers = new HttpHeaders();
			//headers.add("serviceKey", serviceKey);
			
			String deKey = "";
			
			HttpEntity<?> headerEntity = new HttpEntity<>(headers);
			
			
			URI uri = UriComponentsBuilder.fromUriString(url).queryParam("serviceKey", deKey).build(true).toUri();
					
			
			
			log.debug("uri {}", uri);
			HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
			
			RestTemplate restTemplate = new RestTemplate(factory);
			
			//ResponseEntity<?> response = restTemplate.exchange(uri, HttpMethod.GET, headerEntity, String.class);
			ResponseEntity<?> response = restTemplate.getForEntity(uri, String.class);
			log.debug("response {}", response);
			return boardList;
		} catch (Exception e) {
			throw e;
		}

	}
	
	//인덱스화면
	@GetMapping("/indexBoardList")
	public List<Board> indexBoardList() {
		try {
			List<Board> indexBoardList = boardService.indexBoardList();
			// log.debug("boardList {}", boardList);

			return indexBoardList;
		} catch (Exception e) {
			throw e;
		}

	}

	@GetMapping("/boardDetail/{no}")
	public BoardExt boardDetail(@PathVariable int no) {
		try {
			log.debug("no {}", no);
			BoardExt board = boardService.selectOneBoard(no);
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