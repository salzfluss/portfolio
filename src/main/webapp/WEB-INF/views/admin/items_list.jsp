<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/item_list.css">

        <div class="items_list">
            <div class="sub_top">
                <span style="flex-grow: 1;"></span>
                <span style="flex-grow: 1;">
                    <h2>상품관리</h2>
                </span>
                <span style="flex-grow: 1;">
                    <form action="/admin/items_search" method="GET">
                        <!-- <select name="items_category_search">
                                <option value="Ring">Ring</option>
                                <option value="Necklace">Necklace</option>
                                <option value="Bracelet">Bracelet</option>
                                <option value="Earring">Earring</option>
                            </select> -->
                        <input type="text" name="items_name_search" placeholder="검색어를 입력하세요" style="width: 200px;">
                        <input type="submit" value="검색" style="width: 50px; margin-left: -5px;">
                    </form>
                </span>
            </div>
            <table>
                <tr class="tr_header">
                    <th>번호</th>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>메인상품이미지</th>
                    <th>가격</th>
                    <th></th>
                </tr>
                <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                <c:forEach var="dto" items="${ list }">
                    <tr style="cursor:pointer;" onclick="location.href='/items_list_contents?item_idx=${ dto.item_idx }'">
                        <td>${ dto.item_idx }</td>
                        <td>${ dto.item_category }</td>
                        <td>${ dto.item_name }</td>
                        <td><img src="${ dto.item_MainImg }" alt="업로드된 이미지" /></td>
                        <td>${ dto.item_price }원</td>
                        <td class="item_submit">
                            <a href="items_correction?item_idx=${ dto.item_idx }"><input type="button" value="수정" /></a>
                            <a href="items_delete?item_idx=${ dto.item_idx }"><input type="button" value="삭제" /></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div style="display: flex; justify-content: flex-end; margin-right: 115px; margin-top: 30px; margin-bottom:30px;">
                <a href="items_register"><input type="button"  class="button01" value="상품등록" /></a>
            </div>

           

        </div>

    </div>
</body>

</html>