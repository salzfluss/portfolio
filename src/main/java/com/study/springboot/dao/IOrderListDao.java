package com.study.springboot.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderListDto;

@Mapper
public interface IOrderListDao {
	public List<OrderListDto> OrderList();
	public OrderListDto OrderListView(String order_list_idx);
             public List<OrderListDto> OrderReceipt(String order_user_id);
	public int deleteOrderList(String order_list_idx);
	
	public List<OrderListDto> MyOrderList(String order_user_id);
	public OrderListDto MyOrderInfo(String order_number);
	
	public int write(String order_number, String order_user, String order_user_id, String order_user_phone, String order_user_address,
			String order_item_img, String order_item_info, String order_amount, String order_request, String order_payment,
			String order_status, String order_total_payment);
	
	
}
