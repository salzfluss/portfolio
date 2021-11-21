<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.NoticeDto" %>

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/notice_list.css">

	<div class="order_list">
                <div class="sub_box">
                    <div class="sub_name"><h2>공지사항</h2></div>
                    <div class="sub_search">
                        <input type="text" placeholer="검색어를 입력하세요."><button class="search_btn">검색</button>
                    </div>
                </div>
                <form action="notice_list" method="post">
                <table class="notice_list">
                    <tr class="tr_header">
                        <th>번호</th>
                        <th>제목</th>
                        <th>날짜</th>
                        <th>조회수</th>
                        <th></th>
                    </tr>
                    <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                    <c:forEach var="noticeDto" items="${ noticeList }">
                        <tr class="list_cell02">
                            <td><input type="text" value="${ noticeDto.notice_idx }" id="notice_idx" style="border: none; outline: none; width: 50px; text-align: center;"readonly/></td>
                            <td><a href="noticeContents?notice_idx=${noticeDto.notice_idx}">${ noticeDto.notice_title }</a></td>					
                            <td>${ noticeDto.notice_date }</td>
                            <td>${ noticeDto.notice_hit }</td>
                            <td>
                                <button value="수정" formaction="noticeContents?notice_idx=${noticeDto.notice_idx}">수정</button>
                              
                                <button value="삭제" formaction="deleteNotice?notice_idx=${noticeDto.notice_idx}">삭제</button>  
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                
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
                 
                <div class="write_sec">
            		<button class="write_btn" formaction="writeNoticeForm">글쓰기</button>
        		</div>
                </form>
            </div>
       
       <script>
    

       </script>
    </body>
</html>