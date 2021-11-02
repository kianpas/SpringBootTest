package com.at.spring.comment.model.service;

import java.util.List;


import com.at.spring.comment.model.vo.Comment;

public interface CommentService {

	List<Comment> commentList(int no);

	int commentEnroll(Comment comment);

}
