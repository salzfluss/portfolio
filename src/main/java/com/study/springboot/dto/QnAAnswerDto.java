package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnAAnswerDto {
	private int qna_answer_idx;
	private int qna_answer_idx_fk;
	private String qna_answer_name;
	private String qna_answer_content;
	private String qna_answer_state;
	private Date qna_answer_date;
	
	public QnAAnswerDto() {
	}
	
	public QnAAnswerDto(int qna_answer_idx, int qna_answer_idx_fk, String qna_answer_name, String qna_answer_content,
			String qna_answer_state, Date qna_answer_date) {
		super();
		this.qna_answer_idx = qna_answer_idx;
		this.qna_answer_idx_fk = qna_answer_idx_fk;
		this.qna_answer_name = qna_answer_name;
		this.qna_answer_content = qna_answer_content;
		this.qna_answer_state = qna_answer_state;
		this.qna_answer_date = qna_answer_date;
	}

	public int getQna_answer_idx() {
		return qna_answer_idx;
	}

	public void setQna_answer_idx(int qna_answer_idx) {
		this.qna_answer_idx = qna_answer_idx;
	}

	public int getQna_answer_idx_fk() {
		return qna_answer_idx_fk;
	}

	public void setQna_answer_idx_fk(int qna_answer_idx_fk) {
		this.qna_answer_idx_fk = qna_answer_idx_fk;
	}

	public String getQna_answer_name() {
		return qna_answer_name;
	}

	public void setQna_answer_name(String qna_answer_name) {
		this.qna_answer_name = qna_answer_name;
	}

	public String getQna_answer_content() {
		return qna_answer_content;
	}

	public void setQna_answer_content(String qna_answer_content) {
		this.qna_answer_content = qna_answer_content;
	}

	public String getQna_answer_state() {
		return qna_answer_state;
	}

	public void setQna_answer_state(String qna_answer_state) {
		this.qna_answer_state = qna_answer_state;
	}

	public Date getQna_answer_date() {
		return qna_answer_date;
	}

	public void setQna_answer_date(Date qna_answer_date) {
		this.qna_answer_date = qna_answer_date;
	}


	
	
	
}
