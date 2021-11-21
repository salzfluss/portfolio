<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>  




<c:import url="user_header.jsp" />

<link rel="stylesheet" href="/css/user/order_payment.css">


     <form name="form" id="form" method="post" action="order_receipt" >   
     <input type="hidden" name="listsize" id="listsize" value="${ listsize }"/>
      <input type="hidden" name="uuid" id="uuid" value=""/>
      
     
     
    <!--        cart_section         -->

	
	<input type="hidden" name="page_url" id="page_url" value="${ page_url }" />
	<input type="hidden" name="member_id" id="member_id" value="${ memberDto.member_id }" />
	
	
    <div class="cart">
        <h5 class="title_box">장바구니</h5>
        <table class="cart_table">
            <colgroup>
                <col style="width:5%;">
                <col style="width:10%;">
                <col style="width:35%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:15%;">
            </colgroup>
            <thead class="table_top">
                <th scope="col">번호</th>
                <th scope="col" ></th>
                <th scope="col" >상품정보</th>
                <th scope="col" >수량</th>
                <th scope="col">가격</th>
                <th scope="col">배송비</th>
            </thead>
            
            <tbody class="table_body">
            
            
            <c:if test="${ page_url eq 'http://localhost:8090/cart' }">
             <c:forEach var="cart_dto" items="${ list }" varStatus="status"> 
              <c:if test="${ memberDto.member_id eq cart_dto.cart_member_id }">  
                <tr>
                    <td><input type="hidden" name="cart_item_idx${status.index}" value="${ cart_dto.cart_item_idx }"/><c:out value="${status.count}" /></td>
                    <td class="img_sec">
                        <div class="prd_img">
                            <img src="${ cart_dto.cart_item_img }" alt="상품이미지" id="product_img" >  
                            <input type="hidden" name="product_img${status.index}" value="${ cart_dto.cart_item_img }"/>                          
                        </div>
                    </td>
                    <td>
                        <div class="prd_name">
                        <input type="text" name="item_name${status.index}" style="border: none; outline: none; width: 200px; text-align: center;" value=" ${ cart_dto.cart_item_name }" readonly/>
                           
                        </div>
                       
                    </td>
                    <!-- <div id="item_amount" name="item_amount${status.index}" value="${ cart_dto.cart_item_amount }"> ${ cart_dto.cart_item_amount } 개 </div> -->
                   
                    <td> <input type="text" name="item_amount${status.index}" style="border: none; outline: none; width: 200px; text-align: center;" value="${ cart_dto.cart_item_amount }" readonly/></td>
                    <td><input type="text" name="sum${status.index}" style="border: none; outline: none; width: 200px; text-align: center;" value="${ cart_dto.cart_item_price * cart_dto.cart_item_amount }" readonly/></td>
                    <td><input type="text" name="transfee${status.index}" style="border: none; outline: none; width: 200px; text-align: center;" value="${ transfee }" readonly/></td>
                </tr>
                 </c:if>
                </c:forEach>
              </c:if>  
              
              
              
                <c:if test="${ page_url ne 'http://localhost:8090/cart' }">
             
              
                <tr>
                    <td><input type="hidden" name="cart_item_idx" value="${ item_idx }"/> 1 </td>
                    <td class="img_sec">
                        <div class="prd_img">
                            <img src="${ item_img }" alt="상품이미지" id="product_img" >       
                            <input type="hidden" name="product_img" value="${ item_img }"/>                      
                        </div>
                    </td>
                    <td>
                        <div class="prd_name">
                           <input type="text" name="item_name" style="border: none; outline: none; width: 200px; text-align: center;" value="${ item_name }" readonly/>
                        </div>
                    </td>
                    <td><input type="text" name="item_amount" style="border: none; outline: none; width: 200px; text-align: center;" value="${ item_amount }" readonly/></td>
                    <td><input type="text" name="sum" style="border: none; outline: none; width: 200px; text-align: center;" value="${ item_price * item_amount }" readonly/></td>
                    <td><input type="text" name="transfee" style="border: none; outline: none; width: 200px; text-align: center;" value="${ transfee }" readonly/></td>
                </tr>
          
                
              </c:if>  
                
                
                
            </tbody>
            
        </table>
    </div>
    
    
    
    
    
    <!--    orderer info section 주문자 정보      -->
    <div class="orderer_box">
        <h4 class="title_box">주문자 정보</h4>
        <div class="orderer_info">
            <table>
                <colgroup>
                    <col style="width:168px">
                </colgroup>
                <tbody class="orderer_body">
                    <tr>
                        <th scope="row">
                            <div class="name">
                                이름
                            </div>
                        </th>
                        <td>
                            <input type="text" name="member_name" id="sender" class="MS_input_txt" value="${ memberDto.member_name }">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="email">
                                이메일
                            </div>
                        </th>
                        <td>
                            <input type="text" name="member_email1"  id="member_email1" class="MS_input_txt" value="${ memberDto.member_email1 }">
                            <span>@</span>
                            <input type="text" name="member_email2" id="member_email2" class="MS_input_txt" value="${ memberDto.member_email2 }">
                            <select name="emailsel" id="email_box" class="select_box" onchange="emailselect(this.value)">
                                <option selected value="${ memberDto.member_email2 }">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hamila.net">hanmail.net</option>
                                <option value="yahoo.com">yahoo.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="phone_number">
                                연락처
                            </div>
                        </th>
                        <td>
                           <!--   <select name="numbersel" id="number_box" class="select_box">
                                <option selected value="choice">선택</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="02">02</option>
                                <option value="031">031</option>
                                <option value="032">032</option>
                            </select>
                            <span>-</span>
                            <input type="text" name="sender" form="order_form" id="sender" class="MS_input_txt" value="">
                            <span>-</span>
                            <input type="text" name="sender" form="order_form" id="sender" class="MS_input_txt" value="">-->
                            
                            <input type="text" name="member_phone" id="sender" class="MS_input_txt" value="${ memberDto.member_phone }">
                            
                            
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!--    Delivery info section      -->
    <div class="delivery_box">
        <h4 class="title_box">배송 정보</h4>
        <div class="delivery_info">
            <table>
                <colgroup>
                    <col style="width:168px">
                </colgroup>
                <tbody class="delivery_body">
                    <tr>
                        <th scope="row">
                            <div class="name">
                                이름
                            </div>
                        </th>
                        <td>
                            <input type="text" name="member_name" id="sender" class="MS_input_txt" value="${ memberDto.member_name }">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="phone_number">
                                연락처1
                            </div>
                        </th>
                        <td>
                        <!--  <select name="numbersel" id="number_box" class="select_box">
                                <option selected value="choice">선택</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="02">02</option>
                                <option value="031">031</option>
                                <option value="032">032</option>
                            </select>
                            <input type="text" name="sender" form="order_form" id="sender" class="MS_input_txt" value="">
                            <span>-</span>
                            <input type="text" name="sender" form="order_form" id="sender" class="MS_input_txt" value=""> -->
                           
                            
                            <input type="text" name="sender" id="sender" class="MS_input_txt" value="${ memberDto.member_phone }">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="phone_number">
                                연락처2
                            </div>
                        </th>
                        <td>
                        <!--  <select name="numbersel" id="number_box" class="select_box">
                                <option selected value="choice">선택</option>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="02">02</option>
                                <option value="031">031</option>
                                <option value="032">032</option>
                            </select>
                            <input type="text" name="sender" form="order_form" id="sender" class="MS_input_txt" value="">
                            <span>-</span>
                            <input type="text" name="sender" form="order_form" id="sender" class="MS_input_txt" value=""> -->
                            <input type="text" name="sender" id="sender" class="MS_input_txt" value="">
                        </td>
                    </tr>
                    <tr id="address">
                        <th scope="row">
                            <div class="">
                                주소
                            </div>
                        </th>
                        <td>
                            
                            <input type="text" name="member_postcode"  id="member_postcode" class="MS_input_txt" value="${ memberDto.member_postcode }">
                            <button type="button" id="zip_code" onclick="showPostcode()">우편번호</button> <br>
                            <input type="text" name="member_address1"  id="member_address1" class="MS_input_txt" value="${ memberDto.member_address1 }">
                            <input type="text" name="member_address2"  id="member_address2" class="MS_input_txt" value="${ memberDto.member_address2 }">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="">
                                주문메세지<br>
                                (100자내외)
                            </div>
                        </th>
                        <td>
                            <textarea name="order_request" id="order_msg" cols="50" rows="5"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            <div class="">
                                무통장 입금자명
                            </div>
                        </th>
                        <td>
                            <input type="text" name="sender"  id="sender" class="MS_input_txt" value="">
                            <span class="order_same">주문자와 같을경우 생략가능</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!--              total price section            -->
    <div class="total_price_box">
        <h4 class="title_box">결제 정보</h4>
        <div class="total_price_info">
            <table>
                <colgroup>
                    <col style="width:300px">
                </colgroup>
                <tbody>
                    <table class="total_price_table">
                        <colgroup>
                            <col style="width:20%;">
                            <col style="width:5%;">
                            <col style="width:20%;">
                            <col style="width:5%;">
                            <col style="width:20%;">
                            <col style="width:5%;">
                            <col style="width:20%;">
                        </colgroup>
                        <thead class="table_top">
                            <th scope="col">상품금액</th>
                            <th></th>
                            <th scope="col">배송비</th>
                            <th></th>
                            <th scope="col">할인금액</th>
                            <th></th>
                            <th scope="col">결제예정금액</th>
                        </thead>
                        <tbody class="table_body">
                            <tr>
                                <td><input type="text" id="sumview" value=" " style="border: none; outline: none; text-align: center;" readonly/></td>
                                <td>+</td>
                                <td><input type="text" id="transfeeview" value="${ transfee }" style="border: none; outline: none; text-align: center;" readonly/></td>
                                <td>+</td>
                                <td>0 </td>
                                <td>=</td>
                                <td><input type="text" id="totalview" value="${ total }" style="border: none; outline: none; text-align: center;" readonly>원</td>
                            </tr>
                        </tbody>
                    </table>
                </tbody>
            </table>
        </div>
    </div>
    <!--    payment option section      -->
    <div class="payment_box">
        <h4 class="title_box">결제 방법</h4>
        <div class="payment_info">
            <table>
                <colgroup>
                    <col style="width:168px">
                </colgroup>
                <tbody class="payment_body">
                    <th>
                        결제방법
                    </th>
                    <td>
                        <ul class="pay_method" name="paymethod">
                            <li>
                                <input name="pay_method" id="card_payment" checked="checked" type="radio" onclick="paymethod();" value="카드결제"><span class="pay_name">카드결제</span>
                            </li>
                            <li>
                                <input name="pay_method" id="deposit_bank"  type="radio" onclick="paymethod2();" value="무통장입금"><span class="pay_name">무통장입금</span>
                            </li>
                            <li>
                                <input name="pay_method" id="account_trans" type="radio" onclick="paymethod3();" value="실시간 계좌이체"><span class="pay_name">실시간 계좌이체</span>
                            </li>
                        </ul>
                    </td>
                    
                    <tr class="add_info">
                        <td colspan="2" valign="top">
                            
           				    <iframe src="/card_payment" width="960px" height="100%" frameborder="0" scrolling="no" name="paymentDesc" id="paymentDesc"></iframe> 
           				   
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>
    <!--    payment option section      -->
    <div class="agreement_box">
        <h4 class="title_box">주문자 동의</h4>
        <div class="greement_info">
            <table class="agreement_table">
                <colgroup>
                    <col style="width:168px">
                </colgroup>
                <tbody class="agreement_body">
                    <th scope="row" style="padding-left:20px">
                        <div>약관동의</div>
                    </th>
                    <td>
                        <div>
                            <p>개인정보 수집/이용</p>
                            <table class="privacy_table">
                                <colgroup>
                                    <col width="*">
                                    <col width="30%">
                                    <col width="20%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">목적</th>
                                        <th scope="col">항목</th>
                                        <th scope="col">보유기간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="txt-l">서비스 제공(요금정산, 콘텐츠 제공, 구매 및 요금결제, 물품배송, 금융거래 본인 인증 및 금융서비스)</div>
                                        </td>
                                        <td>
                                            <div class="txt-l">구매자 정보(이름, 연락처, 이메일),수취인 정보(이름, 연락처, 주소)</div>
                                        </td>
                                        <td>
                                            <div class="txt-l">주문일로 부터 90일까지(관계 법령에 따라 필요 시,일정기간 보유)</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="margin-top: 12px; font-size: 13px; color:#333333;">* 동의하셔야 서비스를 이용하실 수 있습니다.</div>
                            <div class="privercy-agree">
                                <label><input type="radio" name="new_privacy_agree" value="Y" > 정보수집에 동의합니다.</label>
                                <label><input type="radio" name="new_privacy_agree" value="N" checked="" > 동의하지 않습니다.</label>
                            </div>
                        </div>
                    </td>
                    <tr class="agree01" id="agree01">
                        <th scope="row" style="padding-left:20px"><div>주문동의</div></th>
                        <td>
                            <label class="label" style="font-size: 13px; color:#333333;">
                                <input type="checkbox" id="pay_agree" name="pay_agree" >
                                상기 결제정보를 확인하였으며, 구매진행에 동의합니다.
                            </label>
                        </td>
                    </tr>
                    <tr class="agree01">
                        <th style="padding-left:20px">최종 결제금액</th>
                        <td><input type="text" id="totalview" value="${ total }" name="totalview" style="border: none; outline: none; text-align: center; font-size: 25px;" readonly>원</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="order_btn_box">
    <!--  <button id="order_btn" type="submit" formaction="/order_receipt2" style="color:WHITE;">주문완료</button>  -->
        <button id="order_btn"  type="submit" onclick="return agree();" style="color:#484848;">주문완료</button> 
        <button id="cancle_btn" type="button" onclick="location.href='/cart'" style="color:#484848;">주문취소</button> 
    </div>
    
    </form>
    
   


<!-- Optional JavaScript -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script> 
    $('.carousel').carousel({ 
        interval: 2000, //기본 5초 
        keyboard: true,
        pause: 'hover',
        slide: false,
        wrap: true,
        touch: true
    })

function agree() {

		var agree = document.getElementById( 'pay_agree' ).checked;
    	
  		if(agree == false) { //empty: null, 길이 0
  			alert("주문동의 항목을 체크해주세요");
  			document.getElementById('agree01').focus();
  			return false; //submit전송이 안됨
  		}else if(agree == true){

			pay();
			
  	  		}
  		

  	}

	function paymethod(){
	
	document.getElementById("paymentDesc").src = "/card_payment";


	}

    function paymethod2(){
	
    	document.getElementById("paymentDesc").src = "/deposit_bank";


    }

    function paymethod3(){
    	
    	document.getElementById("paymentDesc").src = "/account_trans";


    }

    // 페이지 시작시 자동새로고침
    if (self.name != 'reload') {
        self.name = 'reload';
        self.location.reload(true);
    }
    else self.name = ''; 
	

 // 우편번호 찾기
    function showPostcode() {
    	new daum.Postcode({
    		oncomplete : function(data){
    			// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성하는 부분
    			
    			// 각 주소의 노출 규칙에 따라 주소를 조합한다
    			// 내려오는 변수가 값이 없을 경우엔 공백('')값을 가지므로 이를 참고해서 분기한다
    			var fullAddr = ''; // 최종 주소 변수
    			var extraAddr = ''; // 조합형 주소 변수
    			
    			// 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다
    			if(data.userSelectedType === 'R'){ // 사용자가 도로명 주소를 선택
    				fullAddr = data.roadAddress;
    			} else { // 지번 주소 선택
    				fullAddr = data.jibunAddress;
    			}
    			
    			// 사용자가 선택한 주소가 도로명 타입일 때 조합한다
    			if(data.userSelectedType ==='R'){
    				if(data.bname !== ''){
    					extraAddr += data.bname;
    				}
    				if(data.buildingName !== ''){
    					extraAddr += ( extraAddr !== ''?', ' + data.builingName : data.builingName );
    				}
    				
    				// 조합형 주소 유무에 따라 양쪽 괄호 추가하여 최종 주소 만든다
    				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')': '');
    			}
    			
    			// 우편번호와 주소정보를 해당 필드에 넣는다
    			document.getElementById('member_postcode').value = data.zonecode; // 5자리 새 우편번호
    			document.getElementById('member_address1').value = fullAddr;
    			// 커서를 추가 상세주소 필드에 이동
    			document.getElementById('member_address2').focus();
    		}
    	}).open();
    }


	$(document).ready(function() { 

		var link = document.location.href; 

	
    	
	});


	//페이지 로딩시 자동으로 시작되는 함수
	$(document).ready(function() { 

		var transfeeview = document.getElementById('transfeeview').value;
		var totalview = document.getElementById('totalview').value;

		var sum = parseInt(totalview - transfeeview);


		

	/*  	if(totalview >= 30000){
			document.getElementById('transfeeview').value = 0;

			
			document.getElementById('sumview').value = sum;
			
			}else if(totalview <= 30000){
				
				document.getElementById('transfeeview').value = 2500;
				document.getElementById('sumview').value = sum;
				} */
 
		document.getElementById('sumview').value = sum;
		
    	
	}); 

	function emailselect(email){
		

			document.getElementById('member_email2').value = email;
		}


	//페이지 로딩시 자동으로 시작되는 함수
	$(document).ready(function() { 

		function guid() {
			  function _s4() {
			    return ((1 + Math.random()) * 0x10000 | 0);
			  }
			  return _s4() + _s4() + _s4();
			}
		
 
		document.getElementById('uuid').value = guid();
		
    	
	}); 


	 function pay(){
		 
		 if(confirm("결제를 완료합니다") == true){

				document.getElementById('form').submit();
				
			}else{
				
			  return false;
			  
				}

		 }
	

    
</script> 

  	<c:import url="user_footer.jsp" />