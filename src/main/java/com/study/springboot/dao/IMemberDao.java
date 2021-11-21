package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.MemberDto;

@Mapper
public interface IMemberDao {

	public List<MemberDto> list();
	
	public List<MemberDto> MemberList();
	public MemberDto MemberView(String member_idx);
	public int deleteMember(String member_idx);
	
	public int updateMember(String member_idx,
							String member_id,
							String member_pw,
							String member_name,
							String member_email1,
							String member_email2,
							String member_phone,
							String member_postcode,
							String member_address1,
							String member_address2,
							String member_gender);
	
	public int joinMember(MemberDto memberDto);
	
	public int loginMember(String member_id, String member_pw);
	public int idCheck(String member_id);
	
	public List<MemberDto> FindId(String member_name, String member_email1, String member_email2);
	public List<MemberDto> FindPw(String member_name, String member_id, String member_email1, String member_email2);
	
	public MemberDto MyInfoCheckView(String member_id);
	public int myInfoCheck(String member_id, String member_pw);
	
	public MemberDto MyInfoChangeView(String member_id);
	
	public int emailCheck(String member_email1, String member_email2);
}
