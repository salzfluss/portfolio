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

<!-- bxslider의 css 추가 -->
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link href="https://kit-pro.fontawesome.com/releases/v5.15.1/css/pro.min.css" rel="stylesheet">

<link rel="stylesheet" href="/css/user/header.css">

<% 
	String alertMsg = (String)request.getAttribute("alert"); 
	System.out.println( "alertMsg:"+ alertMsg);
%>
<script>
  
    /* if a string is empty, null or undefined I use: */
    function isEmpty(str) {
	    return (!str || 0 === str.length);
	}
    
    /* if a string is blank, null or undefined I use: */
    function isBlank(str) {
        return (!str || /^\s*$/.test(str));
    }
  
    var alertMsg = "<%= alertMsg %>";
  	if( !isBlank(alertMsg) && alertMsg != 'null' ) {
  		alert(alertMsg);
  	}
  	
</script>
<% session.setAttribute("alert", ""); %>

</head>
<body onload="init();">
<div class="wrap">
    <div class="header">
        <div class="top_sec">
            <ul class="top_list">
                <li><a href="join01">join us</a></li>
                <%
                String member_id = (String)session.getAttribute("member_id");
                
                // null 체크
                if( member_id != null ){ // 로그인 상태
	               	%>
	                	<li><a href="logout">logout</a></li>
	                	<li><a href="my_order">my page</a></li>
	               	<%
                } else{ // 로그아웃 상태
	                %>
	                <li><a href="login">login</a></li>
	                <% 
                } 
                
                %>
                <li><a href="cart">cart</a></li>
            </ul>
            <div class="search_sec">
                <input type="text"><a href="#" class="search_btn"><img src="/img/main/search_btn.jpeg"></a>
            </div>
        </div>
        <div class="logo">
            <a href="main"><img src="/img/main/logo_bijou.png"></a>
        </div>
    </div>
    <nav class="menu_nav navbar navbar-expand-md">
        <div class="menu_sec collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">													<!-- 드롭다운으로 하려면 data-toggle="dropdown" 추가 -->
                    <a class="nav-link dropdown-toggle" href="items_view_best" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
                        Best
                    </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="items_view_new" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
                        New
                    </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="items_view_all" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
                      All
                    </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="items_view_ring" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
                    Ring
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="items_view_necklace" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
                        Necklace
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="items_view_bracelet" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
                    Bracelet
                </a>
                </li>
            </ul>
            <ul class="menu_bar navbar-nav">
                <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle active" href="items_view_earrings" id="navbarDropdownMenuLink" role="button"  aria-haspopup="true" aria-expanded="false">
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
                    <a class="dropdown-item" href="/user_notice">Notice</a>
                    <a class="dropdown-item" href="/user">Q&A</a>
                </div>
                </li>
            </ul>
        </div>
    </nav>