<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/items_view.css">

    <!--         아이템 타이틀 부분             -->
    <div class="item_title">
        <div class="title_box">
            <h4>Bracelet</h4>
        </div>
    </div>
    <!--        item  view 부분        -->
    <div class="new_item_sec">
        <div class="new_contents">
            <c:forEach var="dto" items="${ list }">
	            <div class="new_content">
	                <a href="items_content?item_idx=${ dto.item_idx }">
	                    <div class="new_wrap">
	                        <div class="new_img"><img src="${ dto.item_MainImg }" alt=""></div>
	                    </div>
	                    <div class="item_info">
	                        <h3 class="item_name">${ dto.item_name }</h3>
	                        <h5 class="item_price">${ dto.item_price }</h5>
	                    </div>
	                </a>
	            </div>
            </c:forEach>
        </div>
    </div>
   
    <div class="page_number">
        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item disabled" id="list">
                    <a class="page-link" href="#"> << </a>
                </li>
                <li class="page-item " id="list">
                    <a class="page-link"  href="list?page=1">1</a>
                </li>
                <li class="page-item " id="list">
                    <a class="page-link" href="list?page=2">2</a>
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

    <c:import url="../user_footer.jsp" />