package com.at.spring.security.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.at.spring.security.model.dao.SecurityDao;

import lombok.extern.slf4j.Slf4j;



@Service
@Slf4j
public class SecurityServiceImpl implements SecurityService {
	
	@Autowired
	private SecurityDao securityDao;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		log.debug("id = {}", id);
		UserDetails member = securityDao.loadUserByUsername(id);
		log.debug("member = {}", member);
		if(member == null) {
			throw new UsernameNotFoundException(id);
		}
		return member;
	}
	
	
}
