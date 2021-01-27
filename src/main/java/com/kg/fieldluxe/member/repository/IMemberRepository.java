package com.kg.fieldluxe.member.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kg.fieldluxe.member.model.MemberVO;

public interface IMemberRepository {
	
	

	void insertMember(MemberVO mem);
	void insertAuth(@Param("email")String email, @Param("authority")String auth);
	void updateBan(MemberVO mem);
	void updateMember(MemberVO mem);
	void updateAuth(@Param("email")MemberVO mem);
	void deleteMember(String email);
	void deleteAuth(String email);
	String getPassword(@Param("email")String email);
	MemberVO getMember(@Param("email")String email);
	List<MemberVO> getMemberList(@Param("page")int page, @Param("word")String word);
	Integer getMemberCount(@Param("word")String word);
	Integer emailCheck(@Param("email")String email);
	Integer nickCheck(@Param("nickname")String nickname);
}
