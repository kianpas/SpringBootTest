package com.at.spring.message.model.dao;

import java.util.List;

import com.at.spring.message.model.vo.Message;

public interface MessageDao {

	List<Message> messageList(String id);

	Message selectOneMessage(int no);

	int messageEnroll(Message message);
	
	
}
