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

    <!-- My CSS -->
    <link rel="stylesheet" href="../css/member/passwordFind.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
  <script type="text/javascript">

//F12 버튼 방지 

$(document).ready(function(){ 
	$(document).bind('keydown',function(e){ 
		if ( e.keyCode == 123 /* F12 */) { e.preventDefault(); e.returnValue = false; } }); }); 

// 우측 클릭 방지 
		
		document.onmousedown=disableclick; 
		status="Right click is not available."; 
		function disableclick(event){
			 if (event.button==2) {
				  alert(status); return false; } }

 

  </script>
  <style>
   
   *{margin: 30px;}
   
   </style>
   
    <title>비밀번호 입력</title>
  </head>

  <body>
  
  
    <div class="main">
   
	<!-- 아이디 찾기 -->
	<form action="" method="post" onsubmit="return checkValue();" name="form" id="form">
      <table>
      <input type="hidden" value="${dto.one2one_idx }" name="one2one_idx" id="one2one_idx" />
        <tr>
          <td colspan="2">비밀번호를 입력해주세요</td>
        </tr>
        <tr><td><input type="hidden" value="${dto.one2one_pw }" name="password" id="password"/></td></tr>
        <tr>
        
         <td><input type="password" name="password_chk" id="password_chk"/></td>
        </tr>
        
        
      </table>
      <div>
      <input type="image" name="submit" value="submit" formaction = "user_one2one_view" src="http://bdmp-004.cafe24.com/cimg/btn_confirm.gif" > 
      
      <input type="image" onclick="window.close(); return false;"  src="http://bdmp-004.cafe24.com/cimg/btn_close.gif"> 
      </div>
     </form> 
      
    
      
    </div>
    
    <script>
    function checkValue() {
    	var idx = document.getElementById('one2one_idx').value;
        
  		if(document.getElementById( 'password_chk' ).value == '') { //empty: null, 길이 0
  			alert("비밀번호를 입력해주세요");
  			//document.getElementById('one2one_reply_title').focus();
  			return false; //submit전송이 안됨
  		}
  		if(document.getElementById( 'password' ).value != document.getElementById( 'password_chk' ).value) { 
  			alert("비밀번호가 틀립니다");
  			//document.getElementById('one2one_reply_title').focus();
  			return false; 
  		}
  		if(document.getElementById( 'password' ).value == document.getElementById( 'password_chk' ).value) { 
  			alert("비밀번호가 일치합니다");
  			//document.getElementById('one2one_reply_title').focus();
  		   // location.href="user_one2one_view?one2one_idx="+idx;

  		   popup_close();
  		   
    		 return false;
  		}
  		
  	}

    function popup_close()
	{
		opener.name="parent";
		document.form.method = "post";
		document.form.action = "/user_one2one_view";
		document.form.target = opener.window.name;
		document.form.submit();
		window.open("about:blank", "_self").close();
	}

  

    </script>
 

  </body>
</html>