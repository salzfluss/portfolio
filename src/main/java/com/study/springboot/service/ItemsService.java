package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.study.springboot.dao.IItemsDao;
import com.study.springboot.dto.ItemsDto;

@Component
public class ItemsService {

	@Autowired
	private IItemsDao itemsDao;
	
	public int itemsRegister(String item_category,
							String item_option,
							String item_name,
							String item_price,
							String item_MainImg,
							String item_img,
							String item_content) {
		
		int result = 0;
		
		ItemsDto registerDto = new ItemsDto();
		registerDto.setItem_category(item_category);
		registerDto.setItem_option(item_option);
		registerDto.setItem_name(item_name);
		registerDto.setItem_price(item_price);
		registerDto.setItem_MainImg(item_MainImg);
		registerDto.setItem_img(item_img);
		registerDto.setItem_content(item_content);
		
		try {
			
			result = itemsDao.itemsRegisterForm(registerDto);
			System.out.println("result : " + result);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
