package com.at.spring.comment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Comment {
	
	private int no;
	private int boardNo;
	private String memberId;
	private String content;
	private Date regDate;
	private String name;
}
