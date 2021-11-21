<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.NoticeDto" %>

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/notice_contents.css">
   
        <div class="content">
            <div><h2>공지사항</h2></div>
            <form action="updateNotice" method="post">
            <input type="hidden" name="notice_idx" id="notice_idx" value="${noticeDto.notice_idx }">
            <table class="notice_edit">
                <tr>
                    <td class="notice_table">제목</td>
                    <td>
                        <input type="text" name="notice_title" value="${ noticeDto.notice_title}">
                    </td>
                </tr>
                 <tr>
                
                    <td class="notice_table">이름</td>
                    <td>
                        <input type="text" name="notice_name" value="bijou관리자" >
                    </td>
                </tr>
                <tr>
                    <td class="notice_table">이미지 선택</td>
                    <td>
                        <input type="file" name="file" value="${ noticeDto.notice_img }">
                    </td>
                </tr>
                <tr>
                    <td class="notice_table">상세내용</td>
                    <td>
                    	<textarea id="notice_contents" cols="100" rows="20" name="notice_content">
                    		<c:out value="${noticeDto.notice_content}" />
                    	</textarea>
                   	</td>
                </tr>
            </table>
    
            <div class="notice_button">
                <button type="submit" value="수정">수정</button>
              	<button value="삭제" type="button" name="delbt" id="delbt">삭제</button>
               <!--   <a href="deleteNotice?notice_idx=${noticeDto.notice_idx}"> -->
                <button value="목록" type="button" onclick="location.href='notice_list'">목록</button>
           
            </div>
            
        	</form>
       </div>
       <br><br><br><br>
       
       <script>
       $(document).ready(function () {
 		  $(document).on("click", "button[name='delbt']", function () {
 			var idx= document.getElementById('notice_idx').value;
 		    console.log(idx);

 		    if(confirm("정말 삭제하시겠습니까??") == true){
 		    	location.href="deleteNotice?notice_idx="+idx;
 				console.log("삭제되는idx"+idx);
 		    }else{
 		    	  return false;
 			    }
 		    
 		  });
 		});
 		
		
       </script>
</body>
</html>