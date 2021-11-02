package com.at.spring.comment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.at.spring.comment.model.vo.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Comment> commentList(int no) {
		
		return session.selectList("comment.commentList", no);
	}

	@Override
	public int commentEnroll(Comment comment) {
		
		return session.insert("comment.commentEnroll", comment);
	}
	
	
}
