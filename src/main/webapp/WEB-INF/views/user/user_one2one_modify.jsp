<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>
    

<c:import url="user_header.jsp" />
<link rel="stylesheet" href="/css/user/user_one2one_write.css">

   <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
   <script src="https://cdn.ckeditor.com/ckeditor5/29.2.0/balloon/ckeditor.js"></script>
   
   
   <br><br><br><br><br>
	<div class="container">
	<form action="one2one_modify.do" method="post" onsubmit="return checkValue();" enctype="multipart/form-data">
		<div>			
		<input type="hidden" name="one2one_idx" value="${dto.one2one_idx}" />
		<input type="hidden" name="one2one_name" value="${ memberDto.member_id }" />
		
		
			<table>
				<tr>
					<td class="form-group" id="left_td">CATEGORY<br>
						<select class="form-control" id="exampleFormControlSelect1" name="one2one_category" >
						    <option value="">선택하세요</option>
						    <option value="상품" name="product" id="product">상품</option>
						    <option value="주문/결제" name="order_pay" id="order_pay">주문/결제</option>
						    <option value="배송" name="deliver" id="deliver">배송</option>
						    <option value="교환/환불" name="change_refund" id="change_refund">교환/환불</option>
						    <option value="기타" name="etc" id="etc">기타</option>
						</select>
					</td>
					<td class="form-group" id="right_td">SUBJECT<br>
					<input type="text" class="form-control" id="exampleFormControlInput1" name="one2one_title" value="${dto.one2one_title }" />
					</td>
					
				</tr>
				<tr>
				<td colspan="1" id="password">PASSWORD<br>
				<input type="text" class="form-control" id="exampleFormControlInput1 title" name="one2one_pw" placeholder="4자리 숫자" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='4' />
				</td>
				
				</tr>
				<tr>
					<td colspan="2" id="content">
					<textarea id="editor" name="one2one_content">${dto.one2one_content}</textarea>
					<script>
    				// 3. CKEditor5를 생성할 textarea 지정
				   	 ClassicEditor
				        .create( document.querySelector( '#editor' ),{
				            // 제거 하고싶은 플러그인 (배열)
				            // removePlugins: [ 'ImageUpload' ]
				            removePlugins: [ 'ImageUpload' ]
				            
				        } )
				        .catch( error => {
				            console.error( error );
				        } );
				   
   					</script>
					</td>
				</tr>
			
				<td colspan="3" id="imges"><br>
				
					
					
							<div class="file-edit-icon">
								<a  data-toggle="collapse"
							href="#collapseExample" role="button" aria-expanded="false" class="imgup"
							aria-controls="collapseExample" onclick="document.all.file.click(); bbsCheck()"> IMG + </a>  &nbsp; 
							
							( <a href="#" class="preview-edit">Alt</a> |
      					    <a href="#" class="preview-de">Del</a> )
      					    </div>
					
				
					<input type="file" id="file" accept="image/*" name="file"
					onchange="setThumbnail(event);" value="이미지 업로드" style="display: none;" multiple />
					
				
					
					<div id="image_container"> </div>
					
					
					  
   					    
  					  
					 
				</td>
			
			
			</table>
				
		</div>
	<br>
        <div class="buttons">
            <div>
			  <button type="button" class="btn btn-outline-secondary" id="back_button" name="back_button" onclick="location.href='user_one2one_view?one2one_idx=${dto.one2one_idx}'">CANCEL</button>  
            </div>
            <div>    
              <button type="submit" class="btn btn-outline-secondary" id="modify_button" name="modify_button" >MODIFY</button>  
            </div>       
        </div>
		</form>
	</div>
  	
  	<div class='bigPictureWrapper'>
		<div class='bigPicture'>
		</div>
	</div>
  	
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <br><br><br><br><br>
  	<c:import url="user_footer.jsp" />
  	
  	<script>
  	function checkValue() {
  		if(document.getElementById( 'exampleFormControlSelect1' ).value == '') { //empty: null, 길이 0
  			alert("카테고리를 선택해주세요");
  			//document.getElementById('one2one_reply_title').focus();
  			return false; //submit전송이 안됨
  		}
  		if(document.getElementById( 'exampleFormControlInput1' ).value == '') { //empty: null, 길이 0
  			alert("제목을 입력해주세요");
  			//document.getElementById('one2one_reply_title').focus();
  			return false; //submit전송이 안됨
  		}
  		if(document.getElementById( 'editor' ).value == '') { //empty: null, 길이 0
  			alert("내용을 입력해주세요");
  			//document.getElementById('one2one_reply_title').focus();
  			return false; //submit전송이 안됨
  		}
  		
  		return true;
  	}


   	/* 이미지 미리보기  */
   	function setThumbnail(event) { 

   		for (var image of event.target.files) { 
   			var reader = new FileReader(); reader.onload = function(event) { 
   				var img = document.createElement("img"); 
   				img.setAttribute("src", event.target.result); 
   				document.querySelector("div#image_container").appendChild(img); }; 
   				console.log(image); reader.readAsDataURL(image); } }



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

   	function handleFileSelect(event) {
	    var input = this;
	    console.log(input.files)
	    if (input.files && input.files.length) {
	        var reader = new FileReader();
	        this.enabled = false
	        reader.onload = (function (e) {
	        console.log(e)
	            $("#image_container").html(['<img class="thumb" src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''))
	        });
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	$('#file').change(handleFileSelect);
	$('.file-edit-icon').on('click', '.preview-de', function () {
	    $("#image_container").empty()
	    $("#file").val("");
	});
	$('.preview-edit').click( function() {
	  $("#file").click();
	} );


	
  	</script>
    </body>
</html>