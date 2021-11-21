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
            <form action="itemsQnAForm?item_idx=${ dto.item_idx }" method="post" id="itemsQnAForm">
                <table>
                	<input type="hidden" name="items_qna_idx_fk" value="${ dto.item_idx }">
                    <tr style="border: none;">
                        <td colspan="2">
                            <select name="items_qna_title">
                                <option value="상품 문의">상품 문의</option>
                                <option value="입고 및 배송 문의">입고 및 배송 문의</option>
                                <option value="배송 전 변경 및 취소">배송 전 변경 및 취소</option>
                                <option value="배송 후 교환 및 반품">배송 후 교환 및 반품</option>
                                <option value="기타 문의">기타 문의</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" name="items_qna_name" style="border: solid 1px #c0c0c0; width: 250px; height: 30px; font-weight: normal; padding: 0 5px;">
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <input type="password" name="items_qna_password" style="border: solid 1px #c0c0c0; width: 250px; height: 30px; font-weight: normal; padding: 0 5px;">
                        </td>
                    </tr>
                    <tr>
                        <th>비밀글설정</th>
                        <td>
                            <input type="radio" name="items_qna_secret" value="1"> 비밀글
                            <input type="radio" name="items_qna_secret" value="2"> 공개글
                        </td>
                    </tr>
                    <tr style="border-bottom: solid 1px #d4a5a5;">
                        <td colspan="2" >
                            <textarea name="items_qna_content" id="" cols="30" rows="10" style="font-weight: normal; padding: 10px;"></textarea>
                        </td>
                    </tr>
                    
                    
                </table>
            </form>
             <table>
             <tr>
                        <td></td>
                        <td style="display: flex; justify-content: end;">
                            <button type="submit" id="qna_submit" form="itemsQnAForm">등록</button>
                            <button id="qna_cancel" onClick="history.back();">취소</button>
                        </td>
                    </tr>
                    </table>
        </div>
            
    </div>
    
<c:import url="../user_footer.jsp" />