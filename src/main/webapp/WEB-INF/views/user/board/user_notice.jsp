<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>
    

<c:import url="../user_header.jsp" />

<script>

var member_id = (String)session.getAttribute("member_id");

//페이지 로딩시 자동으로 시작되는 함수
$(document).ready(function() { 

	alert("54");
	
});




</script>
 
 
<link rel="stylesheet" href="/css/user/user_notice.css">
	<br><br><br><br><br>
	<div class="container">
       
        <div class="notice_text_div">
            <div class="notice_text">
                <div>
                    <h4>NOTICE</h4>
                </div>
                
            </div>
        </div>
   
    <br><br>
    
        <div class="qa">
        <table>
          <tr>
              <th>No.</th>
              <th>writer</th>
              <th>title</th>
              <th>Date</th>
              <th>hit</th>
             
          </tr>
          <c:forEach var="notice_dto" items="${ list }">
          	
	          <tr>
	            <td>${ notice_dto.notice_idx }</td>
	            <td>${ notice_dto.notice_name }</td>
	            <td><a href="user_notice_view?notice_idx=${notice_dto.notice_idx}">${ notice_dto.notice_title } </a></td>	            
	            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice_dto.notice_date}"/></td>
	            <td>${ notice_dto.notice_hit }</td>
	          </tr>
			

          </c:forEach>
        </table>
        </div>

        
        </div>
  
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  	<br><br><br><br><br>
  	<c:import url="../user_footer.jsp" />
    </body>
</html>