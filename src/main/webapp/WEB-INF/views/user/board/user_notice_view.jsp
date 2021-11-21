<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>
    

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/user_notice_view.css">

   <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>

<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div id = "title">
		<h1> ${ dto.notice_title } </h1>	
	 </div>
	 
	 <br>
	 
	 <div id="name_date">
	 	<h6>${dto.notice_name} 	/ <fmt:formatDate pattern="yyyy-MM-dd" value="${dto.notice_date}" /> 	</h6>
	 </div>
	
	<br><br><br>
	
	<div id="img">
		<img src="/upload/${ dto.notice_img }" alt="이미지 불러오기 실패">
	</div>
	
	<br><br><br>
	
	<div id="content">
		${ dto.notice_content }
	
	</div>
	
		<br><br><br>
	
	<div id="backtolist">
		<a href="/user_notice"> -Back to List- </a>
	</div>
	
</div>


	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <br><br><br><br><br>
  
  	<c:import url="../user_footer.jsp" />
    </body>
</html>