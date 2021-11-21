package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListDto {
	
	private int order_list_idx;
	private int order_number;
	private String order_user;
	private String order_user_id;
	private String order_user_phone;
	private String order_user_address;
	private String order_item_img;
	private String order_item_info;
	private int order_amount;
	private Date order_date;
	private String order_request;
	private String order_payment;
	private String order_status;
	private String order_total_payment;
	
	public OrderListDto() {
		
	}

	public OrderListDto(int order_list_idx, int order_number, String order_user, String order_user_id,
			String order_user_phone,  String order_user_address,
			String order_item_img, String order_item_info, int order_amount, Date order_date, String order_request,
			String order_payment, String order_status, String order_total_payment) {
		super();
		this.order_list_idx = order_list_idx;
		this.order_number = order_number;
		this.order_user = order_user;
		this.order_user_id = order_user_id;
		this.order_user_phone = order_user_phone;
		this.order_user_address = order_user_address;
		this.order_item_img = order_item_img;
		this.order_item_info = order_item_info;
		this.order_amount = order_amount;
		this.order_date = order_date;
		this.order_request = order_request;
		this.order_payment = order_payment;
		this.order_status = order_status;
		this.order_total_payment = order_total_payment;
	}

	public int getOrder_list_idx() {
		return order_list_idx;
	}

	public void setOrder_list_idx(int order_list_idx) {
		this.order_list_idx = order_list_idx;
	}

	public int getOrder_number() {
		return order_number;
	}

	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}

	public String getOrder_user() {
		return order_user;
	}

	public void setOrder_user(String order_user) {
		this.order_user = order_user;
	}

	public String getOrder_user_id() {
		return order_user_id;
	}

	public void setOrder_user_id(String order_user_id) {
		this.order_user_id = order_user_id;
	}

	public String getOrder_user_phone() {
		return order_user_phone;
	}

	public void setOrder_user_phone(String order_user_phone) {
		this.order_user_phone = order_user_phone;
	}

	public String getOrder_user_address() {
		return order_user_address;
	}

	public void setOrder_user_address(String order_user_address) {
		this.order_user_address = order_user_address;
	}

	public String getOrder_item_img() {
		return order_item_img;
	}

	public void setOrder_item_img(String order_item_img) {
		this.order_item_img = order_item_img;
	}

	public String getOrder_item_info() {
		return order_item_info;
	}

	public void setOrder_item_info(String order_item_info) {
		this.order_item_info = order_item_info;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_request() {
		return order_request;
	}

	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}

	public String getOrder_payment() {
		return order_payment;
	}

	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_total_payment() {
		return order_total_payment;
	}

	public void setOrder_total_payment(String order_total_payment) {
		this.order_total_payment = order_total_payment;
	}
	
	
	
}
