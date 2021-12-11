package com.at.spring;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.at.spring.board.model.dao.BoardDao;
import com.at.spring.board.model.service.BoardService;

@SpringBootTest
class SpringbootTestApplicationTests {

	@Test
	void contextLoads() {
	}
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BoardDao boardDao;

}
