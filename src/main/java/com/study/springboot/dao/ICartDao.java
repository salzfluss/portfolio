package com.study.springboot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.cartDto;


@Mapper
public interface ICartDao {
	
	public List<cartDto> list();
	
	public List<cartDto> cartlist(String cart_member_id);
	
	cartDto viewDao(String cart_item_idx);
	
	public int delete(String cart_item_idx);
	
	public int write( String cart_member_id, String cart_item_category, String cart_item_name, String cart_item_price, String cart_item_amount,
			String cart_item_img, String cart_item_content );
	
	public cartDto itemsContent(String cart_item_idx);
	
	public int modify( String cart_item_idx, String item_amount);


}
