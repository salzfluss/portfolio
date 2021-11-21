<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ page import="com.study.springboot.dto.One2oneDto" %>
<%@ page import="java.util.List"%>

<%
		List<One2oneDto> list = (List<One2oneDto>)request.getAttribute("list");
		System.out.println( "list count:" + list.size() );
		String list_page = (String)request.getAttribute("page");
		System.out.println( "list_page:" + list_page );
		String page1_active = "";
		String page2_active = "";
		String page3_active = "";
		if(list_page.equals("1")) 
			page1_active = "active";
		if(list_page.equals("2")) 
			page2_active = "active";
		if(list_page.equals("3")) 
			page3_active = "active";
	%>


<c:import url="user_header.jsp" />

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
  
 
  
<link rel="stylesheet" href="/css/user/user_one2one_list.css">
	<br><br><br><br><br>
	<div class="container">
       
        <div class="notice_text_div">
            <div class="notice_text">
                <div>
                    <h4>Q&A</h4>
                </div>
                <br>
                <div>
                    <p>궁금하신 사항을 적어주세요</p>
                    <p>최대한 빠르게 답변드릴 수 있도록 노력하겠습니다.</p>
                </div>
                <br>
                <div>
                <h6>*게시판 운영시간*</h6>
                <h6>월화수목금 13:00 - 17:00 (주말 및 공휴일 휴무)</h6>
                </div>    
            </div>
        </div>
   
    <br><br>
    	
    	
        <div class="qa">
        <table>
          <tr>
              <th>No.</th>
              <th>Category</th>
              <th>Subject</th>
              <th>Writer</th>
              <th>Date</th>
             
          </tr>
          <c:forEach var="user_dto" items="${ list }">
          	
	          <tr>
	            <td><input type="text" value="${ user_dto.one2one_idx }" name="one2one_idx" style="border: none; outline: none; width: 100px; text-align: center;"readonly/></td>
	            <td>${ user_dto.one2one_category }</td>
	            
	            <c:if test="${user_dto.one2one_pw ne null}">
	            <td><a href="" onclick="window.open('/user_one2one_pwchk?one2one_idx=${user_dto.one2one_idx}', '비밀번호 입력', 'width=430,height=340,location=no,status=no,scrollbars=no')">${ user_dto.one2one_title } &nbsp;&nbsp;&nbsp; <img src="/img/Lock.png" style="width:20px; height:15px; transform: translate(0px, -2px)"></a></td>
	          
	            </c:if>
	            
	            <c:if test="${user_dto.one2one_pw eq null}">
			
				 <td><a href="user_one2one_view?one2one_idx=${ user_dto.one2one_idx }"> ${ user_dto.one2one_title } </a></td>
			
				</c:if>
				
	            <td> ${ user_dto.one2one_name } </td>
	            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${user_dto.one2one_date}"/></td>
	          </tr>
	          
			

          </c:forEach>
          
        </table>
        </div>
        <br><br>
        
    
    <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="user_one2one?page=1" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item " id="page1"><a class="page-link" href="user_one2one?page=1"  onclick="activemode()">1</a></li>
    <li class="page-item " id="page2"><a class="page-link" href="user_one2one?page=2">2</a></li>
    <li class="page-item " id="page3"><a class="page-link" href="user_one2one?page=3">3</a></li>
    <li class="page-item">
      <a class="page-link" href="user_one2one?page=3" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
</nav>

        <br>
        <div class="buttons">
            
            
            <c:if test="${ memberDto.member_id ne null }">            
	            <div>           
	              <button class="btn btn-outline-secondary" id="post_button" name="post_button" onclick="location.href='user_one2one_write'">POST QUESTION</button>  
	            </div>
            </c:if>
            
             <c:if test="${ memberDto.member_id eq null }">            
	            <div>           
	              <button class="btn btn-outline-secondary" id="post_button" name="post_button" onclick="chk();">POST QUESTION</button>  
	            </div>
            </c:if>
            
            
        </div>
 </div>
        
         
  
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  	<br><br><br><br><br>
  	<script>


  	$(document).ready(function() { 

		var urllocation = window.location.search;

		if(urllocation == "?page=1"){

			document.getElementById("page1").className += " active";
			}
		if(urllocation == "?page=2"){

			document.getElementById("page2").className += " active";
			}
		if(urllocation == "?page=3"){

			document.getElementById("page3").className += " active";
			}
    	
	});


	function chk(){
		alert("로그인 해주세요");

		return false;
		}

  	</script>
  	
  	<c:import url="user_footer.jsp" />
