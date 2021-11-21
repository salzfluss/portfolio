<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>

<c:import url="../user_header.jsp" />

<link rel="stylesheet" href="/css/user/login.css">

    <!--        login_section         -->
    <div class="login_wrap">
        <div class="login_title">
            Login
        </div>
        <form action="loginMember" method="post">
	        <div class="id_box">
	            <span for="login_id" class="login_span">아이디</span>
	            <input type="text" name="member_id" class="login_box">
	        </div>
	        <div class="pw_box">
	            <span for="login_pw" class="login_span">비밀번호</span>
	            <input type="password" name="member_pw" class="login_box">
	        </div>
	        <div class="find_info">
	            <a href="javascript:void(0)" onclick="window.open('/findId', '아이디찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')">아이디 / </a>
	            <a href="javascript:void(0)" onclick="window.open('/findPw', '아이디찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')">비밀번호 찾기</a>
	        </div> <br>
	        <div class="btn_wrap">
		        <input type="submit" class="login_btn" value="로그인">
	          	<a href="join01"><button class="join_btn" >회원가입하기</button></a>    
	        </div>
        </form>
    </div>

  <c:import url="../user_footer.jsp" />