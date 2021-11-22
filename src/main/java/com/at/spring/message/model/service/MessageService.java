package com.at.spring.message.model.service;

import java.util.List;

import com.at.spring.message.model.vo.Message;


public interface MessageService {

	 List<Message> messageList(String id);

	Message selectOneMessage(int no);

	int messageEnroll(Message message); 
	
	

}
