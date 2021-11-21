package com.study.springboot.dto;

public class cartDto {

	private int cart_item_idx;
	private String cart_member_id;
	private String cart_item_category;
	private String cart_item_name;
	private String cart_item_price;
	private String cart_item_amount;
	private String cart_item_img;
	private String cart_item_content;
	
	
	public cartDto() {}


	public cartDto(int cart_item_idx, String cart_member_id, String cart_item_category, String cart_item_name, String cart_item_price,
			String cart_item_amount, String cart_item_img, String cart_item_content) {
		super();
		this.cart_item_idx = cart_item_idx;
		this.cart_member_id = cart_member_id;
		this.cart_item_category = cart_item_category;
		this.cart_item_name = cart_item_name;
		this.cart_item_price = cart_item_price;
		this.cart_item_amount = cart_item_amount;
		this.cart_item_img = cart_item_img;
		this.cart_item_content = cart_item_content;
	}


	public int getCart_item_idx() {
		return cart_item_idx;
	}


	public void setCart_item_idx(int cart_item_idx) {
		this.cart_item_idx = cart_item_idx;
	}


	public String getCart_member_id() {
		return cart_member_id;
	}


	public void setCart_member_id(String cart_member_id) {
		this.cart_member_id = cart_member_id;
	}


	public String getCart_item_category() {
		return cart_item_category;
	}


	public void setCart_item_category(String cart_item_category) {
		this.cart_item_category = cart_item_category;
	}


	public String getCart_item_name() {
		return cart_item_name;
	}


	public void setCart_item_name(String cart_item_name) {
		this.cart_item_name = cart_item_name;
	}


	public String getCart_item_price() {
		return cart_item_price;
	}


	public void setCart_item_price(String cart_item_price) {
		this.cart_item_price = cart_item_price;
	}


	public String getCart_item_amount() {
		return cart_item_amount;
	}


	public void setCart_item_amount(String cart_item_amount) {
		this.cart_item_amount = cart_item_amount;
	}


	public String getCart_item_img() {
		return cart_item_img;
	}


	public void setCart_item_img(String cart_item_img) {
		this.cart_item_img = cart_item_img;
	}


	public String getCart_item_content() {
		return cart_item_content;
	}


	public void setCart_item_content(String cart_item_content) {
		this.cart_item_content = cart_item_content;
	}




	
	
	

}
