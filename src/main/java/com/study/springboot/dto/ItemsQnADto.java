package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ItemsQnADto {
	private int items_qna_idx;
	private int items_qna_idx_fk;
	private String items_qna_title;
	private String items_qna_name;
	private String items_qna_password;
	private String items_qna_secret;
	private String items_qna_content;
	private Date items_qna_date;
	
	

	public ItemsQnADto() {
	}
	
	
	public ItemsQnADto(int items_qna_idx, int items_qna_idx_fk, String items_qna_title, String items_qna_name,
			String items_qna_password, String items_qna_secret, String items_qna_content, Date items_qna_date
			) {
		super();
		this.items_qna_idx = items_qna_idx;
		this.items_qna_idx_fk = items_qna_idx_fk;
		this.items_qna_title = items_qna_title;
		this.items_qna_name = items_qna_name;
		this.items_qna_password = items_qna_password;
		this.items_qna_secret = items_qna_secret;
		this.items_qna_content = items_qna_content;
		this.items_qna_date = items_qna_date;
	}


	public int getItems_qna_idx() {
		return items_qna_idx;
	}


	public void setItems_qna_idx(int items_qna_idx) {
		this.items_qna_idx = items_qna_idx;
	}


	public int getItems_qna_idx_fk() {
		return items_qna_idx_fk;
	}


	public void setItems_qna_idx_fk(int items_qna_idx_fk) {
		this.items_qna_idx_fk = items_qna_idx_fk;
	}


	public String getItems_qna_title() {
		return items_qna_title;
	}


	public void setItems_qna_title(String items_qna_title) {
		this.items_qna_title = items_qna_title;
	}


	public String getItems_qna_name() {
		return items_qna_name;
	}


	public void setItems_qna_name(String items_qna_name) {
		this.items_qna_name = items_qna_name;
	}


	public String getItems_qna_password() {
		return items_qna_password;
	}


	public void setItems_qna_password(String items_qna_password) {
		this.items_qna_password = items_qna_password;
	}


	public String getItems_qna_secret() {
		return items_qna_secret;
	}


	public void setItems_qna_secret(String items_qna_secret) {
		this.items_qna_secret = items_qna_secret;
	}


	public String getItems_qna_content() {
		return items_qna_content;
	}


	public void setItems_qna_content(String items_qna_content) {
		this.items_qna_content = items_qna_content;
	}


	public Date getItems_qna_date() {
		return items_qna_date;
	}


	public void setItems_qna_date(Date items_qna_date) {
		this.items_qna_date = items_qna_date;
	}
	
	

}
