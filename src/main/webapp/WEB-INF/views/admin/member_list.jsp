<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.MemberDto" %>

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/member_list.css">

			<div class="member_list">
                <div class="sub_box">
                    <div class="sub_name"><h2>회원목록</h2></div>
                    <div class="sub_search">
                        <input type="text" value="검색어를 입력하세요."><button class="search_btn">검색</button>
                    </div>
                </div>
                <form action="member_list" method="post">
	                <table class="member_list">
	                    <tr class="tr_header">
	                        <th>번호</th>
	                        <th>이메일</th>
	                        <th>이름</th>
	                        <th>가입일</th>
	                        <th>생년월일</th>
	                        <th>휴대폰</th>
	                        <th></th>
	                    </tr>
	                    <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
	                    <c:forEach var="memberDto" items="${ memberList }">
	                        <tr class="list_cell02">
	                            <td>${ memberDto.member_idx }</td>	
	                            <td>${ memberDto.member_email1 } @ ${ memberDto.member_email2 }</td>					
	                            <td><a href="memberView?member_idx=${memberDto.member_idx}">
	                                ${ memberDto.member_name }</a></td>
	                            <td>${ memberDto.member_joindate }</td>
	                            <td>${ memberDto.member_birthdate }</td>
	                            <td>${ memberDto.member_phone }</td>
	                            
	                            <td>
	                            	<button value="수정" formaction="memberView?member_idx=${memberDto.member_idx}">수정</button>
	                            	<button value="삭제" formaction="deleteMember?member_idx=${memberDto.member_idx}">삭제</button>
	                            </td>
	                        </tr>
	                    </c:forEach>   
	                </table>
                </form>
                
<!--            page number                      -->
                <div class="page_number">
                    <nav aria-label="...">
                            <ul class="pagination">
                                <li class="page-item disabled" id="list">
                                        <a class="page-link" href="#"> << </a>
                                </li>
                                <li class="page-item " id="list">
                                    <a class="page-link"  href="list?page=1"> 1 </a>
                                </li>
                                <li class="page-item " id="list">
                                        <a class="page-link" href="list?page=2"> 2 </a>
                                </li>
                                <li class="page-item " id="list">
                                    <a class="page-link" href="list?page=3">3</a>
                                </li>
                                <li class="page-item" id="list">
                                        <a class="page-link" href="#"> >> </a>
                                </li>
                            </ul>
                    </nav>
                </div>
            </div>
    </body>
</html>