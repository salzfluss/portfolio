<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/my_order_info.css">

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
    function showPopup() { window.open("delivery_info.html", "배송조회", "width=500, height=800, left=100, top=50"); }
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
                <h3>주문/배송상세정보</h3>
            </div>
            <div id="order_num_box">
                    <span>주문일자 ${ dto.order_date} | </span>
                    <span>주문번호 <span class="order_num">${ orderListDto.order_number}</span> </span>
            </div>
            <form action"myOrderInfo" method="post">
            <table class="orderDetail_table">
                <colgroup>
                    <col style="width:24%;">
                    <col style="width:24%;">
                    <col style="width:24%;">
                    <col style="width:24%;">
                </colgroup>
                <thead>
                    <th scope="col">주문번호</th>
                    <th scope="col">상품정보</th>
                    <th scope="col">구매금액</th>
                    <th scope="col">구매일자</th>
                </thead>
                <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                    <tr>
                        <td>${ orderListDto.order_number }</td>	
                        <td class="img_sec">
                            <div class="prd_img">
                                <img src="ring.jpg">
                                ${ orderListDto.order_item_img }
                            </div>
                                ${ orderListDto.order_item_info }
                        </td>
                        <td>${ orderListDto.order_total_payment }</td>					
                        <td>
                            ${ orderListDto.order_date }
                        </td>
                    </tr>
            </table>
            <div class="page_title">
                <h3>결제금액정보</h3>
            </div>
            <div id="pay_price_info">
                <table class="pay_price_table">
                    <th>결제수단</th>
                    <tr>
                        <td>은행명</td>
                        <td>우리은행</td>
                        <td>총 상품 가격</td>
                        <td>${ orderListDto.order_total_payment }</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>할인금액</td>
                        <td>0원</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>배송비</td>
                        <td>${orderListDto.order_delivery_fee }</td>
                    </tr>
                    <tr class="last_tr">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${ orderListDto.order_total_payment }</td>
                    </tr>
                    <tr> 
                        <td></td>
                        <td></td>
                        <td><h5>총 결제금액</h5></td>
                        <td><h5>${ orderListDto.order_total_payment}</h5></td>
                    </tr>
                </table>
            </div>
            <div class="page_title">
                <h3>받는사람 정보</h3>
            </div>
            <div id="basic_info">
                <table>
                    <colgroup>
                        <col style="width:200px">
                    </colgroup>
                    <tbody class="myinfo_body">
                        <tr>
                            <th scope="row">
                                받는사람
                            </th>
                            <td>
                                ${ orderListDto.order_user }
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                연락처
                            </th>
                            <td>
                                ${ orderListDto.order_user_phone }
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                받는 주소
                            </th>
                            <td>
                                ${ orderListDto.order_user_address }
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                배송요청사항
                            </th>
                            <td>
                                ${ orderListDto.order_request }
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            <div class="btn_box">
                <button class="back_btn"><a href="my_order">주문목록 돌아가기</a></button>
            </div>
        </div>
    </div>

  <c:import url="../user_footer.jsp" />
