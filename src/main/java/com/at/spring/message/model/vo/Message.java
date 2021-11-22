package com.at.spring.message.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Message {
	
	private int no;
	private String receiverId;
	private String senderId;
	private String senderName;
	private String content;
	private Date regDate;
}
