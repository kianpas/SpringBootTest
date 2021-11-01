package com.at.spring.board.model.service;

import java.util.List;

import com.at.spring.board.model.vo.Board;
import com.at.spring.board.model.vo.BoardExt;

public interface BoardService {

	List<Board> selectBoardList();

	BoardExt selectOneBoard(int no);

	int insertBoard(Board board);

	int updateBoard(Board board);

	int deleteBoard(int no);

	List<Board> indexBoardList();

}
