package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Component
public class MemberService {

	@Autowired
	private IMemberDao memberDao;
	
	// 로그인
	public int loginMember(String member_id, String member_pw) {
		
		int result = 0;
		
		int count = memberDao.loginMember(member_id, member_pw);
		
		if( count > 0 ) {
			result = 1;
		}
		
		return result;
	}
	
	// 회원가입
	public int join(String member_id,
					String member_email1,
					String member_email2,
					String member_name,
					String member_pw,
					String member_phone1,
					String member_phone2,
					String member_phone3,
					String member_postcode,
					String member_address1,
					String member_address2,
					String member_birthdate,
					String member_gender ) {
		
		int result = 0;
		
		MemberDto joinDto = new MemberDto();
		joinDto.setMember_id(member_id);
		joinDto.setMember_email1(member_email1);
		joinDto.setMember_email2(member_email2);
		joinDto.setMember_name(member_name);
		joinDto.setMember_pw(member_pw);
		joinDto.setMember_phone(member_phone1 + member_phone2 + member_phone3);
		joinDto.setMember_postcode(member_postcode);
		joinDto.setMember_address1(member_address1);
		joinDto.setMember_address2(member_address2);
		joinDto.setMember_birthdate(member_birthdate);
		joinDto.setMember_gender(member_gender);
		
		try {
			
			result = memberDao.joinMember( joinDto );
			System.out.println("result : " + result);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 아이디 중복 확인
	public int idCheckAjax(String member_id) {
		int result = 0;
		try 
		{
			result = memberDao.idCheck(member_id);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}
	
	// 아이디 찾기
	public String FindId(String member_name, String member_email1, String member_email2) {
		
		int result = 0 ;
		
		List<MemberDto> findIdList = memberDao.FindId(member_name, member_email1, member_email2);
		if( findIdList != null ) {
			if( findIdList.size() > 0 ) {
				return findIdList.get(0).getMember_id();
			}
		}
		
		return "";
	}
	
	// 비밀번호 찾기
	public String FindPw(String member_name, String member_id, String member_email1, String member_email2) {
		
		int result = 0;
		
		List<MemberDto> findPwList = memberDao.FindPw(member_name, member_id, member_email1, member_email2);
		if( findPwList != null ) {
			if( findPwList.size() > 0 ) {
				return findPwList.get(0).getMember_pw();
			}
		}
		
		return "";
	}
	
	// 마이페이지 비밀번호 확인
	public int myInfoCheck(String member_id, String member_pw) {
		
		int result = 0;
		
		int count = memberDao.myInfoCheck(member_id, member_pw);
		
		if( count > 0 ) {
			result = 1;
		}
		
		return result;
	}
	
	// 이메일 중복 확인
	public int emailCheckAjax(String member_email1, String member_email2) {
		
		int result = 0;
		
		try 
		{
			result = memberDao.emailCheck(member_email1, member_email2);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
}
