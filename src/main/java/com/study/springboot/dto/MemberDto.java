package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDto {

	public int member_idx;
	public String member_id;
	public String member_pw;
	public String member_name;
	public String member_email1;
	public String member_email2;
	public String member_phone;
	public String member_address1;
	public String member_gender;
	public String member_birthdate;
	public Date member_joindate;
	public String member_postcode;
	public String member_address2;
	
	public MemberDto() {
		
	}

	public MemberDto(int member_idx, String member_id, String member_pw, String member_name, String member_email1,
			String member_email2, String member_phone, String member_address1, String member_gender,
			String member_birthdate, Date member_joindate, String member_postcode, String member_address2) {
		super();
		this.member_idx = member_idx;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_email1 = member_email1;
		this.member_email2 = member_email2;
		this.member_phone = member_phone;
		this.member_address1 = member_address1;
		this.member_gender = member_gender;
		this.member_birthdate = member_birthdate;
		this.member_joindate = member_joindate;
		this.member_postcode = member_postcode;
		this.member_address2 = member_address2;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email1() {
		return member_email1;
	}

	public void setMember_email1(String member_email1) {
		this.member_email1 = member_email1;
	}

	public String getMember_email2() {
		return member_email2;
	}

	public void setMember_email2(String member_email2) {
		this.member_email2 = member_email2;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_address1() {
		return member_address1;
	}

	public void setMember_address1(String member_address1) {
		this.member_address1 = member_address1;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_birthdate() {
		return member_birthdate;
	}

	public void setMember_birthdate(String member_birthdate) {
		this.member_birthdate = member_birthdate;
	}

	public Date getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(Date member_joindate) {
		this.member_joindate = member_joindate;
	}

	public String getMember_postcode() {
		return member_postcode;
	}

	public void setMember_postcode(String member_postcode) {
		this.member_postcode = member_postcode;
	}

	public String getMember_address2() {
		return member_address2;
	}

	public void setMember_address2(String member_address2) {
		this.member_address2 = member_address2;
	}
	
	

	
	
	
}
