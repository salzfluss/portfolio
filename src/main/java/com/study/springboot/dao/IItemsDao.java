
package com.study.springboot.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ItemsDto;



@Mapper
public interface IItemsDao {
	
	
	public List<ItemsDto> list();
	public List<ItemsDto> listPageDao(String start, String end);
	public int item_delete(String item_idx);
	public ItemsDto item_correction(String item_idx);
	public int itemsUpdate(String item_idx, String item_category, String item_name, String item_price, String item_option,   String item_MainImg, String item_img, String item_content);
	public int itemsRegisterForm(ItemsDto dto);
	
	public ItemsDto itemsContent(String item_idx);
	
	public List<ItemsDto> bestList();
	public List<ItemsDto> newList();
	public List<ItemsDto> ringList();
	public List<ItemsDto> necklaceList();
	public List<ItemsDto> braceletList();
	public List<ItemsDto> earringsList();
	
	public int write( String item_category, String item_name, String item_price, String item_option,
			String item_MainImg, String item_img, String item_content);
	public ItemsDto InfoCheckView(String item_idx);
	

}

