package com.at.spring.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.at.spring.message.model.service.MessageService;
import com.at.spring.message.model.vo.Message;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/message")
public class MessageRestController {

	@Autowired
	private MessageService messageService;

	@GetMapping("/messageList")
	public List<Message> messageList(@RequestParam String id) {
		try {
			log.debug("id {}", id);
			List<Message> messageList = messageService.messageList(id);
			log.debug("messageList {}", messageList);
			return messageList;
		} catch (Exception e) {
			throw e;
		}

	}
	@GetMapping("/messageDetail/{no}")
	public Message messageDetail(@PathVariable int no) {
		try {
			
			Message message = messageService.selectOneMessage(no);
			return message;
		}catch (Exception e) {
			throw e;
		}
	}
	
	@PostMapping("/messageEnroll")
	public int messageEnroll(@RequestBody Message message) {
		try {
			int result = messageService.messageEnroll(message);
			
			return result;
		}catch (Exception e) {
			throw e;
		}
	}

}
