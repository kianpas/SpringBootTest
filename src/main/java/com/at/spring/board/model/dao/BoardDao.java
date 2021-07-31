package com.at.spring.board.model.dao;

import java.util.List;

import com.at.spring.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList();

	Board selectOneBoard(int no);

	int insertBoard(Board board);

	int updateBoard(Board board);

	int deleteBoard(int no);

}
