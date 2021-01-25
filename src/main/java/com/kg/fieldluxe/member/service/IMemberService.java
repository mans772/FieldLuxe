package com.kg.fieldluxe.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.member.model.MemberVO;

public interface IMemberService {

	void insertMember(MemberVO mem);
	void updateBan(MemberVO mem);
	void updateMember(MemberVO mem);
	void deleteMember(String email);
	void deleteAuth(String email);
	String getPassword(String email);
	MemberVO getMember(String email);
	List<MemberVO> getMemberList(int page, String word);
	Integer getMemberCount(String word);
	Integer emailCheck(String email);
	Integer nickCheck(String nickname);
}
