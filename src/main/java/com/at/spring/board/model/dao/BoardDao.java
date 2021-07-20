package com.at.spring.board.model.dao;

import java.util.List;

import com.at.spring.board.model.vo.Board;

public interface BoardDao {

	List<Board> selectBoardList();

}
