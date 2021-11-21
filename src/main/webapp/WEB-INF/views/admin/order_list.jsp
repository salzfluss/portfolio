<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.OrderListDto" %>

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/order_list.css">

			<div class="order_list">
                <div class="sub_box">
                    <div class="sub_name"><h2>주문목록</h2></div>
                    <div class="sub_search">
                        <input type="text" value="검색어를 입력하세요."><button class="search_btn">검색</button>
                    </div>
                </div>
                <form action="order_list" method="post">
	                <table class="order_list">
	                    <tr class="tr_header">
	                        <th>번호</th>
	                        <th>주문일자</th>
	                        <th>구매자</th>
	                        <th>상품정보</th>
	                        <th>배송상태</th>
	                        <th>비고</th>
	                        <th></th>
	                    </tr>
	                    <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
	                    <c:forEach var="orderListDto" items="${ orderList }" varStatus="status">
	                        <tr class="list_cell02">
	                            <td><c:out value="${status.count}" /></td>	
	                            <td>${ orderListDto.order_date }</td>					
	                            <td>${ orderListDto.order_user }</td>
	                            <td><a href="orderListView?order_list_idx=${orderListDto.order_list_idx}">
	                                ${ orderListDto.order_item_info }</a></td>
	                            <td>${ orderListDto.order_status }</td>
	                            <td>none</td>
	                            <td><button value="주문취소" formaction="deleteOrderList?order_list_idx=${orderListDto.order_list_idx}">주문취소</button></td>
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
