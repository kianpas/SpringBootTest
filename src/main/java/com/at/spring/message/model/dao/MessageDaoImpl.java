package com.at.spring.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.at.spring.message.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Message> messageList(String id) {
		
		return session.selectList("message.messageList", id);
	}

	@Override
	public Message selectOneMessage(int no) {
		
		return session.selectOne("message.selectOneMessage", no);
	}

	@Override
	public int messageEnroll(Message message) {
		
		return session.insert("message.messageEnroll", message);
	}
	
	
}
