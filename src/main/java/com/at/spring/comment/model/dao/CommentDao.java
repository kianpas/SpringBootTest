package com.at.spring.comment.model.dao;

import java.util.List;

import com.at.spring.comment.model.vo.Comment;

public interface CommentDao {

	List<Comment> commentList(int no);

	int commentEnroll(Comment comment);

}
