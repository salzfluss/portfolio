<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<link rel="stylesheet" href="/css/user/delivery_info.css">

<body>
    <div id="delivery_box">
        <h3 class="deli_title">배송조회</h3>
        <div class="complete_title"><h4>배송이 완료 되었습니다.</h4></div>
        <div class="mypage_box">
            <table class="orderDetail_table">
                <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                <c:forEach var="dto" items="${ order_list }">
                    <tr>
                        <td>${ dto.order_list_idx }</td>	
                        <td class="img_sec">
                            <div class="prd_img">
                                ${ dto.order_item_img }
                            </div>
                            <a href="content_view.do?board_idx=${dto.order_list_idx}">
                                ${ dto.order_item_info }</a>
                        </td>
                        <td>${ dto.item_price }</td>					
                        <td>${ dto.item_order_date }</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="deli_table_box">
            <table class="deli_table">
                <colgroup>
                    <col style="width:32%;">
                    <col style="width:32%;">
                    <col style="width:32%;">
                </colgroup>
                <thead>
                    <th scope="col">처리일시</th>
                    <th scope="col">현재위치</th>
                    <th scope="col">상태</th>
                </thead>
                <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                <tbody>
                    <tr>
                        <td>2020-09-28-19:58:00</td>	
                        <td>방학(대)</td>
                        <td>배달완료</td>					
                    </tr>
                    <tr>
                        <td>2020-09-27-18:48:00</td>	
                        <td>도봉터미널</td>
                        <td>배송중</td>					
                    </tr>
                    <tr>
                        <td>2020-09-27-08:23:00</td>	
                        <td>대전C터미널</td>
                        <td>집하</td>					
                    </tr>
                    <tr>
                        <td>2020-09-26-12:18:00</td>	
                        <td>동대구터미널</td>
                        <td>배송중(출고)</td>					
                    </tr>
                </tbody>
            </table>
        </div>
        <h3 class="deli_title">송장정보</h3>
        <div id="basic_info">
            <table>
                <colgroup>
                    <col style="width:200px">
                </colgroup>
                <tbody class="myinfo_body">
                    <tr>
                        <th scope="row">
                            송장번호
                        </th>
                        <td>
                            693123098123
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            택배사
                        </th>
                        <td>
                            CJ대한통운
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">
                            대표번호
                        </th>
                        <td>
                            1588-1234
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="btn_box">
        <button class="close_btn" onclick="self.close();">닫기</button>
    </div>
</body>
</html>