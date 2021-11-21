<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/items_qna.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- bxslider의 css 추가 -->
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="https://kit-pro.fontawesome.com/releases/v5.15.1/css/pro.min.css" rel="stylesheet">

<style>
	a{
		color: #484848;
	}
    /* 화살표 제거 */
    .dropdown-toggle::after { border: none; }
    
    /* 마우스오버시 팝업 */
    .dropdown:hover .dropdown-menu {
        display: block;
        /* 팝업메뉴가 닫히지 않도록 */
        margin-top: 0; 
     }
</style>

    <div class="qna">
        <div class="qna_header">
            <h3 style="font-weight: bold;">Q&A</h3>
            <p style="font-size: 14px;">상품 Q&A입니다</p>
        </div>
        <div class="qna_item">
            <div style="padding-right: 20px;">
                <img src="${ dto.item_MainImg }" alt="" style="width: 100px;">
            </div>
            <div style="padding-left: 20px;" id="item_box">
                <div>${ dto.item_name }</div>
                <div>${ dto.item_price }원</div>
                <div>
                    <button id="item_btn">상품상세보기</button>
                </div>
            </div>
        </div>
        <div class="item_section">
            <table>
                <tr>
                    <td colspan="2">
                        <input type="text" value="${ items_qna_dto.items_qna_title }" name="items_qna_title" style="font-weight: normal; border: solid 1px #c0c0c0; width: 250px; height: 30px; padding: 0 5px;" readonly>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" value="${ items_qna_dto.items_qna_name }"  name="items_qna_name" style="border: solid 1px #c0c0c0; width: 250px; height: 30px; padding: 0 5px; font-weight: normal;" readonly>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" value="${ items_qna_dto.items_qna_password }" name="items_qna_password" style="border: solid 1px #c0c0c0; width: 250px; height: 30px; padding: 0 5px;" readonly>
                    </td>
                </tr>
                <tr>
                    <th>비밀글설정</th>
                    
	                    <c:if test="${ items_qna_dto.items_qna_secret eq '1' }">
		                    <td>
		                       <c:out value="비밀글"/>
		                    </td>
	                    </c:if>
	                    <c:if test="${ items_qna_dto.items_qna_secret eq '2' }">
	                        <td>
		                       <c:out value="공개글"/>
		                    </td>
	                    </c:if>
                  
                </tr>
                <tr style="border-bottom: solid 1px #d4a5a5;">
                    <td colspan="2" >
                        <textarea readonly name="items_qna_title" style="padding: 10px; font-weight: normal;">${ items_qna_dto.items_qna_title }</textarea>
                    </td>
                </tr>
                </table>
                <div style=" margin-bottom: 10px;">
	            	<c:forEach var="qna_answer_dto" items="${ qna_answer_list }">
	                    <div id="answer"  style=" margin-top: 5px;">
	                        <span>
	                            ${ qna_answer_dto.qna_answer_name } | ${ qna_answer_dto.qna_answer_date }
	                        </span>
	                        <span style="margin-top: 5px;">
	                            <pre style="font-weight: normal;">
${ qna_answer_dto.qna_answer_content }
	                            </pre>
	                        </span>
	                    </div>
                    </c:forEach>
                </div>
                <table>
                <tr>
                    <td></td>
                    <td style="display: flex; justify-content: end;">
                        <a href="itemsQnAcorrection?item_idx=${ dto.item_idx }&items_qna_idx=${ items_qna_dto.items_qna_idx }"><button id="qna_submit">수정</button></a>
                        <a href="item_redirect?item_idx=${ dto.item_idx }"><button id="qna_cancel"  onClick="history.back();">뒤로가기</button></a>
                    </td>
                </tr>
            </table>
        </div>
            
    </div>

      	<c:import url="../user_footer.jsp" />