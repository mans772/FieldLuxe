package com.kg.fieldluxe.member.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kg.fieldluxe.member.model.MemberVO;
import com.kg.fieldluxe.member.repository.IMemberRepository;

@Service
public class MemberService implements IMemberService{
	
	@Autowired
	@Qualifier("IMemberRepository")
	IMemberRepository memberRepository;

	
	// 회원가입
	@Transactional("txManager")
	public void insertMember(MemberVO mem) {
		memberRepository.insertMember(mem);
		memberRepository.insertAuth(mem.getEmail(), "ROLE_USER");
	}

	// 유저 활성화, 비활성화 변경
	public void updateBan(MemberVO mem) {
		memberRepository.updateBan(mem);
	}

	// 유저 정보 변경
	public void updateMember(MemberVO mem) {
		memberRepository.updateMember(mem);
	}

	// 유저 정보 삭제
	@Transactional("txManager")
	public void deleteMember(String email) {
		memberRepository.deleteAuth(email);
		memberRepository.deleteMember(email);
	}

	// 권한 삭제 (유저 정보 삭제를 위함)
	public void deleteAuth(String email) {
		memberRepository.deleteAuth(email);
	}

	// 비밀번호 확인
	public String getPassword(String email) {
		return memberRepository.getPassword(email);
	}

	// 유저 정보 확인
	public MemberVO getMember(String email) {
		return memberRepository.getMember(email);
	}

	// 유저 리스트 확인
	public List<MemberVO> getMemberList(int page, String word) {
		return memberRepository.getMemberList(page, word);
	}

	// 유저 수 확인
	public Integer getMemberCount(String word) {
		return memberRepository.getMemberCount(word);
	}

	// 이메일 중복체크
	public Integer emailCheck(String email) {
		return memberRepository.emailCheck(email);
	}

	// 닉네임 중복체크
	public Integer nickCheck(String nickname) {
		return memberRepository.nickCheck(nickname);
	}


}
