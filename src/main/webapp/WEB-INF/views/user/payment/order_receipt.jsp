<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>  


<c:import url="../user_header.jsp" />

<link rel="stylesheet" href="/css/user/order_receipt.css" >

	<input type="hidden" value="${ memberDto.member_id }" />
	<!-- <input type="text" value="${ listsize }" /> -->
	<input type="hidden" value="${ uuid }" />
	
    <div class="main_section">
        <div class="sub_section">
            <div style="padding-right: 30px;"><img src="comment.png" alt="" style="width: 100px;""></div>
            <div>
                <div><h1>주문이 완료되었습니다.</h1></div>
            <div>주문번호 : <input type="text" value="${ uuid }" style="border: none; outline: none;  font-size: 15px;" readonly /></div>
            <div>주문일자 : <input type="text" value="" id="dateview" style="border: none; outline: none;  font-size: 15px; width: 200px;" readonly /></div>
            </div>
        </div>
        <div class="order_list">
            <div>
                <div class="header_div">결제정보</div>
                <table class="list1">
          
                
                    <tr>
                        <th>최종결제금액</th>
                        <td><input type="text" id="totalview2" value="" style="border: none; outline: none;  font-size: 15px;" readonly/></td>
                    </tr>
                    <tr>
                        <th>결제수단</th>
                        <td style="font-weight: normal;"><input type="text" id="paymentview" value="" style="border: none; outline: none;  font-size: 15px;" readonly/></td>
                    </tr>
                
                    
                </table>
            </div>
            <div style="margin-top: 60px;">
                <div class="header_div">주문정보</div>
                <div id="table">
             
                <table class="list2">
                    <tr>
                    	<th>번호</th>
                        <th style="width: 140px;">사진</th>
                        <th>제품명</th>
                        <th>수량</th>
                        <th>상태</th>
                        <th>비고</th>
                    </tr>
                    
                    <c:forEach var="list" items="${ order_list }"  varStatus="status">
                    	<c:if test="${ list.order_number eq uuid }">
	                    <tr>
	                    	<td><c:out value="${status.count}" /> </td>
		                    <td><img src="${ list.order_item_img }" alt="사진 불러오기 실패" style="width: 30px; height:30px;"></td>
		                    <td><input type="text" id="item_name" value="${ list.order_item_info }"  style="border: none; outline: none; text-align: center; font-size: 15px;" readonly></td>
		                    <td><input type="text" id="item_amount" value="${ list.order_amount }"  style="border: none; outline: none; text-align: center; font-size: 15px;" readonly></td>
		                    <td><input type="text" id="status" value="${ list.order_status }"  style="border: none; outline: none; text-align: center; font-size: 15px;" readonly></td>
		                    <td></td>
	                    </tr>
	                    <input type="hidden" id="total" value="${ list.order_total_payment }"  style="border: none; outline: none; text-align: center; font-size: 15px;" readonly>
	                    <input type="hidden" name="payment" id="payment" value="${ list.order_payment }"/>
	                     <input type="hidden" name="request" id="request" value="${ list.order_request }"/>
	                     <input type="hidden" name="date" id="date" value="${ list.order_date }"/>
	                    
	                    </c:if>
                    </c:forEach>
                    
                   	<tr>
                   	<td colspan="6" style="text-align: right;"><input type="text" id="price" value="" style="border: none; outline: none; width: 50px; text-align:center;"/> + <input type="text" id="transfee" value="" style="border: none; outline: none; width: 50px; text-align:center;"/> = <input type="text" id="totalview" value="" style="border: none; outline: none; width: 50px; text-align:center;"/>원<td></tr>
                  
                </table>
                </div>                
            </div>
            <div style="margin-top: 60px;">
                <div class="header_div">주문자정보</div>
                <table class="list3">
                    <tr>
                        <th>주문번호</th>
                        <td>${ uuid }</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td style="font-weight: normal;">${ memberDto.member_name }</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${ memberDto.member_email1 }@${ memberDto.member_email2 }</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>${ memberDto.member_phone }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td style="font-weight: normal;">[${ memberDto.member_postcode }] ${ memberDto.member_address1 } ${ memberDto.member_address2 }</td>
                    </tr>
                </table>
            </div>
            <div style="margin-top: 60px;">
                <div class="header_div">배송지정보</div>
                <table class="list4">
                    <tr>
                        <th>이름</th>
                        <td style="font-weight: normal;">${ memberDto.member_name }</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td>${ memberDto.member_phone }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td style="font-weight: normal;">[${ memberDto.member_postcode }] ${ memberDto.member_address1 } ${ memberDto.member_address2 }</td>
                    </tr>
                    <tr>
                    	<th>배송 요청사항</th>
                    	<td style="font-weight: normal;">
                    	
                    	<textarea id="requestview" style="width: 400px; height: 100px; border: none; outline: none;"></textarea>
                    	
                   			<!--  <input type="text" id="requestview" value="" style="border: none; outline: none;  font-size: 15px; width: 500px; height: 50px" readonly/> -->
                    
                   		 </td>
                    </tr>
                </table>
            </div>
        </div>
        
        <div class="list_button" style="margin-top: 30px;">
            <button id="button1" onclick="location.href='/main'" style="margin-right: 5px;">쇼핑계속하기</button>
            <button id="button2" onclick="location.href='/my_order'" style="margin-left: 5px;">주문확인하기</button>
        </div>
    </div>
    
    <script>

  
    

    $(document).ready(function () {

     var total = document.getElementById('total');
     var transfee = document.getElementById('transfee');
     var price = document.getElementById('price');
     
	 document.getElementById('totalview').value = total.value;
	 document.getElementById('totalview2').value = total.value;
	 
	 if(total.value < 30000){
		 
		transfee.value = 2500;

		price.value = parseInt(total.value) - parseInt(transfee.value);

		 
		 } else if(total.value >= 30000){

		transfee.value = 0;
		price.value = parseInt(total.value) - parseInt(transfee.value);
		 }


	 var payment = document.getElementById('payment').value;

	 document.getElementById('paymentview').value = payment;	

	 var request = document.getElementById('request').value;

	 document.getElementById('requestview').value = request;

	 var date = document.getElementById('date').value;

	 document.getElementById('dateview').value = date;
	 	
	 
		
		});

  


    </script>

<c:import url="../user_footer.jsp" />