package com.at.spring.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.at.spring.board.model.vo.Board;
import com.at.spring.board.model.vo.BoardExt;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Board> selectBoardList() {
		
		return session.selectList("board.selectBoardList");
	}
	
	@Override
	public List<Board> indexBoardList() {
		
		return session.selectList("board.indexBoardList");
	}

	@Override
	public BoardExt selectOneBoard(int no) {
		
		return session.selectOne("board.selectOneBoard", no);
	}

	@Override
	public int insertBoard(Board board) {
		
		return session.insert("board.insertBoard", board);
	}

	@Override
	public int updateBoard(Board board) {
		
		return session.update("board.updateBoard", board);
	}

	@Override
	public int deleteBoard(int no) {
		
		return session.delete("board.deleteBoard", no);
	}
	
	
	
}
