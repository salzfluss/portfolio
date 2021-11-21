package com.study.springboot.dto;

import java.util.Date;

public class One2oneReplyDto {
	
	
	private int one2one_reply_idx;
	private String one2one_reply_name;
	private String one2one_reply_title;
	private String one2one_reply_content;
	private Date one2one_reply_date;
	
	
	public One2oneReplyDto(){ 
		
	}


	public One2oneReplyDto(int one2one_reply_idx, String one2one_reply_name, String one2one_reply_title,
			String one2one_reply_content, Date one2one_reply_date) {
		super();
		this.one2one_reply_idx = one2one_reply_idx;
		this.one2one_reply_name = one2one_reply_name;
		this.one2one_reply_title = one2one_reply_title;
		this.one2one_reply_content = one2one_reply_content;
		this.one2one_reply_date = one2one_reply_date;
	}


	public int getOne2one_reply_idx() {
		return one2one_reply_idx;
	}


	public void setOne2one_reply_idx(int one2one_reply_idx) {
		this.one2one_reply_idx = one2one_reply_idx;
	}


	public String getOne2one_reply_name() {
		return one2one_reply_name;
	}


	public void setOne2one_reply_name(String one2one_reply_name) {
		this.one2one_reply_name = one2one_reply_name;
	}


	public String getOne2one_reply_title() {
		return one2one_reply_title;
	}


	public void setOne2one_reply_title(String one2one_reply_title) {
		this.one2one_reply_title = one2one_reply_title;
	}


	public String getOne2one_reply_content() {
		return one2one_reply_content;
	}


	public void setOne2one_reply_content(String one2one_reply_content) {
		this.one2one_reply_content = one2one_reply_content;
	}


	public Date getOne2one_reply_date() {
		return one2one_reply_date;
	}


	public void setOne2one_reply_date(Date one2one_reply_date) {
		this.one2one_reply_date = one2one_reply_date;
	}

	
	
	
	
}
