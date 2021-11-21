<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>
    

<c:import url="../user_header.jsp" />

<link rel="stylesheet" href="/css/user/user_one2one_view.css">
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
   

<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div>
		<table>
			<tr>
				<td colspan="3" id="top_td"><a
					href="user_one2one_modify?one2one_idx=${dto.one2one_idx}">EDIT</a>
					/ <a href="javascript:del();">DELETE</a></td>

			</tr>
			<tr>
				<td class="form-group" id="title_td" colspan="3">

					<h5>[${dto.one2one_category}] ${dto.one2one_title}</h5>

				</td>
			</tr>
			<tr>
				<td colspan="3" id="name_td">

					<h6>${dto.one2one_name}
						/
						<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.one2one_date}" />
					</h6>

				</td>

			</tr>
			
			
			<tr>
			<td colspan="3" id="content"><br>
					<textarea name="one2one_content" id="description">${dto.one2one_content}</textarea>
					<script>
    				// 3. CKEditor5를 생성할 textarea 지정
				   	
						ClassicEditor.create( document.querySelector('#description' ),{removePlugins: [ 'ImageUpload'  ]} )
					     .then(editor => { 
					          console.log( editor ); 
					          editor.isReadOnly = true; // make the editor read-only right after initialization
					          
					     } ) .catch( error => { 
					          console.error( error ); 
					     } );
   					</script>
   					
					</td>
			
			</tr>
			
			
				<td colspan="3" id="imges"><br>
					<p><img src="${dto.one2one_img }" class="imges" style="display: none" onload="this.style.display=''" alt="이미지 없음"> <p>
					  
				</td>
		
			
			<tr>
			
			<!-- list에 DATA가 없는경우 / reply_dto에 다음 데이터가 없는경우 -->
       
       <c:if test="${ fn:length(list) ==0 }">
     	
     		<td colspan="3" id="coments"><br>
					<p>
						<a  data-toggle="collapse"
							href="#collapseExample" role="button" aria-expanded="false"
							aria-controls="collapseExample"> COMENTS </a>
					</p>
					<div class="collapse" class="media" id="collapseExample">

						
					<h6>&nbsp;&nbsp;아직 답글이 없습니다</h6>
					
					</div></td>
     	
       </c:if>
       
			 <!-- list에 DATA가 존재하는경우 -->
       <c:if test="${ fn:length(list) > 0 }">
       
          <c:forEach var="reply_dto" items="${ list }"> 
	     	    
	     		<c:if test="${ dto.one2one_idx eq reply_dto.one2one_reply_idx}">
	     		
	     		 	<td colspan="3" id="coments"><br>
					<p>
						<a  data-toggle="collapse"
							href="#collapseExample" role="button" aria-expanded="false"
							aria-controls="collapseExample"> COMENTS </a>
					</p>
					<div class="collapse" class="media" id="collapseExample">

						
							<h6 class="mt-0">&nbsp; &nbsp; ${ reply_dto.one2one_reply_name }</h6>
							<br>
							<h6>&nbsp; &nbsp; ${ reply_dto.one2one_reply_content }</h6>
					
					</div></td>
	     		
	     		</c:if>    
	     	</c:forEach>
       </c:if>
	   	</tr>
			
		</table>
		<br>
		<br> <a href="user"> -Back to List- </a>
	</div>
</div>

<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>

<script>
	function del() {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='user_one2one_delete?one2one_idx=${dto.one2one_idx}';
		}
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

  <br><br><br><br><br>
  

  
  	<c:import url="../user_footer.jsp" />