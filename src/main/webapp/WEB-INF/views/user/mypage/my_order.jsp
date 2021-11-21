<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.OrderListDto" %>

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/my_order.css">

<script>
    //      Number(counterA.innerHTML)
    window.onload = function(){
        var add_btn = document.getElementById('add_btn');
        var min_btn = document.getElementById('min_btn');
        var count = document.getElementById('count');
        add_btn.onclick = function(){
            count.innerHTML=Number(count.innerHTML) + 1;
        };
        min_btn.onclick = function(){
            count.innerHTML = Number(count.innerHTML) - 1;
        };
    };

    //배송조희 팝업창
    function showPopup() { window.open("delivery_info", "배송조회", "width=500, height=850, left=100, top=50"); }
</script>

<!--        mypage_section         -->
    <div id="mypage_sec">
        <div class="mypage_list">
            <h3>마이페이지</h3>
            <ul class="mypage_list">
                <li><a href="my_order">주문내역</a></li>
                <li><a href="cart">장바구니</a></li>
                <li><a href="my_info_checkPw?member_id=${memberDto.member_id }">개인정보수정</a></li>
            </ul>
            <div class="qna_helper">
                <button id="qna_btn" onclick="location.href='/user'">
                    도움이 필요하신가요?<br>
                    1:1 문의하기
                </button>
            </div>
        </div>
        <div class="mypage_box">
            <div class="page_title">
                <h3>주문내역</h3>
            </div>
            <div class="">
                <table class="orderDetail_table">
                    <colgroup>
                        <col style="width:12%;">
                        <col style="width:20%;">
                        <col style="width:20%;">
                        <col style="width:20%;">
                        <col style="width:20%;">
                    </colgroup>
                    <thead>
                        <th scope="col">주문번호</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">상품수량</th>
                        <th scope="col">결제금액</th>
                        <th scope="col">진행상태</th>
                    </thead>
                    <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                    <c:forEach var="orderListDto" items="${ myOrderList }">
                        <tr>
                            <td><a href="myOrderInfo?order_number=${ orderListDto.order_number}">
                            	${ orderListDto.order_number }</a></td>	
                            <td class="img_sec">
                                <div class="prd_img">
                                    <img src="img/items/ring/ring06_1.jpg" style="width:70px; height:100px;">
                                    ${ orderListDto.order_item_img }
                                </div>
                                ${ orderListDto.order_item_info }
                            </td>
                            <td>
                            	${ orderListDto.order_amount }
                            </td>
                            <td>
                            	${ orderListDto.order_total_payment }
                            </td>
                            <td>
                                <span>${orderListDto.order_status }</span> <br>
                                <button value="리뷰쓰기" class="state_btn">리뷰쓰기</button><br>
                                <button value="배송조회" class="state_btn"  onclick="showPopup();" >배송조회</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

<c:import url="../user_footer.jsp" />

