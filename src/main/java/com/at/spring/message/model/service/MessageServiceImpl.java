package com.at.spring.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.spring.message.model.dao.MessageDao;
import com.at.spring.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;
	
	@Override
	public List<Message> messageList(String id) {
		
		return messageDao.messageList(id);
	}

	@Override
	public Message selectOneMessage(int no) {
		
		return messageDao.selectOneMessage(no);
	}

	@Override
	public int messageEnroll(Message message) {
		
		return messageDao.messageEnroll(message);
	}
		
	

}
