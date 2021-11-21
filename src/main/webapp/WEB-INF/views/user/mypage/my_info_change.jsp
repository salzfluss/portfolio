<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />
<link rel="stylesheet" href="/css/user/my_info_change.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <div id="mypage_sec">
        <div class="mypage_list">
            <h3>마이페이지</h3>
            <ul class="mypage_list">
                <li><a href="my_order">주문내역</a></li>
                <li><a href="cart">장바구니</a></li>
                <li><a href="my_info_checkPw?member_id=${memberDto.member_id }">개인정보수정</a></li>
            </ul>
            <div class="qna_helper">
                <button id="qna_btn" onclick="location.href='/user'">
                    도움이 필요하신가요?<br>
                    1:1 문의하기
                </button>
            </div>
        </div>
        <form action="myInfoChange" method="post" name="userInfo" id="userInfo" onsubmit="return checkValue()">
        <div class="mypage_box">
            <div class="page_title">
                <h3>개인 정보 수정</h3>
            </div>
            <h5>기본 정보</h5>
            <div id="basic_info">
            
            	<input type="hidden" name="member_idx" value="${memberDto.member_idx }">
                <table>
                    <colgroup>
                        <col style="width:200px">
                    </colgroup>
                    <tbody class="myinfo_body">
                        <tr>
                            <th scope="row">
                                아이디*
                            </th>
                            <td>
                                <input type="text" class="MS_input_txt" name="member_id" value="${memberDto.member_id }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                현재 비밀번호
                            </th>
                            <td>
                                <input type="password" class="MS_input_txt" value="${memberDto.member_pw }">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                새 비밀번호*
                            </th>
                            <td>
                                <input type="password" class="MS_input_txt"  name="member_pw" id="member_pw">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                새 비밀번호 확인*
                            </th>
                            <td>
                                <input type="password" class="MS_input_txt" name="member_pw_check" id="member_pw_check" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                이름*
                            </th>
                            <td>
                                <input type="text" class="MS_input_txt" name="member_name" id="member_name" value="${memberDto.member_name }">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                이메일*
                            </th>
                            <td>
                                <input type="text" class="MS_input_txt" name="member_email1" id="member_email1" value="${memberDto.member_email1 }"> @
                                <input type="text" class="MS_input_txt" name="member_email2" id="member_email2" value="${memberDto.member_email2 }">
			                    <input type="button" class="modify_btn" onclick="emailCheck()" value="중복 확인" >
			                    <input type="hidden" name="member_email_check" id="member_email_check"  value="no">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                우편번호
                            </th>
                            <td>
                                <input type="text" class="MS_input_txt" name="member_postcode" id="member_postcode" value="${memberDto.member_postcode}">
                                <button type="button" class="modify_btn" onclick="showPostcode()">검색</button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                주소
                            </th>
                            <td>
                                <input type="text" class="MS_input_txt" name="member_address1" id="member_address1" value="${memberDto.member_address1 }">
                                <input type="text" class="MS_input_txt" name="member_address2" id="member_address2" value="${memberDto.member_address2 }">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                휴대폰*
                            </th>
                            <td>
                                <input type="text" class="MS_input_txt" name="member_phone" id="member_phone" value="${memberDto.member_phone }">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            <h5 class="add_title">추가 정보</h5>
            <div id="add_info">
                <table>
                    <colgroup>
                        <col style="width:200px">
                    </colgroup>
                    <tbody class="myinfo_body">
                        <tr>
                            <th scope="row">
                                성별
                            </th>
                            <td>
                                <input type="radio"  class="radio01" name="member_gender" id="member_gender" value="male" ${memberDto.member_gender eq 'male' ? "checked" : '' }>남자
			                    <input type="radio" class="radio01" name="member_gender" id="member_gender" value="female" ${memberDto.member_gender eq 'female' ? "checked" : '' }>여자
			                    <input type="radio" class="radio01" name="member_gender" id="member_gender" value="non" ${memberDto.member_gender eq 'non' ? "checked" : '' }>선택안함
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                생년월일
                            </th>
                            <td>
                           	  <input type="date" name="member_birthdate" id="member_birthdate" class="infoBox" pattern="\d{4}-\d{2}-\d{2}" >
                              <!-- <input type="text" value="${ memberDto.member_birthdate }" readonly> -->  
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">
                                선택약관 동의
                            </th>
                            <td>
                                <input type="checkbox" name="personal_info" value="radio1"><label class="radio01">개인정보처리방침(선택)</label>
                                <a href="#" style="font-size:13px" style="color:#37b47a">약관보기 ></a>
                            </td>
                        </tr> <br>
                        <tr>
                            <th scope="row">
                                이용약관동의*
                            </th>
                            <td class="txt01">
                                선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="benefit_box">
                <input type="checkbox" name="benefit_check" value="radio1"><label>무료배송 등 혜택/정보 수신</label>
                <div id="benefit_box01">
                    <input type="checkbox" name="benefit_check1" value="radio1"><label class="radio01">SMS</label>
                    <input type="checkbox" name="benefit_check1" value="radio1"><label class="radio01">이메일</label>
                </div>
            </div>
            <div id="check_btn_box">
                <button class="check_btn">탈퇴하기</button>
                <button type="submit" onclick="return modify()" class="check_btn" style="background-color: #c78e8e; color:white;">회원정보수정</button>
            </div>
           </form>
        </div>
        
        
        
        <script>



// 우편번호 찾기
function showPostcode() {
	new daum.Postcode({
		oncomplete : function(data){
			// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성하는 부분
			
			// 각 주소의 노출 규칙에 따라 주소를 조합한다
			// 내려오는 변수가 값이 없을 경우엔 공백('')값을 가지므로 이를 참고해서 분기한다
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수
			
			// 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다
			if(data.userSelectedType === 'R'){ // 사용자가 도로명 주소를 선택
				fullAddr = data.roadAddress;
			} else { // 지번 주소 선택
				fullAddr = data.jibunAddress;
			}
			
			// 사용자가 선택한 주소가 도로명 타입일 때 조합한다
			if(data.userSelectedType ==='R'){
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				if(data.buildingName !== ''){
					extraAddr += ( extraAddr !== ''?', ' + data.builingName : data.builingName );
				}
				
				// 조합형 주소 유무에 따라 양쪽 괄호 추가하여 최종 주소 만든다
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')': '');
			}
			
			// 우편번호와 주소정보를 해당 필드에 넣는다
			document.getElementById('member_postcode').value = data.zonecode; // 5자리 새 우편번호
			document.getElementById('member_address1').value = fullAddr;
			// 커서를 추가 상세주소 필드에 이동
			document.getElementById('member_address2').focus();
		}
	}).open();
}



function modifycheck() {

	alert("modifycheck");

	  if( document.userInfo.member_pw.value == null) { //empty: null, 길이 0
	        alert("비밀번호를 입력해주세요.");
	        document.getElementById('member_pw').focus();
	        return false; //submit전송이 안됨
	    }

		return modify();
		
	  	
		
	}

function modify(){
	 
	 if(confirm("정보를 수정합니다") == true){

			document.getElementById('userInfo').submit();
			
		}else{
			
		  return false;
		  
			}

	 }


function checkValue() {
    
	if( document.getElementById('member_pw').value == null) { //empty: null, 길이 0
        alert("비밀번호를 입력해주세요.");
        document.getElementById('member_pw').focus();
        return false; //submit전송이 안됨
    }
    
    
}

</script>
   
 
  <c:import url="../user_footer.jsp" />