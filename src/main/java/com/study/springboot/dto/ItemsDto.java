package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ItemsDto {
	private int item_idx;
	private	String item_category;
	private String item_name;
	private String item_price;
	private String item_option;
	private String item_MainImg;
	private String item_img;
	private String item_content;
	private Date item_date;
	
	public ItemsDto() {
		
	}

	public ItemsDto(int item_idx, String item_category, String item_name, String item_price, String item_option,
			String item_MainImg, String item_img, String item_content, Date item_date) {
		super();
		this.item_idx = item_idx;
		this.item_category = item_category;
		this.item_name = item_name;
		this.item_price = item_price;
		this.item_option = item_option;
		this.item_MainImg = item_MainImg;
		this.item_img = item_img;
		this.item_content = item_content;
		this.item_date = item_date;
	}

	public int getItem_idx() {
		return item_idx;
	}

	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}

	public String getItem_category() {
		return item_category;
	}

	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_price() {
		return item_price;
	}

	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}

	public String getItem_option() {
		return item_option;
	}

	public void setItem_option(String item_option) {
		this.item_option = item_option;
	}

	public String getItem_MainImg() {
		return item_MainImg;
	}

	public void setItem_MainImg(String item_MainImg) {
		this.item_MainImg = item_MainImg;
	}

	public String getItem_img() {
		return item_img;
	}

	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}

	public String getItem_content() {
		return item_content;
	}

	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}

	public Date getItem_date() {
		return item_date;
	}

	public void setItem_date(Date item_date) {
		this.item_date = item_date;
	}
	
	
	
}
