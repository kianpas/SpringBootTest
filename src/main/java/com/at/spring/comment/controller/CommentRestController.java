package com.at.spring.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.at.spring.comment.model.service.CommentService;
import com.at.spring.comment.model.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/comment")
@Slf4j
public class CommentRestController {
	
	@Autowired
	CommentService commentService;
	
	@GetMapping("/commentList")
	public List<Comment> commentList (@RequestParam int no){
		log.debug("no = {}", no);
		List<Comment> commentList = commentService.commentList(no);
		log.debug("commentList = {}", commentList);
		
		return commentList;
		
	}
	
	@PostMapping("/commentEnroll")
	public int commentEnroll (@RequestBody Comment comment) {
		log.debug("comment = {}", comment);
		int result = commentService.commentEnroll(comment);
		return result;
	}
}
