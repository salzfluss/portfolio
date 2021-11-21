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

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap");
        * {
        margin: 0;
        padding: 0;
        font-family: "Josefin Sans", sans-serif;

        }

        a {
            text-decoration: none;
            color: #484848;
        }

        a:hover {
            text-decoration: none;
            color: #484848;
        }

        /*      top nav 부분         */
        .top_fix {
            height: 35px;
            font-size: 12px;
        }

        .top_nav {
            background-color: #ffdcdc;
            height: 30px;
            /* border:1px solid blue; */
        }

        .top_nav li {
            /* border:1px solid red; */
            color: #484848;
            font-size: 13px;
            list-style: none;
            float: right;
            display: flex;
            margin: 5px 5px;
        }

        .top_nav li:first-child {
            margin-right: 15px;
        }

        /*       logo 부분        */
        .logo {
            /* border:1px solid orange; */
            height: 180px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo img {
            align-items: center;
            width: 190px;
            height: 106px;
        }


        /*      section 게시판 부분      */
        .section {
            display: flex;
        }

        /* side_nav 왼쪽 */
        .side_nav {
            /* border:1px solid #484848; */
            width: 150px;
            flex-grow: 1;
        }

        .side_nav li {
            border:1px solid rgb(199, 199, 199);
            border-bottom: none;
            height: 50px;
            line-height: 50px;
            text-align: center;
        }

        #last_li {
            border-bottom: 1px solid rgb(199, 199, 199)
        }

        .side_nav li:hover {
            background-color: #e2bcbc;
        }

        .side_nav a:hover {
            color: white;
        }

        .side_nav a:active {
            color: white;
        }

        /* content 오른쪽 */
        .items_list {
            flex-grow: 2;
            padding-left: 20px;
        }

        .items_list form>input {
            height: 30px;
        }

        .items_list table {
            width: 80%;
            text-align: center;
            margin-left: 100px;
        }

        .items_list tr {
            
            border-bottom:0.5px solid #d4a5a5;
            height: 80px;
            
        }

        .sub_top {
            display: flex;
            border-top: 1px solid #d4a5a5;
            
            border-bottom: solid 2px #d4a5a5;
            margin-right: 20px;
        }

        .sub_top span {
            display: flex;
            justify-content: center;
            align-items: center;
            /* border:1px solid red; */
            height: 80px;
            margin-top:20px;
            margin-bottom:20px;
        }

        .item {
            display: flex;
            justify-content: center;

            margin-top: 30px;
        }
        .review {
            margin-top: 50px;

        }
        .QnA {
            margin-top: 50px;

        }
        .item_section1 {
            

            width: 600px;
        }

        /* .item_section1 table {
            border: solid 1px #d4a5a5;
            border-bottom: none;
        }
        .item_section1 tr {
            border: solid 0.5px #d4a5a5;
            height: 50px;
        }
        .item_section1 td {
            border: solid 0.5px #d4a5a5;
        } */
        .title {
            background-color: #eecbcb;
        }

        img {
            width: 300px;
        }

        button {
            color: #484848;
        }
        .button01{
            width:150px;
            height:50px;
            background-color: #e2bcbc;
            border:1px solid #d4a5a5;
            border-radius: 3px;
            color:white;
        }
        /*     page number 부분      */
        .page_number{
            margin-top:10px;
            display: flex;
            justify-content: center;
        }
        .pagination{
            display: flex;
        }
        .pagination a{
            color:#484848;
        }
        .pagination li{
            font-size: 12px;
            list-style: none;
        }

        input:focus::-webkit-input-placeholder,
        textarea:focus::-webkit-input-placeholder {
            /* WebKit browsers */
            color: transparent;
        }

        input:focus:-moz-placeholder,
        textarea:focus:-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            color: transparent;
        }

        input:focus::-moz-placeholder,
        textarea:focus::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            color: transparent;
        }

        input:focus:-ms-input-placeholder,
        textarea:focus:-ms-input-placeholder {
            /* Internet Explorer 10+ */
            color: transparent;
        }

        .preview {
        width: 450px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        padding: 0 50px;
        padding-top: 20px;
        }
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
                <a href="#">
                    <li>회원목록</li>
                </a>
                <a href="#">
                    <li>상품관리</li>
                </a>
                <a href="#">
                    <li>주문목록</li>
                </a>
                <a href="#">
                    <li>공지사항</li>
                </a>
                <a href="#">
                    <li id="last_li">1:1문의</li>
                </a>
            </ul>
        </div>
        <div class="items_list">
            <div class="sub_top">
                <span style="flex-grow: 1;"></span>
                <span style="flex-grow: 1;">
                    <h2>상품관리</h2>
                </span>
                <span style="flex-grow: 1;">
                </span>
            </div>
            
           
            <div class="review">
                <div>
                    <h3 style="margin-left: 100px;">Review</h3>
                    <table>
                        <tr class="tr_header" style="background-color: #e2bcbc;">
                            <th>번호</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>별점</th>
                            <th>답변</th>
                        </tr>
                        <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                        <c:forEach var="review_dto" items="${ review_list }">
                            <tr style="cursor:pointer;" onclick="location.href='/itemListReview?item_idx=${ dto.item_idx }&review_idx=${ review_dto.review_idx }';">
                                <td>${ review_dto.review_idx }</td>
                                <td style="width: 450px;"><p class="preview">${ review_dto.review_content }</p></td>
                                <td>${ review_dto.review_name }</td>
                                <td>${ review_dto.review_date }</td>
                                <td>${ review_dto.review_score }</td>
                                <td>미답변</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        
            <div class="QnA">
                <div>
                    <h3 style="margin-left: 100px;">Q&A</h3>
                    <table>
                        <tr class="tr_header"  style="background-color: #e2bcbc;">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>답변</th>
                        </tr>
                        <!-- request로 보낸 list를 dto라는 변수로 하나씩 뽑는다. -->
                        <c:forEach var="items_qna_dto" items="${ items_qna_list }">
                            <tr style="cursor:pointer;" onclick="location.href='/itemListQna?item_idx=${ dto.item_idx }&items_qna_idx=${ items_qna_dto.items_qna_idx }';">
                                <td>${ items_qna_dto.items_qna_idx }</td>
                                <td style="width: 450px;">${ items_qna_dto.items_qna_title }</td>
                                <td>${ items_qna_dto.items_qna_name }</td>
                                <td>${ items_qna_dto.items_qna_date }</td>
                                <td>미답변</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        

    </div>
    <div style="height: 30px;"></div>
</body>

</html>