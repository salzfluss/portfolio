package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ItemsQnADto;



@Mapper
public interface IItemsQnADao {
	
	public List<ItemsQnADto> items_qna_list(String item_idx);
	public ItemsQnADto itemQnAview(String items_qna_idx);
	public int itemsQnAForm(ItemsQnADto items_qna_dto);
	public int itemsQnAUpdate(String items_qna_idx, String items_qna_title, String items_qna_name, String items_qna_password, String items_qna_secret, String items_qna_content);
	

}
