<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, 
    maximum-scale=1.0, minimum-scale=1.0">
    
<link rel="stylesheet" href="/css/user/findId.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    
<title>find your id!</title>
</head>

<body>
	    <div class="main">
      <%
			String member_id = (String)request.getAttribute("member_id");
				//null체크
			if (member_id != null) {
		%>
		<!-- 찾은 아이디 출력 -->
		
		회원님의 아이디는 <%= member_id %> 입니다.
		
		<%
		} else {
		%>

		<!-- 아이디 찾기 -->
		
    <div><h4>아이디 찾기</h4></div>
      <form action="findIdAction" method="POST">
        <table>
          <tr>
            <td>성명</td>
            <td><input type="text" name="member_name"></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td>
            	<input type="text" name="member_email1" class="email_input"> @
            	<input type="text" name="member_email2" class="email_input">
           	</td>
          </tr>
        </table>
        <span><input type="submit" class="table_btn" name="submit" value="아이디 찾기"></span>
        <%
    }
        %>
        <span><input type="button" class="table_btn" onclick="javascript:window.close();" value="닫기"></span>
      </form>
    </div>

</body>
</html>