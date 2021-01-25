package com.kg.fieldluxe.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kg.fieldluxe.member.repository.IMemberRepository;

@Service
public class MemberService {
	
	@Autowired
	private IMemberRepository repository;
	
	

}
