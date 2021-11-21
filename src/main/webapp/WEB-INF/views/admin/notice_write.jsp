
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<link rel="stylesheet" href="/css/admin/notice_contents.css">
<c:import url="header.jsp" />
   
        <div class="content">
            <div><h2>공지사항</h2></div>
            <form action="writeNotice" method="post" name="noticeBoard" onsubmit="return checkValue();" enctype="multipart/form-data">            
            <table class="notice_edit">
                <tr>
                
                    <td class="notice_table">제목</td>
                    <td>
                        <input type="text" name="notice_title" >
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
                    	<input type="file" name="file" accept="image/*" value="파일 선택" multiple>
                    </td>
                </tr>
                <tr>
                    <td class="notice_table">상세내용</td>
                    <td>
                    	<textarea id="notice_contents" cols="100" rows="20" name="notice_content">
                    		<c:out value="${notice_content}" />
                    	</textarea>
                   	</td>
                </tr>
            </table>
            
            
            <div class="notice_button">
                <input type="submit" value="등록" >
                <a href="notice_list"><button value="목록">목록</button></a>
            </div>
            </form>
        </div>
</body>

	<script>
		function checkValue() {
			if( !document.writeNotice.notice_title.value ){
				alert("제목을 입력하세요.");
				document.getElementById('notice_title').focus();
				return false;
			}
			if( !document.writeNotice.notice_content.value ){
				alert("내용을 입력하세요.");
				document.getElementById('notice_content').focus();
				return false;
			}
			return true;
		}
	</script>

    </body>
</html>