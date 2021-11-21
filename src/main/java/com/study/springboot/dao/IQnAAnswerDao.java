package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.QnAAnswerDto;


@Mapper
public interface IQnAAnswerDao {
	
	public List<QnAAnswerDto> qna_answer_list(String items_qna_idx);
	public int qna_answer_form(QnAAnswerDto qna_answer_dto);
	
	public int qna_answer_delete(String qna_answer_idx);

}
