package com.at.spring.comment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.spring.comment.model.dao.CommentDao;
import com.at.spring.comment.model.vo.Comment;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao commentDao;
	
	@Override
	public List<Comment> commentList(int no) {
		
		return commentDao.commentList(no);
	}

	@Override
	public int commentEnroll(Comment comment) {
		
		return commentDao.commentEnroll(comment);
	}

	
}
