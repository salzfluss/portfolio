<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/join02.css">

  <div class="join_success">
    <h1>회원가입이 완료되었습니다 ♥</h1>
    <h2>welcome, enjoy shopping!</h2>
    <img src="/img/main/bijou_img.png" alt="">
    <div>
      <a href="login">
        <button class="login_bt">로그인하러 가기</button>
      </a>
    </div>
  </div>
  
  <c:import url="../user_footer.jsp" />