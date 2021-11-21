<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.MemberDto" %>

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/member_contents.css">

			<div class="member_list">
                <div class="sub_box">
                    <div class="sub_name"><h2>회원정보</h2></div>
                </div>
                <form action="updateMember" method="post">
                	<input type="hidden" name="member_idx" value="${memberDto.member_idx  }">
                	<input type="hidden" name="member_id" value="${memberDto.member_id  }">
                    <table class="member_info">
                        <tr class="tr_header">
                            <th>회원번호</th>
                            <td>${memberDto.member_idx  }</td>
                        </tr>
                        <tr class="tr_header">
                            <th>아이디</th>
                            <td>${memberDto.member_id  }</td>
                        </tr>
                        <tr class="tr_header">
                            <th>비밀번호</th>
                            <td><input type="text" name="member_pw" value="${ memberDto.member_pw }"></td>
                        </tr>
                        <tr class="tr_header">
                            <th>이름</th>
                            <td><input type="text" name="member_name" value="${ memberDto.member_name }"></td>
                        </tr>
                        <tr class="tr_header">
                            <th>이메일</th>
                            <td>
                            	<input type="text" name="member_email1" value="${ memberDto.member_email1 }"> @
                            	<input type="text" name="member_email2" value="${ memberDto.member_email2 }">
                            </td>
                        </tr>
                        <tr class="tr_header">
                            <th>휴대폰번호</th>
                            <td><input type="text" name="member_phone" value="${ memberDto.member_phone }"></td>
                        </tr>
                        <tr class="tr_header">
                            <th>우편번호</th>
                            <td><input type="text" name="member_postcode" value="${ memberDto.member_postcode }"></td>
                        </tr>
                        <tr class="tr_header">
                            <th>주소</th>
                            <td>
                            	<input type="text" name="member_address1" value="${ memberDto.member_address1 }">
                            	<input type="text" name="member_address2" value="${ memberDto.member_address2 }">
                            </td>
                        </tr>
                        <tr class="tr_header">
                            <th>성별</th>
                            <td>
                            	<input type="radio" name="member_gender" id="member_gender" value="male" ${memberDto.member_gender eq 'male' ? "checked" : '' }>남자
			                    <input type="radio" name="member_gender" id="member_gender" value="female" ${memberDto.member_gender eq 'female' ? "checked" : '' }>여자
			                    <input type="radio" name="member_gender" id="member_gender" value="non" ${memberDto.member_gender eq 'non' ? "checked" : '' }>선택안함
                            </td>
                        </tr>
                        <tr class="tr_header">
                            <th>생일</th>
                            <td><input type="text" value="${ memberDto.member_birthdate }" readonly></td>
                        </tr>
                        <tr class="tr_header">
                            <th>가입일</th>
                            <td>${ memberDto.member_joindate }</td>
                        </tr>
                    </table>
                <div class="back_sec">
                    <button type="submit" class="back_btn" value="수정">수정</button>
                    <a href="member_list"><button class="back_btn" value="목록">목록</button></a>
                </div>
                </form>
            </div>
    </body>
</html>