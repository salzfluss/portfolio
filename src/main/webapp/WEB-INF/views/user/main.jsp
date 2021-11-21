<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="user_header.jsp" />
<link rel="stylesheet" href="/css/user/main.css">

    <!-- 캐러셀 -->
    <div id="demo" class="carousel slide align-center" data-ride="carousel" > 
        <div class="carousel-inner"> 
            <!-- 슬라이드 쇼 --> 
            <div class="carousel-item active"> <!--가로--> 
                <img class="d-block" src="/img/main/banner01.jpg" alt="First slide"> 
            </div>
            <div class="carousel-item"> 
                <img class="d-block " src="/img/main/banner02.jpg" alt="Second slide"> 
            </div> 
            <div class="carousel-item"> 
                <img class="d-block " src="/img/main/banner03.jpg" alt="Second slide"> 
            </div> 
            <!-- / 슬라이드 쇼 끝 --> 
            <!-- 왼쪽 오른쪽 화살표 버튼 --> 
            <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
            <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
            <!-- <span>Previous</span>  -->
            </a> 
            <a class="carousel-control-next" href="#demo" data-slide="next"> 
            <span class="carousel-control-next-icon" aria-hidden="true"></span> 
            <!-- <span>Next</span>  -->
            </a> <!-- / 화살표 버튼 끝 --> 
        </div>
    </div>
    <!--        new item 부분        -->
    <div class="new_item_bar">
        <h3>new update 5% dc</h3>
    </div>
    <div class="new_item_sec01">
        <div class="new_contents">
        
        <c:forEach var="dto" items="${ list }">
            <div class="new_content">
                <a href="items_content?item_idx=${dto.item_idx }">
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
    
    <!--        best item 부분           -->
    <div class="best_item_bar">
        <div class="best_bar_img"><img src="/img/main/middle.jpeg"></div>
    </div>
    <div class="best_title">
        <h3>best item</h3>
    </div>
    <div class="new_item_sec01">
        <div class="new_contents">
            <c:forEach var="dto" items="${ list }">
            <div class="new_content">
                <a href="items_content?item_idx=${dto.item_idx }">
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

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<script> 
    $('.carousel').carousel({ 
        interval: 2000, //기본 5초 
        keyboard: true,
        pause: 'hover',
        slide: false,
        wrap: true,
        touch: true
    }) 
</script> 

<c:import url="user_footer.jsp" />