package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class One2oneDto {
	
	private int one2one_idx;
	private String one2one_category;
	private String one2one_img;
	private String one2one_name;
	private String one2one_pw;
	private String one2one_title;
	private String one2one_content;
	private Date one2one_date;
	
	
	public One2oneDto()	{}


	public One2oneDto(int one2one_idx, String one2one_category, String one2one_img, String one2one_name,
			String one2one_pw, String one2one_title, String one2one_content, Date one2one_date) {
		super();
		this.one2one_idx = one2one_idx;
		this.one2one_category = one2one_category;
		this.one2one_img = one2one_img;
		this.one2one_name = one2one_name;
		this.one2one_pw = one2one_pw;
		this.one2one_title = one2one_title;
		this.one2one_content = one2one_content;
		this.one2one_date = one2one_date;
	}


	public int getOne2one_idx() {
		return one2one_idx;
	}


	public void setOne2one_idx(int one2one_idx) {
		this.one2one_idx = one2one_idx;
	}


	public String getOne2one_category() {
		return one2one_category;
	}


	public void setOne2one_category(String one2one_category) {
		this.one2one_category = one2one_category;
	}


	public String getOne2one_img() {
		return one2one_img;
	}


	public void setOne2one_img(String one2one_img) {
		this.one2one_img = one2one_img;
	}


	public String getOne2one_name() {
		return one2one_name;
	}


	public void setOne2one_name(String one2one_name) {
		this.one2one_name = one2one_name;
	}


	public String getOne2one_pw() {
		return one2one_pw;
	}


	public void setOne2one_pw(String one2one_pw) {
		this.one2one_pw = one2one_pw;
	}


	public String getOne2one_title() {
		return one2one_title;
	}


	public void setOne2one_title(String one2one_title) {
		this.one2one_title = one2one_title;
	}


	public String getOne2one_content() {
		return one2one_content;
	}


	public void setOne2one_content(String one2one_content) {
		this.one2one_content = one2one_content;
	}


	public Date getOne2one_date() {
		return one2one_date;
	}


	public void setOne2one_date(Date one2one_date) {
		this.one2one_date = one2one_date;
	}

	
	
	
}
