<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.OrderListDto" %>

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/order_list_view.css">

			<div class="order_list">
                <div class="sub_box">
                    <div class="sub_name"><h2>주문내역</h2></div>
                </div>
                <form action="orderListView" method="post">
                <div class="order_subtitle">
                    <span>상품주문번호 : </span>
                    <span>
                    	${orderListDto.order_number}
                   	</span>
                </div>
	                <table class="order_list_tb">
	                        <tr class="tr_header">
	                            <th>상품명</th>
	                            <td>${orderListDto.order_list_idx}</td>
	                        </tr>
	                        <tr class="tr_header">
	                            <th>상품주문상태</th>
	                            <td>${orderListDto.order_status}</td>
	                        </tr>
	                        <tr class="tr_header">
	                            <th>구매자명</th>
	                            <td>${ orderListDto.order_user }</td>
	                        </tr>
	                        <tr class="tr_header">
	                            <th>총 상품금액</th>
	                            <td>${ orderListDto.order_amount }</td>
	                        </tr>
	                </table>
        
                
                <div class="order_subtitle">
                    <span>배송지 정보</span>
                </div>
                
	                <table class="order_list_tb">
	                        <tr class="tr_header">
	                            <th>수취인명</th>
	                            <td>${ orderListDto.order_user  }</td>
	                        </tr>
	                        <tr class="tr_header">
	                            <th>구매자 ID</th>
	                            <td>${ orderListDto.order_user_id  }</td>
	                            <th>연락처</th>
	                            <td>${ orderListDto.order_user_phone  }</td>
	                        </tr>
	                        <tr class="tr_header">
	                            <th>배송지</th>
	                            <td>${ orderListDto.order_user_address }</td>
	                        </tr>
                        	<tr class="tr_header">
	                            <th>배송 요청사항</th>
	                            <td>${ orderListDto.order_request }</td>
	                        </tr>
	                </table>
                </form>
                
                <div class="back_sec">
                    <a href="order_list"><button class="back_btn" value="뒤로가기">뒤로가기</button></a>
                </div>
            </div>
    </body>
</html>
