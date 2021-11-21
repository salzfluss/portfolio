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
  
  <link rel="stylesheet" href="/css/admin/header.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>
<body>
        <div id="header">
            <div id="top_fix">
                <ul class="top_nav">
                	<%
                	
	                String member_id = (String)session.getAttribute("member_id");
	                
	                // null 체크
	                if( member_id != null ){ // 로그인 상태
	                	
		               	%>
		                	<li><a href="logout">logout</a></li>
		               	<%
	                } else{ // 로그아웃 상태
		                %>
		                <li><a href="#">admin</a></li>
		                <% 
	                } 
	                
	                %>
	                <li><a href="#">admin</a></li>
                </ul>
            </div>
            <div class="logo">
                <img src="/img/main/logo_bijou.png">
                <span>admin</span>
            </div>
        </div>
        <br><br><br>
        <div class="section">
            <div class="aside">
                <ul class="side_nav">
                    <a href="member_list"><li>회원목록</li></a>
                    <a href="items_list"><li>상품관리</li></a>
                    <a href="order_list"><li>주문목록</li></a>
                    <a href="notice_list"><li>공지사항</li></a>
                    <a href="one2one"><li id="last_li">1:1문의</li></a>
                </ul>
            </div>
   