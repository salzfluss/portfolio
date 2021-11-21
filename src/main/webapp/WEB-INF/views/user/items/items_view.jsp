<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="java.util.List"%>
<%@ page import="com.study.springboot.dto.ItemsDto" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>item_page_view</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- bxslider의 css 추가 -->
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="https://kit-pro.fontawesome.com/releases/v5.15.1/css/pro.min.css" rel="stylesheet">

<style>
    @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    *{ margin:0; padding:0;
        font-family: 'Josefin Sans', sans-serif; 
        font-weight: bold; }
    #wrapper {
        width: 600px;
        margin: 0 auto;
    }
    a{
        text-decoration: none;
        color:#484848;
    }
    li{
        list-style: none;
    }
    a:hover{
        text-decoration: none;
        color:#bebebe;
    }

    /*      header       */
    .top_sec{
        height: 35px;
        line-height: 35px;
        text-align: center;
        background-color: #ffdcdc;
        display: flex;
        justify-content: flex-end;
    }
    .top_list{
        display: flex;
    }
    .top_list li{
        margin:0px 10px 0px 10px;
        font-size: 17px;
    }

    .search_sec{
        margin-right:20px;
    }
    .search_sec input{
        height:23px;
        width:140px;
        margin-left: 10px;
        border:none;
        border-radius: 5px 0px 0px 5px;
    }
    .search_btn{
        height: 21px;
        width:21px;
        background-color: none;
    }
    .search_btn img{
        height: 23px;
        width:21px;
        border-radius: 0px 5px 5px 0px;
    }

    .logo{
        height:170px;
        line-height: 170px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .logo img{
        height:85px;
        width:150px
    }
    
    .menu_sec{
        border-top:1px solid #b4b4b4;
        border-bottom:1px solid #b4b4b4;
        height:60px;
        line-height: 60px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .menu_bar{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .menu_bar01{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .menu_bar li{
        padding:0px 25px;
    }
    .menu_bar01 li{
        padding:0px 25px;
    }
    .dropdown-menu{
        border-radius: 0;
    }
    /* 화살표 제거 */
    .dropdown-toggle::after { border: none; }
    /* 마우스오버시 팝업 */
    .dropdown:hover .dropdown-menu {
        display: block;
        /* 팝업메뉴가 닫히지 않도록 */
        margin-top: 0; 
    }


    /* carousel 애니메이션 효과 - animation-delay는 바로 위쪽에 */
    .animated {
        -webkit-animation-duration: 1s;
        animation-duration: 1s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
    }
    .fadeInDown {
        animation-name: fadeInDown;
    }
    .fadeInUp {
        animation-name: fadeInUp;
    }

    /*       item title   부분       */
    .item_title{
    margin:50px 20px 50px 20px;
    text-align: center;
    background-color: #f5e7e7;
    padding:90px 0px;
    background-image: url("item_banner.jpg");
    background-size:100%;
    background-position: 30% 50%;
    opacity: 0.7;
    font-weight: bold;
    }
    .title_box{
        background-color: #ffffff;
        width:280px;
        margin:auto;
        opacity: 0.8;
        padding:10px 10px;
        border-radius: 5px;
    }
    .item_title h5{
        font-size: 17px;
    }


    /*       new update box        */
    .new_item_bar{
        height: 130px;
        line-height: 130px;
        margin-top:100px;
        background-color: #eedaf1;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .new_item_bar h3{
        color:#b093bd;
        font-weight: bold;
    }
    /*         new_item info부분           */
    .new_item_sec01{
        /* border:5px solid green; */
        display: flex;
        width: 100%; 
        margin: auto; 
        display: flex;
        flex-direction: column; 
        text-align: center;   
    }
    .new_item_sec02{
        /* border:5px solid green; */
        display: flex;
        width: 100%; 
        margin: auto; 
        display: flex;
        flex-direction: column; 
        text-align: center;   
    }


    .new_contents {
        display: flex; 
        flex-flow: row wrap; 
        margin: 30px 10px 30px 10px;    
        justify-content: space-around;
    }
    .new_content {
        width: 100%; 
        height: 100%; 
        padding: 0 00px 37.5px 00px;  
        border: 1px solid rgba(148, 146, 146, 0.5);
        margin:0px 5px;
        flex: 1 22%;
        max-width: 350px;
        max-height: 480px; 
        margin-bottom: 30px;
    }
    .new_content img {
        height: 80%;
        width:80%;
    }
    .new_content h3 {
        font-size: 18px; font-weight: bold;
        text-align: start; margin: 10px 15px 15px 15px;
        padding-left: 15px;
    }
    .new_content h5 {
        border-top:1px solid rgba(148, 146, 146, 0.5);
        font-size: 15px;
        font-weight: bold;
        text-align: start;
        margin: 5px 15px 10px 15px;
        padding:10px 15px;
        padding-left: 15px;
    }
    .item_info {
        height: 100px;
        line-height: 100px;
        padding-top: 10px;
    }

    /*      transition 효과       */
    .new_content:hover .new_img  {
        opacity: 0.6; transform: scale(1.1); 
    }
    .new_content:hover h3 {
        color: #002a62; 
    }
    .new_wrap {
        background-color: rgb(255, 255, 255); overflow: hidden;
    }
    .new_img {
        display: block;
        -webkit-transition: 0.5s ease;
        transition: 0.5s ease; 
    }

    /*     page 넘기기 부분      */
    .page_number{ 
        display: flex; 
        justify-content: center; 
        color: grey;
        margin-top:50px;
    }
    .page-link{
        color:#484848;
        padding:10px 13px;
        border:none;
        font-size: 20px;
    }

    /*          footer           */
    .footer{
        background-color: #f5e7e7;
        height:230px;
        margin-top:50px;
        padding-top:40px;
    }
    .sns_sec{
        display: flex;
        height:50px;
        line-height: 50px;
        align-items: center;
        justify-content: center;
    }
    i {
        font-size: 30px;
        margin:0px 7px;
    }
    .footer_menu{
        display: flex;
        height:30px;
        line-height: 30px;
        align-items: center;
        justify-content: center;
    }
    .footer_menu li{
        margin-left:20px;
        font-size: 13px;
    }
    .footer_info{
        height:100px;
        text-align: center;
    }
    .footer_info p{
        margin:0;
        font-size: 12px;
    }
</style>

</head>
<body>
<div class="wrap">
    <div class="header">
        <div class="top_sec">
            <ul class="top_list">
                <li><a href="#">join us</a></li>
                <li><a href="#">login</a></li>
                <li><a href="cart">cart</a></li>
            </ul>
            <div class="search_sec">
                <input type="text"><a href="#" class="search_btn"><img src="search_btn.jpeg"></a>
            </div>
        </div>
        <div class="logo">
            <a href="main.jsp"><img src="logo.jpg"></a>
        </div>
    </div>
    <nav class="menu_nav navbar navbar-expand-md">
        <div class="menu_sec collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Best
                    </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        New
                    </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        All
                    </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Ring
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Necklace
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Bracelet
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Earring
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Board
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Notice</a>
                    <a class="dropdown-item" href="#">Q&A</a>
                </div>
                </li>
            </ul>
        </div>
    </nav>
    <!--         아이템 타이틀 부분             -->
    <div class="item_title">
        <div class="title_box">
            <h4>Best ${ item_category }</h4>
            <h5>Total ${item_idx} Items</h5>
        </div>
    </div>
    <!--        item  view 부분        -->
    
    <div class="new_item_sec">
        <div class="new_contents">
            <c:forEach var="dto" items="${ list }">
            <input type=hidden value=" ${ dto.item_idx } " name="item_idx"/>
	            <div class="new_content">
	                <a href="items_content?item_idx=${ dto.item_idx }">
	                    <div class="new_wrap">
	                        <div class="new_img"><img src="img/${ dto.item_img }" alt=""></div>
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
    <div class="footer">
        <div class="sns_sec">
            <i class="fab fa-instagram"></i>
            <i class="fab fa-facebook"></i>
            <i class="fab fa-twitter"></i>
        </div>
        <ul class="footer_menu">
            <li>Teram of Use</li>
            <li>Privacy Policy</li>
            <li>Confirm Entrepreneur Information</li>
        </ul>
        <div class="footer_info">
            <p>Company Name:Bijou | Owner:Bijou | Phone Number:02-1234-5678 | Email : Bijouowner@google.com</p>
            <p>Address:12-3, 56, Madle-ro, Nowon-gu, Seoul, Republic of Korea | Business Registration Number:7777-12-7777 | 
                Business License:2021-Nowon-gu7777 | hosting by Bijou</p>
            <p>Copyright © Bijou. All rights reserved. </p>
        </div>
    </div>
</div>    
<!-- Optional JavaScript -->

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

</body>
</html>