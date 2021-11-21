<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="com.study.springboot.dto.One2oneReplyDto" %>
<%@ page import="java.util.List"%>
    

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/one2one_view.css">

			  <div class="communitySection2 container text-center">
      
      <div class="NoticeContent">
        <table>
          <tr>
            <th>제목</th>
            <td>${dto.one2one_title}</td>
          </tr>
          <tr>
            <th>문의자</th>
            <td>${dto.one2one_name}</td>
          </tr>
          <tr>
            <th>작성일</th>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.one2one_date}"/></td>
          </tr>
          <tr>
           <th>문의내용</th>
            <td>${dto.one2one_content}</td>
           
          </tr>
          <tr>
          <th>업로드한 이미지</th>
          <td><img src="${ dto.one2one_img }" style="display: none" onload="this.style.display=''" alt="이미지 없음"></td>
         
          </tr>
        </table>
       
        <br><br><br>
        
         <div class="pointer">
               <h6><i><u>Reply</u></i></h6> 
         </div>
         
       <br>
       
     
       
       <!-- list에 DATA가 없는경우 / reply_dto에 다음 데이터가 없는경우 -->
       
       <c:if test="${ fn:length(list) ==0 }">
       <p>답변을 새로 작성해 주세요</p>
       <form action="reply.do" method="post" name="reply_info" onsubmit="return checkValue();">
        <input type="hidden" name="one2one_reply_idx" value="${dto.one2one_idx}" />
     
        <table>
        <tr>
        	<th>작성자</th>
        	<td><input type="text" id="one2one_reply_name" name="one2one_reply_name" value="bijou관리자"></td>
        </tr>
          <tr>
            <th>답변제목</th>
            <td><input type="text" id="one2one_reply_title" name="one2one_reply_title"></td>
          </tr>
          <tr>
            <th>답변내용</th>
            <td><textarea id="one2one_reply_content" name="one2one_reply_content"></textarea></td>
          </tr>
        </table>
       
        <div class="buttons">
        	<div>
        	<button type="submit" name="reply_confirm" id="reply_confirm">답변완료</button>
     		</div>
        	 
        	<div>
        	<input type="button" id="to_list" name="to_list" onClick="location.href='one2one'" value="목록으로" />
     	    </div>
     	</div>
     	 </form>
       </c:if>
       
       <!-- list에 DATA가 존재하는경우 -->
       <c:if test="${ fn:length(list) > 0 }">
       
          <c:forEach var="reply_dto" items="${ list }"> 
	     	    
	     		<c:if test="${ one2one_idx eq reply_dto.one2one_reply_idx}">
	     		 <p>작성한 답글이 있습니다</p>
			     	<div>
			       	 <form action="modify.do" method="post">
			     	 <input type="hidden" name="one2one_reply_idx" value="${dto.one2one_idx}" />
					 <input type="hidden" name="one2one_reply_name" value="${ reply_dto.one2one_reply_name }" />
					 
			        <table>
			        <tr>
			        	<th>작성자</th>
			        	<td><input type="text" id="one2one_reply_name" value="${ reply_dto.one2one_reply_name }" disabled></td>
			        </tr>
			          <tr>
			            <th>답변제목</th>
			            <td><input type="text" id="one2one_reply_title" name="one2one_reply_title" value="${ reply_dto.one2one_reply_title }" ></td>
			          </tr>
			          <tr>
			            <th>답변내용</th>
			            <td><textarea id="one2one_reply_content" name="one2one_reply_content">${ reply_dto.one2one_reply_content }</textarea></td>
			          </tr>
			        </table>
			                <br>
			        
			        <div class="buttons">
			        	<div>
			        	<button type="submit" name="modify_confirm" id="reply_confirm">수정완료</button>
			     		</div>
			        	<div>
			        	<input type="button" id="to_list" name="to_list" onClick="location.href='one2one'" value="취소/뒤로" />
			     	    </div>
			     	</div>
			        </form>
			        </div>
	     		
	     		</c:if>    
	     	</c:forEach>
       </c:if>
     

        </div>
    
      </div>
      
      <div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
      
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
function checkValue() {
	if(document.getElementById( 'one2one_reply_title' ).value == '') { //empty: null, 길이 0
		alert("제목을 입력해주세요");
		//document.getElementById('one2one_reply_title').focus();
		return false; //submit전송이 안됨
	}
	if(document.getElementById( 'one2one_reply_content' ).value == '') { //empty: null, 길이 0
		alert("내용을 입력해주세요");
		//document.getElementById('one2one_reply_title').focus();
		return false; //submit전송이 안됨
	}
	
	return true;
}

$(document).ready(function (e){
	
	$(document).on("click","img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});//end click event
	
	function showImage(fileCallPath){
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='"+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 0);
	    
	  }//end fileCallPath
	  
	$(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 0);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 0);
	  });//end bigWrapperClick event
});

</script>
    </body>
</html>