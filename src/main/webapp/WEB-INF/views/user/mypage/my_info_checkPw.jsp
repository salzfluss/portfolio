<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.MemberDto" %>

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/my_info_checkPw.css">

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
                <h3>개인 정보 수정</h3>
            </div>
            <div class="pw_title">
                <h5>비밀번호 재확인</h5>
                <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
            </div>
            <form action="myInfoCheck" method="post">
	            <div class="pw_confirm">
	                    <h5>아이디</h5>
	                  	${ memberDto.member_id }
	                  	<input type="hidden" name="member_id" value="${ memberDto.member_id }">
	                    <h5>비밀번호</h5>
	                    <input type="password" name="member_pw" id="pw_box">
	            </div>
	            <div class="btn_box">
	                <input type="submit" id="confirm_btn" value="확인">
	            </div>
            </form>
        </div>
    </div>

  <c:import url="../user_footer.jsp" />