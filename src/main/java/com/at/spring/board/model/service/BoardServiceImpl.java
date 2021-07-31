package com.at.spring.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.spring.board.model.dao.BoardDao;
import com.at.spring.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> selectBoardList() {

		return boardDao.selectBoardList();
	}

	@Override
	public Board selectOneBoard(int no) {
		
		return boardDao.selectOneBoard(no);
	}

	@Override
	public int insertBoard(Board board) {
		
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int no) {
		
		return boardDao.deleteBoard(no);
	}
	
	
}
