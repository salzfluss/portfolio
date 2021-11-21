<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 



<!DOCTYPE html>
<html lang="en">
    <head>
        <title>bijou</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<style>
   @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300&display=swap');
			
    *{ margin:0; padding:0;
  	font-family: 'Josefin', sans-serif;
    }
    a{
        text-decoration: none;
        color:#484848;
    }
    a:hover{
        text-decoration: none;
        color:#484848;
    }

    /*      top nav 부분         */
    .top_fix{
        
        height:35px;
        font-size: 12px;
    }
    .top_nav{
        background-color: #ffdcdc;
        height:30px;
        /* border:1px solid blue; */
    }
    .top_nav li{
        /* border:1px solid red; */
        color:#484848;
        font-size: 13px;
        list-style: none;
        float: right;
        display: flex;
        margin:5px 5px;
    }
    .top_nav li:first-child{
        margin-right: 15px;
    }

    /*       logo 부분        */
    .logo{
        /* border:1px solid orange; */
        height:120px;
        display: flex;
        justify-content:center;
        align-items:center;
        padding-top: 20px;
    }
    .logo img{
        align-items: center;
        width:190px;
        height:106px;
    }


    /*      section 게시판 부분      */
    .section{
        display: flex;
    }
    /* side_nav 왼쪽 */
    .side_nav{
        /* border:1px solid #484848; */
        width: 150px;
        flex-grow: 1;
    }
    .side_nav li{
        border:1px solid #484848;
        border-bottom: none;
        height:50px;
        line-height: 50px;
        text-align: center;
    }
    #last_li{
        border-bottom:1px solid #484848;
    }

    .side_nav li:hover{
        background-color: rgb(163, 163, 163);
    }
    .side_nav a:hover{
        color:white;
    } 
    .side_nav a:active{
        color:white;
    }
    /* content 오른쪽 */
    .items_list{
        flex-grow: 2;
        padding-left: 20px;
    }
    .items_list form > input {
        height: 30px;
    }
   .items_list table{
        width: 98%;
        text-align: center;
    }
    .items_list tr{
        border-bottom: solid 1px black;
        height: 80px;
    }
    .sub_top{
        display: flex;
    }
    .sub_top span{
        display: flex;
        justify-content: center;
        align-items: center;

        height: 70px;
    }
    img{
    	height:60px;
    }
    button{
        color: #484848;
    }
    
    input:focus::-webkit-input-placeholder, textarea:focus::-webkit-input-placeholder 
    { /* WebKit browsers */ color:transparent; } 
    input:focus:-moz-placeholder, textarea:focus:-moz-placeholder 
    { /* Mozilla Firefox 4 to 18 */ color:transparent; } 
    input:focus::-moz-placeholder, textarea:focus::-moz-placeholder 
    { /* Mozilla Firefox 19+ */ color:transparent; } 
    input:focus:-ms-input-placeholder, textarea:focus:-ms-input-placeholder 
    { /* Internet Explorer 10+ */ color:transparent; }
</style>
</head>
<body>
        <div id="header">
            <div id="top_fix">
                <ul class="top_nav">
                    <li><a href="#">logout</a></li>
                    <li><a href="#">admin</a></li>
                </ul>
            </div>
            <div class="logo">
                <img src="/img/logo_bijou.png">
                <span>admin</span>
            </div>
        </div>
        <div class="section">
            <div class="aside">
                <ul class="side_nav">
                    <a href="#"><li>회원목록</li></a>
                    <a href="#"><li>상품관리</li></a>
                    <a href="#"><li>주문목록</li></a>
                    <a href="#"><li>공지사항</li></a>
                    <a href="#"><li id="last_li">1:1문의</li></a>
                </ul>
            </div>
            <div class="items_list">
                <div class="sub_top">
                    <span style="flex-grow: 1;"></span>
                    <span style="flex-grow: 1;"><h1>상품관리</h1></span>
                    <span style="flex-grow: 1;">
                        <form action="items_search" method="GET">
                        	<!-- <select name="items_category_search">
                                <option value="Ring">Ring</option>
                                <option value="Necklace">Necklace</option>
                                <option value="Bracelet">Bracelet</option>
                                <option value="Earring">Earring</option>
                            </select> -->
                            <input type="text" name="items_title_search" placeholder="검색어를 입력하세요" style="width: 200px;">
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
                    <c:forEach var="dto" items="${ items_search_list }">
                        <tr>
                                <td>${ dto.item_idx }</td>						
                                <td>${ dto.item_category }</td>
                                <td>${ dto.item_name }</td>
                                <td><img src="/img/${ dto.item_img }" alt="업로드된 이미지" /></td>
                                <td>${ dto.item_price }원</td>
                                <td class="item_submit">
                                <a href="items_correction?item_idx=${ dto.item_idx }"><input type="button" value="수정"/></a>
                                <a href="items_delete?item_idx=${ dto.item_idx }"><input type="button" value="삭제"/></a>
                            </td>
                        </tr>
                     </c:forEach>
                </table>
                <div style="display: flex; justify-content: flex-end; margin-right: 115px; margin-top: 20px;">
                    <a href="items_register"><input type="button" value="상품등록"/></a>
                </div>
            </div>
            
            
        </div>
    </body>
</html>
